local nagisa = {}
local config = require("nagisa.config")

nagisa.state = {
    theme = nil,
}

local function validate_theme(theme_name)
    local themes = require("nagisa.themes")
    local colors = require("nagisa.colors")
    local available = themes.setup(colors)
    if not available[theme_name] then
        local names = {}
        for name in pairs(available) do
            table.insert(names, name)
        end
        table.sort(names)
        error(string.format("Invalid theme '%s'. Available: %s", theme_name, table.concat(names, ", ")))
    end
    return theme_name
end

function nagisa.setup(opts)
    local merged = config.setup(opts)
    nagisa.state.theme = merged.theme
end

function nagisa.load(theme_name)
    local utils = require("nagisa.utils")

    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    vim.o.termguicolors = true

    nagisa.state.theme = validate_theme(theme_name or config.opts.theme)

    if not utils.load_compiled(nagisa.state.theme) then
        nagisa.compile()
        utils.load_compiled(nagisa.state.theme)
    end
end

function nagisa.compile()
    local utils = require("nagisa.utils")
    local colors = require("nagisa.colors")

    utils.compile(nagisa.state.theme, config.opts, colors)
end

---@return NagisaConfig
function nagisa.get_opts()
    return config.opts
end

---@return Theme
function nagisa.get_theme()
    local colors = require("nagisa.colors")
    local themes = require("nagisa.themes")
    return themes.setup(colors)[nagisa.state.theme]()
end

-- User command to recompile
vim.api.nvim_create_user_command("NagisaCompile", function()
    local current_theme = nagisa.state.theme
    local current_opts = config.opts

    for mod in pairs(package.loaded) do
        if mod:match("^nagisa") then
            package.loaded[mod] = nil
        end
    end

    local fresh = require("nagisa")
    fresh.setup(current_opts)

    local colors = require("nagisa.colors")
    local themes = require("nagisa.themes")
    local utils = require("nagisa.utils")
    for theme_name in pairs(themes.setup(colors)) do
        fresh.state.theme = theme_name
        utils.compile(theme_name, current_opts, colors)
    end

    vim.notify("Nagisa compiled successfully!", vim.log.levels.INFO)
    fresh.load(current_theme)
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end, {})

return nagisa
