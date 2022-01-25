local M = {}


function M.grid(nodes, columns, spacing, centerx, centery)
	if #nodes == 0 then return end

	-- assume equal sized nodes
	local size = gui.get_size(nodes[1])

	-- center of grid
	local ww, wh = window.get_size()
	centerx = centerx or ww / 2
	centery = centery or wh / 2

	-- calculate top left position of grid
	local rows = math.ceil(#nodes / columns)
	local row_width = (columns * size.x) + ((columns - 1) * spacing)
	local column_height = (rows * size.y) + ((rows - 1) * spacing)
	local sx = centerx - (row_width / 2) + (size.x / 2)
	local sy = centery + (column_height / 2) - (size.y / 2)

	-- layout nodes column by column starting in the top left corner
	for i,node in ipairs(nodes) do
		local c = ((i - 1) % columns)
		local r = math.floor((i - 1) / columns)
		local x = sx + c * (size.x + spacing)
		local y = sy - r * (size.y + spacing)
		gui.set_position(node, vmath.vector3(x, y, 0))
	end
end


return M