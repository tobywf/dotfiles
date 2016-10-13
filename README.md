Toby's macOS dotfiles
=====================

Currently only for macOS. Updated for macOS Sierra (10.12).

My dotfiles use a [bare git repo](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
and a (heavily modified version) Mathias Bynens' [legendary macOS defaults script](https://github.com/mathiasbynens/dotfiles/blob/master/.macos).

Previously I used Ansible. But it was somewhat tedious keeping changes to the
system in sync with the Ansible roles. The bare git repo approach makes this
super easy. On that note, the setup and macOS setting scripts
(`~/.local/share/bin/`) are idempotent, so they can be updated and then those
updates applied.

I've also "solved" the "I don't want to put sensitive files in a git repo"
problem by using backup and bootstrap scripts (`~/.local/share/bin/`), which
produce a tarball that I can copy with a USB stick. Hardly high-tech, but it
works.
