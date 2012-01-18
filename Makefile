ULP_SCRIPTS := $(wildcard *.ulp)
DIST := $(ULP_SCRIPTS) AUTHORS COPYING Makefile README.txt

all:

dist: copypaste.zip

%.tar.bz2: $(DIST)
	tar -c --exclude-vcs --transform="s@^@$*/@" $^ | bzip2 -cz9 > $@

%.tar.gz: $(DIST)
	tar -c --exclude-vcs --transform="s@^@$*/@" $^ | gzip -cn9 > $@

%.tar.xz: $(DIST)
	tar -c --exclude-vcs --transform="s@^@$*/@" $^ | xz -cz9 > $@

%.zip: $(DIST)
	rm -rf $*
	mkdir $*
	cp $^ $*
	zip -9 -r -q $@ $*
	rm -rf $*

clean:
	rm -f *.tar.* *.zip

.PHONY: all clean dist
