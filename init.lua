-- Gray Death
-- MIT License
-- To change parameters, use the Settings menu.

----------------
-- Parameters --
----------------

local saturation_on_die = 0.0
local saturation_on_respawn = 1.0

-------------------
-- Read settings --
-------------------

local saturation_on_die_setting = minetest.settings:get("gd_saturation_on_die")
if saturation_on_die_setting ~= nil then
	saturation_on_die = tonumber(saturation_on_die_setting)
end

local saturation_on_respawn_setting = minetest.settings:get("gd_saturation_on_respawn")
if saturation_on_respawn_setting ~= nil then
	saturation_on_respawn = tonumber(saturation_on_respawn_setting)
end

if saturation_on_die == saturation_on_respawn then
	return -- Do nothing
end

---------------------------
-- Callback registration --
---------------------------

minetest.register_on_dieplayer(function(player, reason)
	player:set_lighting({
		saturation = saturation_on_die
	})
end)

minetest.register_on_respawnplayer(function(player)
	player:set_lighting({
		saturation = saturation_on_respawn
	})
end)
