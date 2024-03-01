#!/usr/bin/env bash
PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
  get-tmux-option() {
    local option value default
    option="$1"
    default="$2"
    value="$(tmux show-option -gqv "$option")"

    if [ -n "$value" ]; then
      echo "$value"
    else
      echo "$default"
    fi
  }

  set() {
    local option=$1
    local value=$2
    tmux set-option -gq "$option" "$value"
  }

  setw() {
    local option=$1
    local value=$2
    tmux set-window-option -gq "$option" "$value"
  }

  local theme
  theme="$(get-tmux-option "@everforest_theme" "dark-medium")"

  # NOTE: Pulling in the selected theme by the theme that's being set as local
  # variables.
  sed -E 's/^(.+=)/local \1/' \
      > "${PLUGIN_DIR}/everforest-selected-theme.tmuxtheme" \
      < "${PLUGIN_DIR}/everforest-${theme}.tmuxtheme"

  source "${PLUGIN_DIR}/everforest-selected-theme.tmuxtheme"

  # status
  set status "on"
  set status-bg "${thm_bg0}"
  set status-justify "left"
  set status-left-length "100"
  set status-right-length "100"

  # messages
  set message-style "fg=${thm_aqua},bg=${thm_bg2},align=centre"
  set message-command-style "fg=${thm_aqua},bg=${thm_bg2},align=centre"

  # panes
  set pane-border-style "fg=${thm_bg2}"
  set pane-active-border-style "fg=${thm_blue}"

  # windows
  setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg0},none"
  setw window-status-separator ""
  setw window-status-style "fg=${thm_fg},bg=${thm_bg0},none"

  # --------=== Statusline

  # These variables are the defaults so that the setw and set calls are easier to parse.
  readonly show_directory="#[fg=$thm_orange,bg=$thm_bg0,bold]   #{b:pane_current_path} "
  readonly show_window="#[fg=$thm_yellow,bg=$thm_bg0,bold]   #W "
  readonly show_time="#[fg=$thm_aqua,bg=$thm_bg0,bold]   %H:%M:%S "
  readonly window_status_format="#[fg=$thm_red,bg=$thm_bg0,bold] #W #I  "
  readonly window_status_format="#[fg=$thm_red,bg=$thm_bg0,bold] #W #I  "
  readonly window_status_current_format="#{?pane_synchronized, #[fg=$thm_orange] #[default],}#[fg=$thm_blue,bg=$thm_bg0,bold] #W #I  "

  set status-left ""

  set status-right "${show_directory}${show_window}${show_time}"

  set window-status-format "${window_status_format}"
  set window-status-current-format "${window_status_current_format}"

  # --------=== Modes
  #
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_purple} bg=${thm_bg3} bold"
}

main "$@"
