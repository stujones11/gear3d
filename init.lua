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

minetest.register_node("gear3d:axle_turning", {
	description = "Axle turning",
	drawtype = "mesh",
	mesh = "gear3d_axle.obj",
	tiles = {
		{
			name = "gear3d_axle.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 96,
				aspect_h = 24,
				length = 1,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	groups = {choppy=2, oddly_breakable_by_hand=2},
})

minetest.register_node("gear3d:windsail_turning", {
	description = "Windsail turning",
	drawtype = "mesh",
	mesh = "gear3d_windsail.obj",
	tiles = {
		{
			name = "gear3d_windsail_fwd.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 144,
				aspect_h = 24,
				length = 1,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	groups = {choppy=2, oddly_breakable_by_hand=2},
})

local anim_gear_fwd = {
	name = "gear3d_gear_fwd.png",
	animation = {
		type = "vertical_frames",
		aspect_w = 16,
		aspect_h = 16,
		length = 2,
	},
}

local anim_gear_rev = {
	name = "gear3d_gear_rev.png",
	animation = {
		type = "vertical_frames",
		aspect_w = 16,
		aspect_h = 16,
		length = 2,
	},
}

minetest.register_node("gear3d:gear_fwd", {
	description = "Gear forward turning",
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
		anim_gear_fwd,
		anim_gear_fwd,
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = {choppy=2, oddly_breakable_by_hand=2},
})

minetest.register_node("gear3d:gear_rev", {
	description = "Gear reverse turning",
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
		anim_gear_rev,
		anim_gear_rev,
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = {choppy=2, oddly_breakable_by_hand=2},
})

minetest.register_node("gear3d:spur_gear_rev", {
	description = "Spur gear reverse turning",
	drawtype = "mesh",
	mesh = "gear3d_spur_gear.obj",
	tiles = {
		{
			name = "gear3d_spur_gear_rev.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 240,
				aspect_h = 16,
				length = 4,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = {choppy=2, oddly_breakable_by_hand=2},
})

minetest.register_node("gear3d:spur_gear_fwd", {
	description = "Spur gear forward turning",
	drawtype = "mesh",
	mesh = "gear3d_spur_gear.obj",
	tiles = {
		{
			name = "gear3d_spur_gear_fwd.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 240,
				aspect_h = 16,
				length = 4,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	groups = {choppy=2, oddly_breakable_by_hand=2},
})
