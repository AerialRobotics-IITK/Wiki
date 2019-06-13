---
description: Run Ubuntu.
---

# Basic Linux Setup

## Update Ubuntu

After installing Ubuntu, open the terminal and run the following commands:

```bash
sudo apt-get update
sudo apt-get upgrade
```

## Time Sync with Windows 10

After installing Ubuntu in dual boot with Windows 10 , the time is usually messed up in both the systems. The link below provides the details.

{% embed url="http://ubuntuhandbook.org/index.php/2016/05/time-differences-ubuntu-1604-windows-10/" %}

Or type the following command in your Ubuntu 16.04 Terminal

```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```

And then set the time on Linux and Windows manually.

NOTE: For lower Ubuntu versions, edit the `/etc/default/rcS` file.



## Install basic tools

### Vim:

{% embed url="https://www.vim.org" caption="" %}

Vim is a highly configurable text editor. Run the following command in the terminal to install it:

```bash
sudo apt-get install vim
```

{% hint style="info" %}
Useful for TUI \(Terminal User Interface\) based debugging.
{% endhint %}

### Git:

{% embed url="https://github.com" caption="" %}

Git is a free and open source distributed version control system. To install it:

```bash
sudo apt-get install git
```

### Code editors:

{% hint style="warning" %}
Only one of the following is required.
{% endhint %}

Visual Studio Code is an open-source and free source code editor developed by Microsoft for Windows, Linux and macOS. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring.

Download it here:

{% embed url="https://code.visualstudio.com" caption="" %}

Atom is a free and open-source text and source code editor for macOS, Linux, and Microsoft Windows with support for plug-ins written in Node.js, and embedded Git Control, developed by GitHub. To install it, follow this page:

{% embed url="https://flight-manual.atom.io/getting-started/sections/installing-atom/" caption="" %}

Sublime Text is a proprietary cross-platform source code editor with a Python application programming interface. To install, follow this page:

{% embed url="https://www.sublimetext.com/docs/3/linux\_repositories.html" caption="" %}

