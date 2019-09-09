#!/usr/bin/env zsh

if [[ -d "$HOME/.oh-my-zsh" ]]; then
  echo "Oh My ZSH is already installed. Skipping installation"
else
  echo "Installing oh-my-zsh"

  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

source_zshrc() {
  # shellcheck disable=SC1090
  source "${HOME}/.zshrc"
}

source_zshrc

FILE_BAK_DATE=$(date "+%Y_%m_%d_%H_%M_%S")

create_file_backup() {
  local backup_file=${1}
  local backup_file_dest="$backup_file"_"$FILE_BAK_DATE"

  echo "Creating backup of ${backup_file} to ${backup_file_dest}"

  mv "${backup_file}" "${backup_file_dest}"
}

FILES_TO_COPY=(
  '.zshrc'
  '.zsh_aliases'
  '.zsh_env'
)

for f in "${FILES_TO_COPY[@]}"; do
  DEST_FILE="${HOME}/${f}"

  [[ -f $DEST_FILE ]] && create_file_backup "$DEST_FILE"

  cp ../home/"${f}" "$DEST_FILE"
done

source_zshrc
