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
	turtle.craft()
	modem.callRemote(drawers, "pullItems", turtleName, 1)
end

function getCounts()
	local list = modem.callRemote(inter, "list")
	local slots = {}
	for listSlot, listItem in pairs(list) do
		local item = modem.callRemote(inter, "getItemDetail", listSlot)
			if item.tags["botania:petals"] then
				if item.count < 100 then
					slots.append(slot)
				end
			end
		end
	end
	return slots
end

function topUp(slot)
	while (modem.callRemote(inter, "getItemDetail", slot)).count < 125 do
		grow(slot)
	end
end


function main()
	while true do
		local lowStock = getCounts()
		for slot in lowStock do
			topUp(slot)
		end
		sleep 10
	end
end

