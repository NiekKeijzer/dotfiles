fpath=(~/.zsh $fpath)

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export GOPATH="/Users/niekkeijzer/go/"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/Library/TeX/texbin:$PATH"

export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

 # Create a JAVA_HOME variable, determined dynamically
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
# Add that to the global PATH variable
export PATH=${JAVA_HOME}/bin:$PATH
# Set Android_HOME
export ANDROID_HOME=~/Library/Android/sdk/
# Add the Android SDK to the ANDROID_HOME variable
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
# Set GRADLE_HOME
export GRADLE_HOME=/Library/gradle/gradle-3.2
export PATH=$PATH:$GRADLE_HOME/bin
# Set Latex home
