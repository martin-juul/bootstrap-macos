#!/usr/bin/env bash

SCRIPT_PATH=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)/$(basename -- "$0")")
LOG_DIR="${HOME}/Library/Logs/bootstrap-macos"

go_back() {
  cd "${SCRIPT_PATH}" || exit 1
}

go_to_dir() {
  local directory_path="${1}"

  [[ -d $directory_path ]] || (echo "Directory at ${directory_path} does not exist" && exit 1)
}


install_scripts() {
    cp -R ./usr/local/bin /usr/local/bin
}

run_dir_script() {
  local dir="${1}"
  local script="${2}"

  go_to_dir "${dir}"
  ./"${script}"

  go_back
}

install_launch_agents() {
  run_dir_script "launchd" "install.sh"
}

setup_zsh() {
    run_dir_script "scripts" "setup.sh"
}

main() {
  echo "Creating log directory at ${LOG_DIR}"
  mkdir -p "${LOG_DIR}"

  which -s brew
  if [[ $? != 0 ]] ; then
      echo "Installing homebrew"
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  install_scripts

  install_launch_agents

  setup_zsh

  echo "Done"
}

main
