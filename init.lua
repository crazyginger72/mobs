dofile(minetest.get_modpath("mobs").."/api.lua")

--if you have armor use that model
if minetest.get_modpath("3d_armor") then human_model = "3d_armor_character.x" else human_model = "character.x" end

mobs:register_mob("mobs:bigfoot", {
	type = "monster",
	hp_max = 60,
	collisionbox = {-0.55, -1.5, -0.55, 0.55, 1.2, 0.55}, -- default{-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "character.x",
	textures = {"mobs_bigfoot.png"},
	visual_size = {x=1.75, y=1.5},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_cyclops",
	},
	view_range = 20,
	walk_velocity = 1,
	run_velocity = 2,
	damage = 3,
	drops = {
		{name = "default:tree",
		chance = 3,
		min = 1,
		max = 4,},
		{name = "mobs:meat_raw",
		chance = 1,
		min = 9,
		max = 39,},
	},
	armor = 100,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	follow = "mobs:meat",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs:meat" then
			if not self.tamed then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.tamed = true
				self.state = stand
			return
			end
		end
	end,
})
mobs:register_spawn("mobs:bigfoot", {"default:tree", "default:junglegrass"}, 12, -1, 90, 5, 9000,2)

mobs:register_mob("mobs:leprechaun", {
	type = "monster",
	hp_max = 25,
	collisionbox = {-.15, -.33, -.15, .15, .25, .15}, -- default{-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "character.x",
	textures = {"mobs_leprechaun.png"},
	visual_size = {x=.5, y=.33},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_leprechaun",
	},
	view_range = 20,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:sword_steel",
		chance = 25,
		min = 1,
		max = 1,},
		{name = "mobs:meat_raw",
		chance = 1,
		min = 1,
		max = 2,},
		{name = "3d_armor:chestplate_steel",
		chance = 49,
		min = 1,
		max = 1,},
		{name = "3d_armor:boots_steel",
		chance = 42,
		min = 1,
		max = 1,},
		{name = "shields:shield_steel",
		chance = 48,
		min = 1,
		max = 1,},
		{name = "default:gold_lump",
		chance = 1,
		min = 1,
		max = 6,},
		{name = "default:gold_lump",
		chance = 100,
		min = 99,
		max = 99,},
	},
	armor = 100,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	follow = "default:gold_lump",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "default:gold_lump" then
			if not self.tamed then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.tamed = true
				self.state = stand
			return
			end
		end
	end,

})
mobs:register_spawn("mobs:leprechaun", {"default:tree"}, 20, -1, 50, 2, 9000)
mobs:register_spawn("mobs:leprechaun", {"default:wood", "default:junglewood"}, 20, -1, 20, 5, 9000,1)

mobs:register_mob("mobs:giant_steve", {
	type = "monster",
	hp_max = 200,
	collisionbox = {-1.5, -4, -1.5, 1.5, 3.2, 1.5}, -- default{-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = human_model,
	textures = {
		"mobs_cyclops.png",
		"3d_armor_chestplate_steel.png^3d_armor_boots_steel.png^shields_shield_steel.png",
		"default_tool_steelsword.png",
	},--textures = {"giant.png"},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_cyclops",
	},
	view_range = 30,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:sword_steel",
		chance = 3,
		min = 1,
		max = 1,},
		{name = "mobs:meat_raw",
		chance = 1,
		min = 6,
		max = 19,},
		{name = "3d_armor:chestplate_steel",
		chance = 9,
		min = 1,
		max = 1,},
		{name = "3d_armor:boots_steel",
		chance = 12,
		min = 1,
		max = 1,},
		{name = "shields:shield_steel",
		chance = 18,
		min = 1,
		max = 1,},
	},
	armor = 100,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	follow = "mobs:meat",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs:meat" then
			if not self.tamed then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.tamed = true
				self.state = stand
			return
			end
		end
	end,
})
mobs:register_spawn("mobs:giant_steve", {"default:grass_3", "default:grass_4", "default:dry_shrub"}, 20, -1, 40, 1, 200,8)
mobs:register_spawn("mobs:giant_steve", {"default:dirt_with_grass", "default:sand"}, 20, -1, 200, 1, 200,8)
mobs:register_spawn("mobs:giant_steve", {"default:dirt", "default:sand"}, 20, -1, 80, 1, 200,8, {"default:tree", "default:cactus", "air"})

mobs:register_mob("mobs:sheep", {
	type = "animal",
	hp_max = 10,
	collisionbox = {-0.4, -0.01, -0.6, 0.4, 0.9, 0.4},
	textures = {"mobs_sheep.png"},
	visual = "mesh",
	mesh = "mobs_sheep.x",
	makes_footstep_sound = true,
	walk_velocity = 1.3,
	visual_size = {x=1, y=1},
	armor = 150,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	sounds = {
		random = "mobs_sheep",
	},
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 80,
		walk_start = 81,
		walk_end = 100,
	},
	follow = "farming:wheat",
	view_range = 10,
	
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "farming:wheat" then
			if not self.tamed then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.tamed = true
			elseif self.naked then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.food = (self.food or 0) + 1
				if self.food >= 8 then
					self.food = 0
					self.naked = false
					self.object:set_properties({
						textures = {"mobs_sheep.png"},
						mesh = "mobs_sheep.x",
					})
				end
			end
			return
		end
		if clicker:get_inventory() and not self.naked then
			self.naked = true
			if minetest.registered_items["wool:white"] then
				clicker:get_inventory():add_item("main", ItemStack("wool:white "..math.random(1,3)))
			end
			self.object:set_properties({
				textures = {"mobs_sheep_shaved.png"},
				mesh = "mobs_sheep.x",
			})
		end
	end,
})
mobs:register_spawn("mobs:sheep", {"default:dirt", "default:dirt_with_grass"}, 20, 8, 40, 1, 200,1)

minetest.register_craftitem("mobs:meat_raw", {
	description = "Raw Meat",
	inventory_image = "mobs_meat_raw.png",
})

minetest.register_craftitem("mobs:meat", {
	description = "Meat",
	inventory_image = "mobs_meat.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:meat",
	recipe = "mobs:meat_raw",
	cooktime = 5,
})

--[[mobs:register_mob("mobs:evergreen_tree", {
	type = "animal",
	hp_max = 20,
	collisionbox = {-0.3, -1, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {"player_Evergreen.png"},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1.2,
	drops = {
		{name = "mapgen:evergreen_sapling",
		chance = 24,
		min = 1,
		max = 3,},
		{name = "mapgen:evergreen_leaves",
		chance = 1,
		min = 1,
		max = 8,},
		{name = "tools:sword_air",
		chance = 4000,
		min = 1,
		max = 1,}
	},
	water_damage = 1,
	lava_damage = 10,
	on_rightclick = nil,
	armor = 100,
	animation = {
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		speed_normal = 20,
	}
})]]--

if minetest.setting_get("log_mods") then
	minetest.log("action", "mobs loaded")
end
