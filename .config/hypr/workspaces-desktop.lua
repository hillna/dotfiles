-- Workspace layout (desktop): left 1-3, center 4-7, right 8-10
-- Monitor names match nwg-displays / monitors.lua
-- DP-2=left, DP-1=center, DP-3=portrait

hl.workspace_rule({ workspace = "1", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2" })
hl.workspace_rule({ workspace = "3", monitor = "DP-2" })

hl.workspace_rule({ workspace = "4", monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-1" })
hl.workspace_rule({ workspace = "6", monitor = "DP-1" })
hl.workspace_rule({ workspace = "7", monitor = "DP-1" })

hl.workspace_rule({ workspace = "8", monitor = "DP-3", default = true })
hl.workspace_rule({ workspace = "9", monitor = "DP-3" })
hl.workspace_rule({ workspace = "10", monitor = "DP-3" })
