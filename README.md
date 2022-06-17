### 1. Install Xcode CLI tools
Open Xcode and install CLI tools.
You can check to see if Xcode CLI tools are installed by running the following command:
```bash
$ clang --version
```

### 2. Clone this repository
```bash
$ git clone git://github.com/dex1t/dotfiles.git
```

### 3. Install Homebrew
```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### 4. Install others by homebrew
```bash
$ brew tap Homebrew/bundle
$ brew bundle
```

### 5. Link dotfiles
```bash
$ ./scripts/symlinks.sh
$ sudo mkdir /opt/mine && sudo chown $(whoami) /opt/mine
$ ln -s ~/dotfiles/scripts/trash.sh /opt/mine/trash.sh
```

### 6. Settings for vim
Install [neobundle.vim](https://github.com/Shougo/neobundle.vim#1-install-neobundle)

```bash
$ vim # Run NeoBundleInstall command
```

:dancers:
