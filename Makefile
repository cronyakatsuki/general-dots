BASE=$(PWD)
BIN = $(HOME)/bin
CONFIG = $(HOME)/.config
MKDIR = mkdir -p
LN = ln -vsf
LNDIR = ln -vs
PKGINSTALL = paru -S --noconfirm --needed


zathura: ## Install and setup zathura configuration
	$(PKGINSTALL) zathura zathura-pdf-mupdf
	mkdir -p $(CONFIG)/zathura
	$(LN) $(BASE)/.config/zathura/* $(CONFIG)/zathura

mpd: ## Install and setup mpd configuration
	$(PKGINSTALL) mpd mpdris2 ncmpcpp
	mkdir -p $(CONFIG)/mpd
	mkdir -p $(CONFIG)/ncmpcpp
	mkdir -p $(CONFIG)/mpDris2
	$(LN) $(BASE)/.config/mpd/* $(CONFIG)/mpd
	$(LN) $(BASE)/.config/ncmpcpp/* $(CONFIG)/ncmpcpp
	$(LN) $(BASE)/.config/mpDris2/* $(CONFIG)/mpDris2

newsboat: ## Install and setup newsboat configuration
	$(PKGINSTALL) newsboat cronie
	sudo systemctl enable cronie
	mkdir -p $(CONFIG)/newsboat
	$(LN) $(BASE)/.config/newsboat/* $(CONFIG)/newsboat
	echo "# minute hour day_of_month month day_of_week command \n*/30  *        *         *        *      /usr/bin/newsboat -x reload" | crontab

transmission-daemon: ## Install and setup transmission-daemon configuration
	$(PKGINSTALL) transmission-cli
	mkdir -p $(CONFIG)/transmission-daemon
	$(LN) $(BASE)/.config/transmission-daemon/* $(CONFIG)/transmission-daemon
