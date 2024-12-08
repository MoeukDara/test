#!/bin/bash

# Function to install Oh My Zsh
install_oh_my_zsh() {
    # Check if Oh My Zsh is already installed
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "Oh My Zsh is already installed."
    fi
}

# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce
    sudo systemctl enable docker
    sudo systemctl start docker
}

# Function to uninstall Docker
uninstall_docker() {
    echo "Uninstalling Docker..."
    sudo apt-get purge -y docker-ce
    sudo rm -rf /var/lib/docker
}

# Function to install Docker Compose
install_docker_compose() {
    echo "Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

# Function to uninstall Docker Compose
uninstall_docker_compose() {
    echo "Uninstalling Docker Compose..."
    sudo rm -f /usr/local/bin/docker-compose
}

# Function to install glab (GitLab CLI)
install_glab() {
    echo "Installing glab..."
    sudo snap install glab
}

# Function to uninstall glab
uninstall_glab() {
    echo "Uninstalling glab..."
    sudo snap remove --purge glab

}

# Function to install yq (YAML processor)
install_yq() {
    echo "Installing yq..."
    sudo curl -L https://github.com/mikefarah/yq/releases/download/v4.14.1/yq_linux_amd64 -o /usr/local/bin/yq
    sudo chmod +x /usr/local/bin/yq
}

# Function to uninstall yq
uninstall_yq() {
    echo "Uninstalling yq..."
    sudo apt-get purge --auto-remove yq
    sudo rm -f /usr/local/bin/yq
}

# Function to install jq (JSON processor)
install_jq() {
    echo "Installing jq..."
    sudo apt-get install -y jq
}

# Function to uninstall jq
uninstall_jq() {
    echo "Uninstalling jq..."
    sudo apt-get remove -y jq
}

# Function to install gh (GitHub CLI)
install_gh() {
    echo "Installing gh..."
    sudo apt-get install -y gh
}

# Function to uninstall gh
uninstall_gh() {
    echo "Uninstalling gh..."
    sudo apt-get remove -y gh
}

# Main logic to execute based on parameters
if [[ "$1" == "install_oh_my_zsh" ]]; then
    install_oh_my_zsh
elif [[ "$1" == "install_Tools" ]]; then
    install_docker
    install_docker_compose
    install_glab
    install_yq
    install_jq
    install_gh

   echo "  ____                            _         _       _   _                  "
   echo " / ___|___  _ __   __ _ _ __ __ _| |_ _   _| | __ _| |_(_) ___  _ __  ___  "
   echo "| |   / _ \| '_ \ / _| | |__/ _| | __| | | | |/ _| | __| |/ _ \| |_ \/ __| "
   echo "| |__| (_) | | | | (_| | | | (_| | |_| |_| | | (_| | |_| | (_) | | | \__ \ "
   echo " \____\___/|_| |_|\__, |_|  \__,_|\__|\__,_|_|\__,_|\__|_|\___/|_| |_|___/ "
   echo "                  |___/                                                    "
elif [[ "$1" == "uninstall" ]]; then
    uninstall_docker
    uninstall_docker_compose
    uninstall_glab
    uninstall_yq
    uninstall_jq
    uninstall_gh
    echo -e "\e[1;34m     _    _                     _         _   _       _            _        _ _ \e[0m"
    echo -e "\e[1;34m    / \  | |_ __ ___  ___ _  __| |_   _  | | | |_ __ (_)_ __  ____| |_ __ _| | |\e[0m"
    echo -e "\e[1;34m   / _ \ | | '__/ _ \/ _ | |/ _  | | | | | | | | '_ \| | '_ \/ ___| __/ _| | | |\e[0m"
    echo -e "\e[1;34m  / ___ \| | | |  __/ (_|| | (_| |_|_| | | |_| | | | | | | \_\__  \ |_ (_| | | |\e[0m"
    echo -e "\e[1;34m /_/   \_\_|_|  \___|\___,_|\__,_|\__, |  \___/|_| |_|_|_| |_|____/\__\__,_|_|_|\e[0m"
    echo -e "\e[1;34m                                   |___/                                       \e[0m"

else
    echo "Usage: $0 {install_oh_zsh|install_Tools|uninstall}"
    exit 1
fi



# How to use
# ./Setup.sh install_oh_my_zsh  - - for install oh_my_zsh
# ./Setup.sh install_Tools  - - for install Tools
# ./Setup.sh uninstall  -- uninstall Tools