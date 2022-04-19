#include <sys/select.h>
#include <sys/time.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define INTERVAL 2000

void msleep(uint64_t ms);
void read_iface_usage(char *name, uint64_t *rx_bytes, uint64_t *tx_bytes);
void humanize_bytes(char *str, size_t size, uint64_t bytes);
void get_all_iface_usage(char **names, int num, uint64_t *rx, uint64_t *tx);

int main(int argc, char **argv)
{
    uint64_t old_rx, old_tx, new_rx, new_tx, delta_rx, delta_tx;
    char str_rx[255], str_tx[255];
    get_all_iface_usage((argv + 1), argc - 1, &old_rx, &old_tx);
    for (;;) {
        get_all_iface_usage((argv + 1), argc - 1, &new_rx, &new_tx);
        delta_rx = new_rx - old_rx; delta_tx = new_tx - old_tx;
        delta_rx /= (float)(INTERVAL / 1000.0);
        delta_tx /= (float)(INTERVAL / 1000.0);
        old_rx = new_rx; old_tx = new_tx;
        humanize_bytes(str_rx, 255, delta_rx);
        humanize_bytes(str_tx, 255, delta_tx);
        printf("[%s/s|%s/s]\n", str_rx, str_tx);
        fflush(stdout);
        msleep(INTERVAL);
    }
}

void msleep(uint64_t ms)
{
    struct timeval tv;
    tv.tv_sec = ms / 1000;
    tv.tv_usec = (ms % 1000) * 1000;
    select(0, NULL, NULL, NULL, &tv);
};

void read_iface_usage(char *name, uint64_t *rx_bytes, uint64_t *tx_bytes)
{
    char path_rx[255], path_tx[255];
    snprintf(path_rx, 255, "/sys/class/net/%s/statistics/rx_bytes", name);
    snprintf(path_tx, 255, "/sys/class/net/%s/statistics/tx_bytes", name);
    FILE *fd_rx = fopen(path_rx, "r"),
         *fd_tx = fopen(path_tx, "r");
    fscanf(fd_rx, "%zd", rx_bytes);
    fscanf(fd_tx, "%zd", tx_bytes);
    fclose(fd_rx);
    fclose(fd_tx);
}

void get_all_iface_usage(char **names, int num, uint64_t *rx, uint64_t *tx)
{
    *rx = 0; *tx = 0;
    uint64_t trx, ttx;
    for (int i = 0; i < num; i++) {
        read_iface_usage(names[i], &trx, &ttx);
        *rx += trx;
        *tx += ttx;
    }
}

void humanize_bytes(char *str, size_t size, uint64_t bytes)
{
    char prefixes[7] = "kMGTP";
    if (bytes < 1024)
    {
        snprintf(str, size, "%6.1f   B", (double)bytes);
        return;
    }
    int index = (int)floor(log(bytes) / log(1024.f));
    float value = bytes / pow(1024, index);
    snprintf(str, size, "%6.1f %ciB", value, prefixes[index - 1]);
}
