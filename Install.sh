#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$(realpath -s "$0")")
LOG_DIR="${HOME}/Library/Logs/bootstrap-macos"

go_back() {
  cd "${SCRIPT_PATH}" || exit 1
}

go_to_dir() {
  local directory_path="${1}"

  echo "Entering ${directory_path}"

  [[ -d $directory_path ]] && cd "${directory_path}" || echo "Directory at ${directory_path} does not exist" exit 1
}


install_scripts() {
    cp -R ./usr/local/bin /usr/local/bin
}

run_dir_script() {
  local dir="${1}"
  local script="${2}"

  go_to_dir "${dir}"
  zsh -c "./${script}"

  go_back
}

install_launch_agents() {
  echo "Installing Launch Agents"

  run_dir_script "launchd" "install.sh"
}

setup_zsh() {
  echo "Setting up zsh"

  run_dir_script "scripts" "zsh-setup.sh"
}

echo "Creating log directory at ${LOG_DIR}"
mkdir -p "${LOG_DIR}"

if [ "$(command -v brew)" == '' ] ; then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    bash -c 'brew bundle'
else
  echo "Homebrew is already installed. Skipping.."
fi

install_scripts

install_launch_agents

setup_zsh

echo "Done"

exit 0
