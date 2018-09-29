PREFIX=/usr/local
MANDIR=$(PREFIX)/share/man
BINDIR=$(PREFIX)/bin

BIN=fin-add fin-month fin-year fin-month-prepare-plot fin-month-plot

all:
	@echo -e "Nothing to make. Use \`\033[0;32msudo make install\033[0m\` to install."

install: install-bin install-man
	@echo -e "Installation complete. Maybe you want to run \`\033[0;32mhash -r\033[0m\` to update your PATH executables?"

uninstall:
	- rm $(addprefix $(BINDIR)/, $(BIN))
	- rm $(addprefix $(MANDIR)/man1/, $(addsuffix .1.gz, $(BIN)))
	- mandb
	@echo -e "\033[0;32m → uninstalled finance scripts\033[0m"

package: pkgdirs $(addprefix $(PACKAGE)$(BINDIR)/, $(BIN)) $(addprefix $(PACKAGE)$(MANDIR)/man1/, $(addsuffix .1.gz, $(BIN)))
	@echo -e "\033[0;32m → package prepared\033[0m"

pkgdirs:
	@mkdir -p $(PACKAGE)$(BINDIR)
	@mkdir -p $(PACKAGE)$(MANDIR)/man1

$(PACKAGE)$(BINDIR)/%: %
	@cp $< $@

$(PACKAGE)$(MANDIR)/man1/%.1.gz: %.1
	@gzip <$< >$@

install-bin: $(addprefix $(BINDIR)/, $(BIN))
	@echo -e "\033[0;32m → installed script files to $(BINDIR)\033[0m"
	
$(BINDIR)/%: %
	@cp $< $@

install-man: $(addprefix $(MANDIR)/man1/, $(addsuffix .1.gz, $(BIN)))
	@echo -e "\033[0;32m → installed man pages to $(MANDIR)\033[0m"
	mandb
	@echo -e "\033[0;32m → mandb updated\033[0m"

$(MANDIR)/man1/%.1.gz: %.1
	@gzip <$< >$@
