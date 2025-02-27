# NIXOS Configurations

Repo holds all my [NIXOS](https://wiki.nixos.org/wiki/Overview_of_the_NixOS_Linux_distribution) configurations for my laptop and desktop.
Uses [NIV](https://github.com/nmattia/niv) instead of [Nix-Channels](https://nixos.wiki/wiki/Nix_channels)
- `hosts` - each kind of machine I have configured (e.g. laptops, desktops, servers, WSL...)
- `modules` - have all the groups of software I want on each machine
- `servers` - modules for different services I have configured to be able to run on native NixOS systems
- `hardware` - different hardware specifc modules for different configurations (e.g. Nvidia/Intel GPUs, TPM2.0 hardware, ...)
- `home_manager` - user-level configuraiton for my desktop environments. [See](https://github.com/nix-community/home-manager), uses [Plasma-manager](https://github.com/nix-community/plasma-manager).
- `users` - system-level user configuration that my contain myself and/or my friends
- `secrets`- [sops](https://github.com/Mic92/sops-nix) module, may remove later. Not a fan of having any keys publicly hosted even if encrypted. Nothing sensitive hosted currently.
- `nix` - depdencies from NIV

### Why I use Nix/NixOS (small rant)
When I first switched from Windows to Linux (circa Dec 2019), I started out on [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux).
It was a trial-by-fire but the wiki and the OS taught me alot about Linux and System Administration.
While time consuming, it was managable until I put Arch Linux on my Laptop.
Eventually (~May 2024), the two seperate Arch Linux configurations on Desktop/Laptop was getting to me, and my desktop became unusable without reinstalling Arch Linux again; my systems were getting very bloated.
About every 1-3 months, one or both of my machines would each have a new, unique bug that took anywhere from 3 hours to 3 days to resolve and had different soltuions on each machine.
Even if I fixed the bug on one machine, I would have to re-create the same fix on the other machine.
Not to mention juggling work, school, and personal life pressures depending on my ability to make sure my computers are working properly.

NixOS allowed me to:
- Source control my system configuration (this repo)
- Unify the desktop environment experience between my Desktop and Laptop (see [home-manager](https://github.com/nix-community/home-manager))
- [temporarily use software](https://nix.dev/tutorials/first-steps/ad-hoc-shell-environments.html) without worrying about dependency managment, special configurations, or forgetting to uninstall it later
- Avoid having config files [in more than one place](https://wiki.archlinux.org/title/XDG_Base_Directory), with completely different syntaxes per file
- [rollback breaking changes](https://nixos.org/manual/nixos/unstable/#sec-rollback) to the system if anything causes it to break (happened frequently on Arch Linux)
- Install [multiple versions of software](https://nixos.org/guides/how-nix-works/) without conflicts
- Use [nix flakes](https://wiki.nixos.org/wiki/Flakes) for more consistent development environments, which I have been using for school repos. See:
  - [CDA_Project1](https://github.com/xTechon/CDA_Project1)
  - [CV_prog1](https://github.com/xTechon/CV_prog1)
  - [Embedded-Systems](https://github.com/xTechon/Embedded-Systems)
  - [Intro-to-Cryptology](https://github.com/xTechon/Intro-to-Cryptology)

In Short, NixOS allowed me to solve problems one time and have it fixed on all my machines.
