local modem = peripheral.find("modem")
local turtleName = modem.getNameLocal()
local inter = peripheral.find("ae2:interface_1")
local drawers = peripheral.find("functionalstorage:storage_controller_1")

function grow(slot)
	inter.pushItems(turtleName, 1, 1, 1)
	drawers.pushItems(turtleName, slot, 1, 2)
	turtle.select(2)
	turtle.place()
	turtle.select(1)
	turtle.place()
	turtle.dig()
	turtle.craft()
end

inter.list()
