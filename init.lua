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

mobs:register_mob("mobs:dirt_monster", {
	type = "monster",
	hp_max = 5,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.x",
	textures = {"mobs_dirt_monster.png"},
	visual_size = {x=3, y=2.6},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:dirt",
		chance = 1,
		min = 3,
		max = 5,},
	},
	armor = 100,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 2,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	}
})
mobs:register_spawn("mobs:dirt_monster", {"default:dirt_with_grass"}, 3, -1, 7000, 3, 31000, 1)

mobs:register_mob("mobs:stone_monster", {
	type = "monster",
	hp_max = 10,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.x",
	textures = {"mobs_stone_monster.png"},
	visual_size = {x=3, y=2.6},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 0.5,
	run_velocity = 2,
	damage = 3,
	drops = {
		{name = "default:mossycobble",
		chance = 1,
		min = 3,
		max = 5,},
	},
	light_resistant = true,
	armor = 80,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	}
})
mobs:register_spawn("mobs:stone_monster", {"default:stone"}, 3, -1, 7000, 3, 0, 1)

mobs:register_mob("mobs:sand_monster", {
	type = "monster",
	hp_max = 3,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_sand_monster.x",
	textures = {"mobs_sand_monster.png"},
	visual_size = {x=8,y=8},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1.5,
	run_velocity = 4,
	damage = 1,
	drops = {
		{name = "default:sand",
		chance = 1,
		min = 3,
		max = 5,},
	},
	light_resistant = true,
	armor = 100,
	drawtype = "front",
	water_damage = 3,
	lava_damage = 1,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 39,
		walk_start = 41,
		walk_end = 72,
		run_start = 74,
		run_end = 105,
		punch_start = 74,
		punch_end = 105,
	},
})
mobs:register_spawn("mobs:sand_monster", {"default:desert_sand"}, 20, -1, 7000, 3, 31000, 1)

mobs:register_mob("mobs:tree_monster", {
	type = "monster",
	hp_max = 5,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_tree_monster.x",
	textures = {"mobs_tree_monster.png"},
	visual_size = {x=4.5,y=4.5},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:sapling",
		chance = 3,
		min = 1,
		max = 2,},
		{name = "default:junglesapling",
		chance = 3,
		min = 1,
		max = 2,},
	},
	light_resistant = true,
	armor = 100,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 2,
	disable_fall_damage = true,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 24,
		walk_start = 25,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		punch_start = 48,
		punch_end = 62,
	},
})
mobs:register_spawn("mobs:tree_monster", {"default:leaves", "default:jungleleaves"}, 3, -1, 7000, 3, 31000, 1)

mobs:register_mob("mobs:rat", {
	type = "animal",
	hp_max = 1,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "mobs_rat.x",
	textures = {"mobs_rat.png"},
	makes_footstep_sound = false,
	walk_velocity = 1,
	armor = 200,
	drops = {},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	
	on_rightclick = function(self, clicker)
		if clicker:is_player() and clicker:get_inventory() then
			clicker:get_inventory():add_item("main", "mobs:rat")
			self.object:remove()
		end
	end,
})
mobs:register_spawn("mobs:rat", {"default:dirt_with_grass", "default:stone"}, 20, -1, 7000, 1, 31000, 1)

minetest.register_craftitem("mobs:rat", {
	description = "Rat",
	inventory_image = "mobs_rat_inventory.png",
	
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
			minetest.env:add_entity(pointed_thing.above, "mobs:rat")
			itemstack:take_item()
		end
		return itemstack
	end,
})
	
minetest.register_craftitem("mobs:rat_cooked", {
	description = "Cooked Rat",
	inventory_image = "mobs_cooked_rat.png",
	
	on_use = minetest.item_eat(3),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:rat_cooked",
	recipe = "mobs:rat",
	cooktime = 5,
})

mobs:register_mob("mobs:oerkki", {
	type = "monster",
	hp_max = 8,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_oerkki.x",
	textures = {"mobs_oerkki.png"},
	visual_size = {x=5, y=5},
	makes_footstep_sound = false,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 4,
	drops = {},
	armor = 100,
	drawtype = "front",
	light_resistant = true,
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 36,
		run_start = 37,
		run_end = 49,
		punch_start = 37,
		punch_end = 49,
		speed_normal = 15,
		speed_run = 15,
	},
})
mobs:register_spawn("mobs:oerkki", {"default:stone"}, 2, -1, 7000, 3, -10, 1)

mobs:register_mob("mobs:dungeon_master", {
	type = "monster",
	hp_max = 10,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 2.6, 0.7},
	visual = "mesh",
	mesh = "mobs_dungeon_master.x",
	textures = {"mobs_dungeon_master.png"},
	visual_size = {x=8, y=8},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 4,
	drops = {
		{name = "default:mese",
		chance = 100,
		min = 1,
		max = 2,},
	},
	armor = 60,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "shoot",
	arrow = "mobs:fireball",
	shoot_interval = 2.5,
	sounds = {
		attack = "mobs_fireball",
	},
	animation = {
		stand_start = 0,
		stand_end = 19,
		walk_start = 20,
		walk_end = 35,
		punch_start = 36,
		punch_end = 48,
		speed_normal = 15,
		speed_run = 15,
	},
})
mobs:register_spawn("mobs:dungeon_master", {"default:stone"}, 2, -1, 7000, 1, -50, 1)

mobs:register_arrow("mobs:fireball", {
	visual = "sprite",
	visual_size = {x=1, y=1},
	--textures = {{name="mobs_fireball.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.5}}}, FIXME
	textures = {"mobs_fireball.png"},
	velocity = 5,
	hit_player = function(self, player)
		local s = self.object:getpos()
		local p = player:getpos()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=4},
		}, vec)
		local pos = self.object:getpos()
		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(pos).name
					if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <= 30 then
						minetest.env:set_node(p, {name="fire:basic_flame"})
					else
						minetest.env:remove_node(p)
					end
				end
			end
		end
	end,
	hit_node = function(self, pos, node)
		for dx=-1,1 do
			for dy=-2,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(pos).name
					if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <= 30 then
						minetest.env:set_node(p, {name="fire:basic_flame"})
					else
						minetest.env:remove_node(p)
					end
				end
			end
		end
	end
})

if minetest.setting_get("log_mods") then
	minetest.log("action", "mobs loaded")
end
