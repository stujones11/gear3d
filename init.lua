--[[

MIT License

Copyright (c) 2019 stujones11, Stuart Jones

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

]]--

local function register_gear_node(name, def)
	local tiles = def.tiles or {
		{
			name = def.texture,
			animation = {
				type = "vertical_frames",
				aspect_w = def.aspect_w,
				aspect_h = def.aspect_h,
				length = def.length,
			},
		},
	}
	minetest.register_node(name, {
		description = def.description,
		drawtype = def.drawtype,
		mesh = def.mesh,
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		selection_box = def.selection_box,
		groups = {choppy=2, oddly_breakable_by_hand=2},
	})
end

local function register_gear(name, def)
	local desc = def.description
	def.selection_box = {
		type = "fixed",
		fixed = {def.selection},
	}
	if def.on then
		def.description = desc
		def.texture = def.on
		register_gear_node(name, def)
	end
	if def.forward then
		def.description = desc.." forward"
		def.texture = def.forward
		register_gear_node(name.."_fwd", def)
	end
	if def.reverse then
		def.description = desc.." reverse"
		def.texture = def.reverse
		register_gear_node(name.."_rev", def)
	end
	if def.off then
		def.description = desc.." stopped"
		def.tiles = {def.off}
		register_gear_node(name.."_off", def)
	else
		if def.off_fwd then
			def.description = desc.." forward stopped"
			def.tiles = {def.off_fwd}
			register_gear_node(name.."_off_fwd", def)
		end
		if def.off_rev then
			def.description = desc.." reverse stopped"
			def.tiles = {def.off_rev}
			register_gear_node(name.."_off_rev", def)
		end
	end
end

register_gear("gear3d:shaft_large", {
	description = "Large shaft",
	drawtype = "mesh",
	mesh = "gear3d_shaft_large.obj",
	aspect_w = 96,
	aspect_h = 24,
	length = 1,
	selection = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	on = "gear3d_shaft_large.png",
	off = "gear3d_shaft_large.png^[verticalframe:12:0",
})

register_gear("gear3d:shaft_small", {
	description = "Small shaft",
	drawtype = "mesh",
	mesh = "gear3d_shaft_small.obj",
	aspect_w = 48,
	aspect_h = 20,
	length = 1,
	selection = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	on = "gear3d_shaft_small.png",
	off = "gear3d_shaft_small.png^[verticalframe:12:0",
})

register_gear("gear3d:windsail_turning", {
	description = "Windsail",
	drawtype = "mesh",
	mesh = "gear3d_windsail.obj",
	aspect_w = 144,
	aspect_h = 24,
	length = 1,
	selection = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	on = "gear3d_windsail_fwd.png",
	off = "gear3d_windsail_fwd.png^[verticalframe:12:0",
})

register_gear("gear3d:spur_gear", {
	description = "Spur gear",
	drawtype = "mesh",
	mesh = "gear3d_spur_gear.obj",
	aspect_w = 240,
	aspect_h = 16,
	length = 2,
	selection = {-0.5, -0.5, -0.25, 0.5, 0.5, 0.25},
	forward = "gear3d_spur_gear_fwd.png",
	reverse = "gear3d_spur_gear_rev.png",
	off_fwd = "gear3d_spur_gear_fwd.png^[verticalframe:24:0",
	off_rev = "gear3d_spur_gear_rev.png^[verticalframe:24:0",
})

register_gear("gear3d:sprocket", {
	description = "Sprocket",
	drawtype = "mesh",
	mesh = "gear3d_sprocket.obj",
	aspect_w = 192,
	aspect_h = 30,
	length = 1,
	selection = {-0.75, -0.75, -0.25, 0.75, 0.75, 0.25},
	forward = "gear3d_sprocket_fwd.png",
	reverse = "gear3d_sprocket_rev.png",
	off = "gear3d_sprocket_fwd.png^[verticalframe:12:0",
})

register_gear("gear3d:sprocket_90", {
	description = "Sprocket 90",
	drawtype = "mesh",
	mesh = "gear3d_sprocket_90.obj",
	aspect_w = 192,
	aspect_h = 30,
	length = 1,
	selection = {-0.75, -0.75, -0.25, 0.75, 0.75, 0.25},
	forward = "gear3d_sprocket_fwd.png",
	reverse = "gear3d_sprocket_rev.png",
	off = "gear3d_sprocket_fwd.png^[verticalframe:12:0",
})

register_gear("gear3d:sprocket_180", {
	description = "Sprocket 180",
	drawtype = "mesh",
	mesh = "gear3d_sprocket_180.obj",
	aspect_w = 192,
	aspect_h = 30,
	length = 1,
	selection = {-0.75, -0.75, -0.25, 0.75, 0.75, 0.25},
	forward = "gear3d_sprocket_fwd.png",
	reverse = "gear3d_sprocket_rev.png",
	off = "gear3d_sprocket_fwd.png^[verticalframe:12:0",
})

register_gear("gear3d:chain", {
	description = "Chain",
	drawtype = "mesh",
	mesh = "gear3d_chain.obj",
	aspect_w = 48,
	aspect_h = 8,
	length = 1,
	selection = {-0.125, -0.5, -0.125, 0.125, 0.5, 0.125},
	on = "gear3d_chain.png",
	off = "gear3d_chain.png^[verticalframe:12:0",
})

register_gear("gear3d:cage_female_small", {
	description = "Small female cage gear",
	drawtype = "mesh",
	mesh = "gear3d_cage_female_small.obj",
	aspect_w = 264,
	aspect_h = 16,
	length = 2,
	selection = {-0.5, -0.5, -0.32, 0.5, 0.5, 0.32},
	on = "gear3d_cage_female_small.png",
	off = "gear3d_cage_female_small.png^[verticalframe:12:0",
})

register_gear("gear3d:cage_female_large", {
	description = "Large female cage gear",
	drawtype = "mesh",
	mesh = "gear3d_cage_female_large.obj",
	aspect_w = 240,
	aspect_h = 16,
	length = 1,
	selection = {-0.75, -0.75, -0.32, 0.75, 0.75, 0.32},
	on = "gear3d_cage_female_large.png",
	off = "gear3d_cage_female_large.png^[verticalframe:12:0",
})

register_gear("gear3d:cage_male_single", {
	description = "Single male cage gear",
	drawtype = "mesh",
	mesh = "gear3d_cage_male_single.obj",
	aspect_w = 192,
	aspect_h = 20,
	length = 1,
	selection = {-0.75, -0.75, 0.25, 0.75, 0.75, 0.5},
	forward = "gear3d_cage_male_single_fwd.png",
	reverse = "gear3d_cage_male_single_rev.png",
	off = "gear3d_cage_male_single_fwd.png^[verticalframe:12:0",
})

register_gear("gear3d:cage_male_double", {
	description = "Double male cage gear",
	drawtype = "mesh",
	mesh = "gear3d_cage_male_double.obj",
	aspect_w = 192,
	aspect_h = 20,
	length = 1,
	selection = {-0.75, -0.75, -0.25, 0.75, 0.75, 0.25},
	on = "gear3d_cage_male_single_fwd.png",
	off = "gear3d_cage_male_single_fwd.png^[verticalframe:12:0",
})

register_gear("gear3d:millstone_roller", {
	description = "Millstone roller",
	drawtype = "mesh",
	mesh = "gear3d_millstone_roller.obj",
	aspect_w = 480,
	aspect_h = 20,
	length = 2,
	selection = {-0.75, -0.5, -0.75, 0.75, 0.25, 0.75},
	forward = "gear3d_millstone_roller_fwd.png",
	reverse = "gear3d_millstone_roller_rev.png",
	off = "gear3d_millstone_roller_fwd.png^[verticalframe:24:0",
})

minetest.register_node("gear3d:millstone_base", {
	description = "Millstone base",
	drawtype = "mesh",
	mesh = "gear3d_millstone_base.obj",
	tiles = {"gear3d_millstone_base.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.75, -0.5, -0.75, 0.75, 0.25, 0.75},
		},
	},
	groups = {choppy=2, oddly_breakable_by_hand=2},
})

local anim_gearbox_fwd = {
	name = "gear3d_gear_fwd.png",
	animation = {
		type = "vertical_frames",
		aspect_w = 16,
		aspect_h = 16,
		length = 2,
	},
}

local anim_gearbox_rev = {
	name = "gear3d_gear_rev.png",
	animation = {
		type = "vertical_frames",
		aspect_w = 16,
		aspect_h = 16,
		length = 2,
	},
}

minetest.register_node("gear3d:gearbox_fwd", {
	description = "Gearbox forward",
	tiles = {
		{
			name = "gear3d_gear_top_fwd.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2,
			},
		},
		anim_gearbox_fwd,
		anim_gearbox_fwd,
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = {choppy=2, oddly_breakable_by_hand=2},
})

minetest.register_node("gear3d:gearbox_rev", {
	description = "Gearbox reverse",
	tiles = {
		{
			name = "gear3d_gear_top_rev.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2,
			},
		},
		anim_gearbox_rev,
		anim_gearbox_rev,
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = {choppy=2, oddly_breakable_by_hand=2},
})

minetest.register_node("gear3d:gearbox_off", {
	description = "Gearbox stopped",
	tiles = {
		"gear3d_gear_top_fwd.png^[verticalframe:6:0",
		"gear3d_gear_fwd.png^[verticalframe:6:0",
		"gear3d_gear_fwd.png^[verticalframe:6:0",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = {choppy=2, oddly_breakable_by_hand=2},
})
