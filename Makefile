DESTDIR ?= /usr/local
BINDIR = ${DESTDIR}/bin
MANDIR = ${DESTDIR}/share/man
VERSION := "0.1"

install:
	install -d ${BINDIR}
	install -m 755 colgrep ${BINDIR}
	install -d ${MANDIR}/man1
	install -m 644 colgrep.1 ${MANDIR}/man1

uninstall:
	rm -f ${BINDIR}/colgrep

test:
	@bats test/colgrep.bats

man: colgrep.1

colgrep.1: colgrep.1.md
	marked-man --version=${VERSION} colgrep.1.md > colgrep.1

.PHONY: install uninstall test man


