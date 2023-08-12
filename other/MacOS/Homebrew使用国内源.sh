#!/bin/bash

# 本脚本适用于MacOS13，旧版本请参考https://zhuanlan.zhihu.com/p/157067214
cd ~
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh >> brew_install

vim brew_install
#替换以下内容
# HOMEBREW_BREW_DEFAULT_GIT_REMOTE="https://github.com/Homebrew/brew"
HOMEBREW_BREW_DEFAULT_GIT_REMOTE="git://mirrors.ustc.edu.cn/brew.git"
# HOMEBREW_CORE_DEFAULT_GIT_REMOTE="https://github.com/Homebrew/homebrew-core"
HOMEBREW_CORE_DEFAULT_GIT_REMOTE="git://mirrors.ustc.edu.cn/homebrew-core"
#   ${tty_underline}https://github.com/Homebrew/brew#donations${tty_reset}
  ${tty_underline}git://mirrors.ustc.edu.cn/brew.git#donations${tty_reset}
# 保存文件
:wq!

/bin/bash brew_install

cd "$(brew --repo)"
git remote set-url origin git://mirrors.ustc.edu.cn/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git
/bin/bash ~/brew_install
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-cask"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
source ~/.zshrc



# 恢复命令
cd "$(brew --repo)"
git remote set-url origin https://github.com/Homebrew/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://github.com/Homebrew/homebrew-core.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-cask"
git remote set-url origin https://github.com/Homebrew/homebrew-cask.git