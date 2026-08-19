git clone --bare git@github.com:korbbruh/dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
Flatpak apps need org.gtk.Gtk3theme.adw-gtk3-dark installed separately.
