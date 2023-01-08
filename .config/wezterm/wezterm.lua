local wezterm = require 'wezterm'

return {
  color_scheme = 'OneDark (base16)',
  window_close_confirmation = 'AlwaysPrompt',
  font = wezterm.font_with_fallback({
    { family = 'JetBrains Mono', weight = 'Medium' },
    'SF Mono'
  });
  
  font_size = 12;
  initial_rows = 60;
  initial_cols = 160;
  hide_tab_bar_if_only_one_tab = true;
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
}
