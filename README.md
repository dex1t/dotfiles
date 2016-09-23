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

And install brew-bundle ([work around](http://qiita.com/matsu_chara/items/78d0d0299a2f45270046))

```bash
$ brew tap matsu-chara/brew-bundle
$ brew install brew-bundle
```

### 4. Install others by homebrew
```bash
$ brew bundle
```

### 5. Link dotfiles
```bash
$ ./scripts/symlinks.sh
$ ln -s ~/dotfiles/scripts/trash.sh /usr/local/etc/trash.sh
```

:dancers:
