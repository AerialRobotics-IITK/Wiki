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
Once you've installed Git on your system, you need to configure some of its components before you can use it, such as the username, email address, and the default text editor. This configuration will be a one-time process, and your configured settings should last as long as you don't remove Git from your system.

**Create an Identity for Git**

To begin with, you first need to set up a default identity (username and email address) for every commit you make on your system. There are two ways to do this. You can either set a global identity so that all the commits you push go through the same identity or set a per-repository identity to use separate identities for different projects.

To set a global identity, open the terminal and run the below commands:
```bash
git config --global user.name "your_name"
git config --global user.email "your_email_address"
```
**Configure SSH for Git on Linux**

Furthermore, although not necessary, you can also set up SSH for Git on your computer to allow password-less logins. That way, you don't have to enter your password every time you want to commit changes to a repository.

To do this, open a terminal window and run the following command to create a new SSH key with your email:
```bash
ssh-keygen -t rsa -b 4096 -C "your_email_address"
```
When you're prompted to "Enter a file in which to save the key", you can press Enter to accept the default file location. Please note that if you created SSH keys previously, ssh-keygen may ask you to rewrite another key, in which case we recommend creating a custom-named SSH key. To do so, type the default file location and replace id_ssh_keyname with your custom key name.
```bash
 Enter a file in which to save the key (/Users/YOU/.ssh/id_ALGORITHM: [Press enter]
 ```
The system will now ask you to set a passphrase to add an additional layer of security to SSH on your machine. Type a strong passphrase that you can remember and hit Enter.

Finally, you need to add the SSH key to the ssh-agent, which holds your system's private keys. For this, run the following code in the terminal:
```bash
ssh-add ~/.ssh/id
```
Once you've configured your identity, you can configure Git further to suit your workflow.

**Full Guide to Ubuntu Customization Desktop**
Customizing is adjusting the appearance that makes the system comfortable and pleasant for daily usage.The Linux system has introduced several desktop environments for the Ubuntu operating system. All of them are well customized and keep the user’s preferences in mind. You can follow the steps given in this website to customise your Ubuntu.

{% embed url="https://linuxhint.com/desktop-customization-ubuntu/" caption="" %}

**Install Codecs & Microsoft Fonts**
Codecs & Microsoft fonts don’t come pre-installed on Ubuntu due to licensing issues. Codecs allow Ubuntu to play certain media formats. Microsoft fonts improve the compatibility of LibreOffice with documents created with Microsoft Word (doc, docx etc) and also provide you such popular fonts as Arial, Comic Sans, Times New Roman.

We can install codecs and Microsoft fonts with the following command:
```bash
sudo apt install ubuntu-restricted-extras ubuntu-restricted-addons
```
### Code editors:

{% hint style="warning" %}
Only one of the following is required.
{% endhint %}

Visual Studio Code is an open-source and free source code editor developed by Microsoft for Windows, Linux and macOS. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring.

Download it here:

{% embed url="https://code.visualstudio.com" caption="" %}


Sublime Text is a proprietary cross-platform source code editor with a Python application programming interface. To install, follow this page:

{% embed url="https://www.sublimetext.com/docs/3/linux\_repositories.html" caption="" %}

**How To Install The Latest Version of Eclipse on Ubuntu**

Eclipse is one such IDE that is primarily used for Java development. It can also be used with other languages, such as — C++, PHP, etc. Other languages support can be added on top of an existing installation or they can be installed as separate Eclipse packages.
```bash
sudo snap install eclipse --classic
```

