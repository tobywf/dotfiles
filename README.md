Toby's macOS dotfiles
=====================

Currently only for macOS. Updated for macOS Sierra (10.12).

My dotfiles use a [bare git repo](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
and a heavily modified version of Mathias Bynens' [legendary macOS defaults script](https://github.com/mathiasbynens/dotfiles/blob/master/.macos).

Previously I used Ansible. But it was somewhat tedious keeping changes to the
system in sync with the Ansible roles. The bare git repo approach makes this
super easy. On that note, the setup and macOS setting scripts
(`~/.local/share/bin/`) are idempotent, so they can be updated and then those
updates "applied" by simply running them.

I've also "solved" the "I don't want to put sensitive files in a git repo"
problem by using backup and bootstrap scripts (`~/.local/share/bin/`), which
produce a tarball that I can copy with a USB stick. Hardly high-tech, but it
works.

## Meld

The version of Meld that Homebrew usually installs needs X11 and looks ugly as
sin. However, Youssef A. Abou-Kewik has [created a GTK, *.dmg version](https://github.com/yousseb/meld).
So I wrote [a quick caskfile](https://gist.github.com/tobywf/f731a9aa9ebaec47bb098af9d90cb8b5)
so it downloaded and symlinked correctly. You should be able to use the gist
URL to install Meld.

## How to back up

```
~/.local/share/bin/dot-backup
```

This script will also warn you if there are uncommitted changes to the dotfile
repository, which seems like a good idea.

## How to install

The tarball contains everything needed to bootstrap, no dreaded `curl | bash`
necessary. The steps are extremely simple:

```
cd "$HOME"
tar -xzvf backup-*.tar.gz
chmod +x ./dot-bootstrap
./dot-bootstrap && rm ./dot-bootstrap
```

Then be patient, as numpy/scipy take forever to compile and mactex takes
forever to download (~3 GiB).

## What doesn't automatically get set up?

(This section is a note to myself.)

Some of my purchased apps are less hassle to get via the Mac App Store instead
of Homebrew (Airmail, Divvy, Pixelmator, The Archive Browser).

* 1password can be easily be set up from the backup extracted from the tarball,
  and is number 1 priority, along with Airmail
* calibre relies on dropbox
* google-chrome needs signing in
* keybase, not sure if the GUI is even useful?
* spotify needs signing in
* steam needs signing in, potential long auto-update

TODO: Figure out what changes when using proper 2FA instead of phone.
