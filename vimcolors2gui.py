#!/usr/bin/env python3
from sys import argv
from re import compile as regexp
from config import lookup

REGEX_HIGHLIGHT = regexp(r"^hi\s+(\w+)\s+(.*)")
REGEX_PARAM = regexp(r"(\w+)=([^\s]+)")

palette = {
    "name": "",
    "author": "",
    "color": [
        lookup('color.{}'.format(i)) for i in range(16)
    ],
    "foreground": "#658798",
    "background": "#1e2138"
}

BRIGHTNESS_LUT = [ 0x00, 0x66, 0x88, 0xbb, 0xdd, 0xff ]

def pal256torgb(index):
    if index >= 232 and index <= 255:
        value = int(((index - 232) / 24) * 255)
        return "#%02x%02x%02x" % (value, value, value)
    elif index <= 15:
        return palette["color"][index]
    else:
        index -= 16
        b = BRIGHTNESS_LUT[index % 6]
        index //= 6
        g = BRIGHTNESS_LUT[index % 6]
        index //= 6
        r = BRIGHTNESS_LUT[index % 6]
        return "#%02x%02x%02x" % (r, g, b)


with open(argv[1], "r") as f_in:
    for line in f_in:
        line = line.strip()
        if (match := REGEX_HIGHLIGHT.match(line)):
            syntax, options = match.groups()
            options = dict(REGEX_PARAM.findall(options))

            if (ctermfg := options.get('ctermfg')):
                if ctermfg == 'NONE':
                    options['guifg'] = 'NONE'
                else:
                    options['guifg'] = pal256torgb(int(ctermfg))

            if (ctermbg := options.get('ctermbg')):
                if ctermbg == 'NONE':
                    options['guibg'] = 'NONE'
                else:
                    options['guibg'] = pal256torgb(int(ctermbg))

            if (cterm := options.get('cterm')):
                options['gui'] = cterm

            options_str = str.join(' ', [
                '%-16s' % ('%s=%s' % (k, v))
                for k, v in options.items()
            ]).strip()

            print('%-24s' % ('hi %s' % syntax), options_str)
        else:
            print(line)

