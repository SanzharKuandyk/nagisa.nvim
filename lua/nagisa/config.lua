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
    local function to_bool(value, default)
        if value == nil then
            return default
        end
        return value == true or value == 1 or value == "1"
    end

    local global_settings = {
        theme = vim.g.nagisa_theme or defaults.theme,
        transparent = vim.g.nagisa_transparent or defaults.transparent,
        italic_comments = to_bool(vim.g.nagisa_italic_comment, defaults.italic_comments),
        underline_links = to_bool(vim.g.nagisa_underline_links, defaults.underline_links),
        disable_nvimtree_bg = to_bool(vim.g.nagisa_disable_nvim_tree_bg, defaults.disable_nvimtree_bg),
    }

    config.opts = vim.tbl_extend("force", {}, defaults, global_settings, user_opts or {})
    return config.opts
end

return config
