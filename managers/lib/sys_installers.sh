chrome_installer() {
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
    sudo apt-get -qq update
    sudo apt-get -qq install -y google-chrome-stable

    dconf write /org/gnome/desktop/interface/color-scheme \'prefer-dark\'
    # Set chrome as the default browser
    xdg-settings set default-web-browser 'google-chrome.desktop'
}

vscode_installer() {
    wget -q -O './vscode.deb' 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
    sudo apt-get -qq install -y './vscode.deb'
    rm -f './vscode.deb'
}

wezterm_installer() {
    curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
    (echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list) > /dev/null
    sudo apt-get -qq update
    sudo apt-get -qq install -y wezterm
}

dunst_installer() {
    local dependencies
    dependencies=(
      libdbus-1-dev
      libx11-dev
      libxinerama-dev
      libxrandr-dev
      libxss-dev
      libglib2.0-dev
      libpango1.0-dev
      libgtk-3-dev
      libxdg-basedir-dev
      libnotify-dev
    )

    sudo apt-get -qq install -y "${dependencies[@]}"

    rm -rf "$HOME/.dunst"
    git clone -q https://github.com/dunst-project/dunst.git "$HOME/.dunst"
    (
        cd "$HOME/.dunst" || exit 1
        make
        sudo make install
    ) > /dev/null
}

# https://github.com/junegunn/fzf
fzf_installer() {
    rm -rf "$HOME/.fzf"
    git clone -q --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
    (yes | "$HOME/.fzf/install") > /dev/null
}

# https://i3wm.org/
i3_installer() {
    (/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734) > /dev/null
    sudo apt-get -qq install ./keyring.deb
    (echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list) > /dev/null
    sudo apt-get -qq update
    sudo apt-get -qq install -y i3
    rm -f ./keyring.deb
}

repos_installer() {
    local repo
    declare -A repos=(
        ["git@github.com:pablos123/notes.git"]="$HOME/notes"
        ["git@github.com:pablos123/dump.git"]="$HOME/projects/dump"
        ["git@github.com:pablos123/pablos123.github.io.nvim.git"]="$HOME/projects/pablos123.github.io"
    )

    for repo in "${!repos[@]}"; do
        if [[ -d "${repos[$repo]}" ]]; then
            (
                cd "${repos[$repo]}" || exit 1
                git pull -q
            )
            continue
        fi
        git clone -q "$repo" "${repos[$repo]}"
    done
}

sys_installers=(
    chrome_installer
    vscode_installer
    wezterm_installer
    dunst_installer
    fzf_installer
    i3_installer
    repos_installer
)
