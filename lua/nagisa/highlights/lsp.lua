local M = {}

---@param theme Theme
---@return table highlights
function M.setup(theme, opts)
    opts = opts or require("nagisa.config").opts

    return {
        ["@type.builtin"] = { link = "@type" },
        ["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
        ["@lsp.type.type"] = { link = "@type" },
        ["@lsp.type.typeParameter"] = { link = "@type" },
        ["@lsp.type.macro"] = { link = "@constant" },
        ["@lsp.type.enumMember"] = { link = "@constant" },
        ["@lsp.typemod.variable.readonly"] = { link = "@constant" },
        ["@lsp.typemod.property.readonly"] = { link = "@constant" },
        ["@lsp.typemod.variable.constant"] = { link = "@constant" },
        ["@lsp.type.member"] = { link = "@function" },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        ["@lsp.typemod.keyword.controlFlow"] = {
            fg = theme.syn.keyword,
            bg = "NONE",
        },
        ["@lsp.type.comment.c"] = { link = "Comment" },
        ["@lsp.type.comment.cpp"] = { link = "Comment" },
        ["@event"] = { link = "Identifier" },
        ["@interface"] = { link = "Identifier" },
        ["@modifier"] = { link = "Identifier" },
        ["@regexp"] = { fg = theme.syn.constant, bg = "NONE" },
        ["@decorator"] = { link = "Identifier" },
    }
end

return M
