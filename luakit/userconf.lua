local modes = require "modes"
local luakit = require "luakit"
local editor = require "editor"

-- set urxvt as terminal for editor --
editor.editor_cmd = "urxvt -e vim {file} +{line}"

-- My Own Bindings --
modes.add_binds("normal", {
                  { "<Control-c>", "Copy selected text.", function ()
                      luakit.selection.clipboard = luakit.selection.primary
                  end},
                  { "<Alt-h>", "Go to previous tab.", function (w) w:prev_tab() end },
                  { "<Alt-l>", "Go to next tab.", function (w) w:next_tab() end },
})
-- End Own Bindings --

-- ["tidal.com"] = {
--     ["enable-scripts"] = true,
--     ["enable-plugins"] = true,
-- }
