MANDIR=/usr/share/man
BINDIR=/usr/local/bin

all:
	@echo "Nothing to make. Use \`sudo make install\` to install."

install: install-bin install-man

uninstall:
	- rm $(BINDIR)/fin-add $(BINDIR)/fin-month $(BINDIR)/fin-year
	- rm $(MANDIR)/man1/fin-add.1.gz $(MANDIR)/man1/fin-month.1.gz $(MANDIR)/man1/fin-year.1.gz
	- mandb
	@echo -e "\033[0;32m → uninstalled finance scripts\033[0m"

install-bin: $(BINDIR)/fin-add $(BINDIR)/fin-month $(BINDIR)/fin-year
	@echo -e "\033[0;32m → installed script files to $(BINDIR)\033[0m"
	
$(BINDIR)/fin-add: fin-add
	cp $< $@

$(BINDIR)/fin-month: fin-month
	cp $< $@

$(BINDIR)/fin-year: fin-year
	cp $< $@

install-man: $(MANDIR)/man1/fin-add.1.gz $(MANDIR)/man1/fin-month.1.gz $(MANDIR)/man1/fin-year.1.gz
	@echo -e "\033[0;32m → installed man pages to $(MANDIR)\033[0m"
	mandb
	@echo -e "\033[0;32m → mandb updated\033[0m"

$(MANDIR)/man1/fin-add.1.gz: fin-add.1
	gzip <$< >$@

$(MANDIR)/man1/fin-month.1.gz: fin-month.1
	gzip <$< >$@

$(MANDIR)/man1/fin-year.1.gz: fin-year.1
	gzip <$< >$@
