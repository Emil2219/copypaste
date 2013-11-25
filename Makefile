VERSION := 3
ULP_SCRIPTS := \
	copy.ulp \
	copypaste_config.ulp \
	copypaste_functions.ulp \
	paste.ulp \
	$(NULL)
DIST := $(ULP_SCRIPTS) AUTHORS COPYING Makefile README.txt

define \n


endef

all:

dist: copypaste-v$(VERSION).zip

%.tar.bz2: $(DIST)
	tar -c --exclude-vcs --transform="s@^@$*/@" $^ | bzip2 -cz9 > $@

%.tar.gz: $(DIST)
	tar -c --exclude-vcs --transform="s@^@$*/@" $^ | gzip -cn9 > $@

%.tar.xz: $(DIST)
	tar -c --exclude-vcs --transform="s@^@$*/@" $^ | xz -cz9 > $@

%.zip: $(DIST)
	rm -rf $*
	mkdir $*
	$(foreach textfile,$^,unix2dos -n $(textfile) $*/$(textfile)$(\n))
	zip -9 -r -q $@ $*
	rm -rf $*

clean:
	rm -f *.tar.* *.zip

.PHONY: all clean dist
