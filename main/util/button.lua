local M = {}

local TOUCH = hash("touch")

function M.click(id, action_id, action)
	if not action_id == TOUCH then return false end
	if not action.released then return false end
	return gui.pick_node(gui.get_node(id .. "/button"), action.x, action.y)
end

return setmetatable(M, {
	__call = function(_, ...)
		return M.click(...)
	end
})