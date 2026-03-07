local nagisa = {}
local config = require("nagisa.config")

nagisa.state = {
    theme = nil,
}

local validate_theme

local function get_compile_scope(scope)
    local resolved = scope or config.opts.compile.scope
    if resolved ~= "all" and resolved ~= "current" then
        error(string.format("Invalid compile scope '%s'. Use 'all' or 'current'.", tostring(resolved)))
    end
    return resolved
end

local function list_available_themes()
    local themes = require("nagisa.themes")
    local colors = require("nagisa.colors")
    local available = themes.setup(colors)
    local names = {}

    for name in pairs(available) do
        table.insert(names, name)
    end

    table.sort(names)
    return names, available
end

local function compile_themes(scope, opts, active_theme)
    local utils = require("nagisa.utils")
    local colors = require("nagisa.colors")
    local compiled = {}

    if scope == "current" then
        local theme_name = validate_theme(active_theme or opts.theme)
        utils.compile(theme_name, opts, colors)
        compiled[1] = theme_name
        return compiled
    end

    local theme_names = list_available_themes()
    for _, theme_name in ipairs(theme_names) do
        utils.compile(theme_name, opts, colors)
        table.insert(compiled, theme_name)
    end

    return compiled
end

local function reload_active_theme(theme_name)
    nagisa.load(theme_name or nagisa.state.theme or config.opts.theme)
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end

validate_theme = function(theme_name)
    local names, available = list_available_themes()
    if not available[theme_name] then
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

function nagisa.compile(scope)
    return compile_themes(get_compile_scope(scope), config.opts, nagisa.state.theme)
end

function nagisa.set_transparent(value, scope)
    config.opts.transparent = value
    vim.g.nagisa_transparent = value
    nagisa.compile(scope)
    reload_active_theme()
    return config.opts.transparent
end

function nagisa.toggle_transparent(scope)
    return nagisa.set_transparent(not config.opts.transparent, scope)
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

vim.api.nvim_create_user_command("NagisaCompile", function(command_opts)
    local current_theme = nagisa.state.theme
    local current_opts = config.opts
    local scope = command_opts.args ~= "" and command_opts.args or current_opts.compile.scope

    for mod in pairs(package.loaded) do
        if mod:match("^nagisa") then
            package.loaded[mod] = nil
        end
    end

    local fresh = require("nagisa")
    fresh.setup(current_opts)
    fresh.state.theme = current_theme

    local compiled = fresh.compile(scope)

    fresh.load(current_theme)
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
    vim.notify(
        string.format("Nagisa compiled %s theme(s): %s", scope, table.concat(compiled, ", ")),
        vim.log.levels.INFO
    )
end, {
    nargs = "?",
    complete = function()
        return { "all", "current" }
    end,
})

vim.api.nvim_create_user_command("NagisaTransparent", function(command_opts)
    local action = command_opts.args ~= "" and command_opts.args or "toggle"
    local transparent

    if action == "toggle" then
        transparent = nagisa.toggle_transparent()
    elseif action == "enable" then
        transparent = nagisa.set_transparent(true)
    elseif action == "disable" then
        transparent = nagisa.set_transparent(false)
    else
        error(string.format("Invalid transparency action '%s'. Use toggle, enable, or disable.", action))
    end

    vim.notify(string.format("Nagisa transparency %s", transparent and "enabled" or "disabled"), vim.log.levels.INFO)
end, {
    nargs = "?",
    complete = function()
        return { "toggle", "enable", "disable" }
    end,
})

return nagisa
