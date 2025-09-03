local config = {}

---@class NagisaConfig
---@field theme? string
---@field transparent? boolean
---@field italic_comments? boolean
---@field underline_links? boolean
---@field color_overrides? table
---@field group_overrides? table
---@field disable_nvimtree_bg? boolean

-- Default configuration
local defaults = {
    theme = "EndOfTheWorld",
    transparent = false,
    italic_comments = false,
    underline_links = false,
    color_overrides = {},
    group_overrides = {},
    disable_nvimtree_bg = true,
}

---@type NagisaConfig
config.opts = vim.deepcopy(defaults)

---@param user_opts? NagisaConfig
function config.setup(user_opts)
    local global_settings = {
        theme = vim.g.nagisa_theme or defaults.theme,
        transparent = vim.g.nagisa_transparent or defaults.transparent,
        italic_comments = (vim.g.nagisa_italic_comment == true or vim.g.nagisa_italic_comment == 1),
        underline_links = (vim.g.nagisa_underline_links == true or vim.g.nagisa_underline_links == 1),
        disable_nvimtree_bg = (vim.g.nagisa_disable_nvim_tree_bg == true or vim.g.nagisa_disable_nvim_tree_bg == 1),
    }

    config.opts = vim.tbl_extend("force", {}, defaults, global_settings, user_opts or {})
    return config.opts
end

return config
