local modem = peripheral.find("modem")
local turtleName = modem.getNameLocal()
print("turtle: ", turtleName)

local names = modem.getNamesRemote()
print("network names: ", textutils.serialize(names))

-- function grow(slot)
-- 	inter.pushItems(turtleName, 1, 1, 1)
-- 	drawers.pushItems(turtleName, slot, 1, 2)
-- 	turtle.select(2)
-- 	turtle.place()
-- 	turtle.select(1)
-- 	turtle.place()
-- 	turtle.dig()
-- 	turtle.craft()
-- end

modem.closeAll()
