local modem = peripheral.find("modem")
local turtleName = modem.getNameLocal()
local inter = "ae2:interface_1"
local drawers = "functionalstorage:storage_controller_1"

function grow(slot)
	modem.callRemote(inter, "pushItems", turtleName, 1, 1, 1)
	modem.callRemote(drawers, "pushItems", turtleName, slot, 1, 2)
	turtle.select(2)
	turtle.place()
	turtle.select(1)
	turtle.place()
	turtle.dig("right")
	local success, reason = turtle.craft()
	if not success then
		print("Unable to craft: ", reason)
	end
end

grow(1)
