local modes = require "modes"
local luakit = require "luakit"
local editor = require "editor"
local settings = require "settings"
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

settings.window.default_search_engine = "duckduckgo"

-- End Own Bindings --

-- ["tidal.com"] = {
--     ["enable-scripts"] = true,
--     ["enable-plugins"] = true,
-- }
--
    -- webview.full_content_zoom = true -- optional 
-- webview.zoom_level = 1.5 -- 80%, play with this figure
--
--
--
--
-- local downloads = require("downloads")
-- local cookies = require("cookies")

-- module("userprefs")

-- cookies.session_timeout = 3600 * 24 * 7 * 4 --Keep session cookies for 4 weeks.
-- cookies.force_session_timeout = false

-- -- Example using xdg-open for opening downloads / showing download folders
-- downloads.add_signal("open-file", function (file, mime)
--     luakit.spawn(string.format("xdg-open %q", file))
--     return true
-- end)

-- require "plugins"
