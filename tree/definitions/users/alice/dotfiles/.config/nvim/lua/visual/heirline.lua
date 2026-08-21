vim.pack.add({ "https://github.com/rebelot/heirline.nvim" })

local utils = require("heirline.utils")

local absolute_center = {
  provider = function()
    local win_w = vim.api.nvim_win_get_width(0)
    local file = vim.fn.expand("%:t")
    local text = (file ~= "" and file or "-") .. (vim.bo.modified and " [+]" or "")

    -- Subtract 1 to account for the left cap ()
    local pad = math.max(0, math.floor((win_w - #text) / 2) - 1)

    return string.rep(" ", pad) .. text
  end,
}

local StatusLine = {
  hl = "MyHeirlineBg",
  utils.surround(
    { "", "" },
    function()
      return utils.get_highlight("MyHeirlinePill").bg -- Pulls background dynamically from any highlight group
    end,
    {
      absolute_center,
      { provider = "%=" },
      { provider = "%l:%c " },
    }
  ),
}

require("heirline").setup({
  statusline = StatusLine,
})
