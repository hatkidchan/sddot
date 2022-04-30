
clean:
	rm -rvf ./build ./sources/{dmenu,st}/config.h
	rm -rvf ./sources/st/boxdraw*
	( cd sources/dmenu && make clean; git restore * )
	( cd sources/st && make clean; git restore * )

install:
	cp -vr build/. ~/

i3: ./build/.config
	cp -vr ./i3/.config/i3 ./build/.config/
	python3 replace.py ./i3/.config/i3/config > ./build/.config/i3/config
	python3 replace.py ./i3/.Xresources > ./build/.Xresources
	python3 replace.py ./i3/.config/i3/autostart.sh > ./build/.config/i3/autostart.sh

polybar: ./build/.config
	cp -vr ./polybar/.config/polybar ./build/.config/
	python3 replace.py ./polybar/.config/polybar/config.ini > ./build/.config/polybar/config.ini
	$(CC) ./build/.config/polybar/info-speed.c -o ./build/.config/polybar/info-speed -lm

dunst: ./build/.config
	cp -vr ./dunst/.config/dunst ./build/.config/
	python3 replace.py ./dunst/.config/dunst/dunstrc > ./build/.config/dunst/dunstrc

nvim: ./build/.config
	cp -vr ./nvim/.config/nvim ./build/.config
	python3 ./vimcolors2gui.py ./nvim/.config/nvim/colors/madeline.term.vim > ./build/.config/nvim/colors/madeline.vim

build/.config:
	mkdir -vp ./build/.config

sources/dmenu/dmenu:
	rm -f sources/dmenu/config.h
	( cd sources/dmenu && git restore * )
	( cd sources/dmenu && git apply < ../../patches/dmenu.patch )
	python3 replace.py sources/dmenu/config.def.h > sources/dmenu/config.h
	( cd sources/dmenu && make clean all )

sources/st/st:
	rm -f sources/st/config.h
	( cd sources/st && git restore * )
	( cd sources/st && git apply < ../../patches/st.patch )
	python3 replace.py sources/st/config.def.h > sources/st/config.h
	( cd sources/st && make clean all )
