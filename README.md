# README

Everforest for <a href="https://github.com/tmux/tmux">Tmux</a>, based off the lovely Catppuccin tmux theme but with the palette of Everforest

### TPM

1. Install [TPM](https://github.com/tmux-plugins/tpm)
2. Add the Everforest plugin:

```bash
set -g @plugin 'bobcats/everforest-tmux'
# ...alongside
set -g @plugin 'tmux-plugins/tpm'
```

3. (Optional) Set your preferred flavour, it defaults to `"dark-medium"`:

```bash
set -g @everforest_theme 'light-medium' # or any permutation of dark/light and soft/medium/hard
```

### Manual

1. Copy your desired theme's configuration contents into your Tmux config (usually stored at `~/.tmux.conf`)
2. Reload Tmux by either restarting the session or reloading it with `tmux source-file ~/.tmux.conf`

#### Configuration options

##### Enable window tabs

By default, the theme places the `window-status` in the `status-right`. With
`@everforest_window_tabs_enabled` set to `on`, the theme will place the
directory within the `status-right` and move the window names to the
`window-status` format variables.

```sh
set -g @everforest_window_tabs_enabled on # or off to disable window_tabs
```

## Thanks to

- [Pocco81](https://github.com/catppuccin)
- [vinnyA3](https://github.com/vinnyA3)
- [rogeruiz](https://github.com/rogeruiz)
- [sainnhe](https://github.com/sainnhe)

&nbsp;

Copyright for portions of everforest-tmux are held by:
Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>(<a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE">LICENSE</a>) as part of Catppuccin and catppuccin/tmux

Copyright for portions of everforest-tmux are also held by:
Copyright &copy; 2019-present <a href="https://github.com/sainnhe" target="_blank">Sainnhe</a>(<a href="https://github.com/sainnhe/everforest/blob/master/LICENSE">LICENSE</a>) as part of Everforest
