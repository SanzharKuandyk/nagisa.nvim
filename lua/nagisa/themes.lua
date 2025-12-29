---@class Theme
---@field ui UiElements
---@field syn SyntaxElements
---@field vcs VCSElements
---@field diff DiffElements
---@field diag DiagnosticsElements

---@class UiElements
---@field fg string
---@field bg string
---@field fg_dim string
---@field bg_dim string
---@field col string
---@field border string
---@field search string
---@field cursor string
---@field selection string
---@field pmenu Pmenu
---@field statusline string
---@field dir string

---@class Pmenu
---@field main string
---@field sel string

---@class SyntaxElements
---@field string string
---@field number string
---@field variable string
---@field constant string
---@field identifier string
---@field keyword string
---@field func string
---@field comment string
---@field operator string
---@field special1 string
---@field special2 string
---@field special3 string

---@class VCSElements
---@field added string
---@field changed string
---@field deleted string
---@field addedLn string
---@field changedLn string
---@field deletedLn string

---@class DiffElements
---@field add string
---@field delete string
---@field change string
---@field text string

---@class DiagnosticsElements
---@field error string
---@field warning string
---@field info string

---@param colors Colors
---@return Theme
local function setup(colors)
    return {
        ---@return Theme
        EndOfTheWorld = function()
            return {
                ui = {
                    fg = colors.front,
                    bg = colors.back,
                    fg_dim = colors.grayMid,
                    bg_dim = colors.grayDarkish,
                    col = colors.grayVeryDark,
                    border = colors.grayDark,
                    search = colors.blueDark,
                    cursor = colors.grayMidDark,
                    selection = colors.lightRed,
                    pmenu = {
                        main = colors.grayLight,
                        sel = colors.red,
                    },
                    statusline = colors.purpleDark,
                    dir = colors.accentBlue,
                },
                syn = {
                    string = colors.green,
                    number = colors.lightGreen,
                    variable = colors.lightBlue,
                    constant = colors.orange,
                    identifier = colors.greenBlue,
                    keyword = colors.pink,
                    func = colors.red,
                    comment = colors.gray,
                    operator = colors.purple,
                    special1 = colors.blue,
                    special2 = colors.yellowOrange,
                    special3 = colors.greenDark,
                },
                vcs = {
                    added = colors.green,
                    changed = colors.purple,
                    deleted = colors.redDark,
                    addedLn = colors.greenDark,
                    changedLn = colors.purpleDark,
                    deletedLn = colors.redDark,
                },
                diff = {
                    add = colors.green,
                    delete = colors.red,
                    change = colors.yellowOrange,
                    text = colors.front,
                },
                diag = {
                    error = colors.error,
                    warning = colors.yellow,
                    info = colors.blue,
                },
            }
        end,
    }
end

return { setup = setup }
