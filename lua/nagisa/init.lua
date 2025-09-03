local nagisa = {}
local config = require("nagisa.config")

nagisa.state = {
    opts = {},
    theme = nil,
}

---@param opts NagisaConfig
nagisa.setup = function(opts)
    config.setup(opts)
    nagisa.state.opts = config.opts
    nagisa.state.theme = config.opts.theme
end

---@param theme_name? string
nagisa.load = function(theme_name)
    local utils = require("nagisa.utils")

    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    vim.o.termguicolors = true

    nagisa.state.theme = theme_name or nagisa.state.opts.theme

    if not utils.load_compiled(nagisa.state.theme) then
        nagisa.compile()
        utils.load_compiled(nagisa.state.theme)
    end
end

function nagisa.compile()
    local utils = require("nagisa.utils")
    local colors = require("nagisa.colors")

    utils.compile(nagisa.state.theme, nagisa.state.opts, colors)
end

---@return NagisaConfig
function nagisa.get_opts()
    return nagisa.state.opts
end

---@return Theme
function nagisa.get_theme()
    local colors = require("nagisa.colors")
    local themes = require("nagisa.themes")
    return themes.setup(colors)[nagisa.state.theme]()
end

-- User command to recompile
vim.api.nvim_create_user_command("NagisaCompile", function()
    -- unload nagisa modules (including config) so globals are re-read
    for mod, _ in pairs(package.loaded) do
        if mod:match("^nagisa%.") then
            package.loaded[mod] = nil
        end
    end

    nagisa.setup()
    nagisa.compile()

    vim.notify("Nagisa compiled successfully!", vim.log.levels.INFO)
    nagisa.load(nagisa.state.theme)
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end, {})

return nagisa
