require("full-border"):setup {
-- ui.Border.PLAIN, ui.Border.ROUNDED
type = ui.Border.ROUNDED,
}
require("starship"):setup({
hide_flags = false,
flags_after_prompt = true,
config_file = "~/.config/starship-yazi.toml",
})
