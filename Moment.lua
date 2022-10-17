function wear(id)
pkt = {}
pkt.type = 10
pkt.int_data = id
send_packet_raw(pkt)
end

function drop(id)
for _, item in pairs(get_backpack()) do
if item.item_id == id then
send_packet(2,"action|drop\n|itemID|"..id)
send_packet(2,"action|dialog_return\ndialog_name|drop_item\nitemID|"..id.."|\ncount|"..item.amount)
end
end
end

function enter()
pkt = {}
pkt.type = 7
pkt.tile_x = math.floor(get_local().pos_x / 32)
pkt.tile_y = math.floor(get_local().pos_y / 32)
send_packet_raw(pkt)
end

function punch(x,y)
pkt = {}
pkt.type = 3
pkt.tile_x = math.floor(get_local().pos_x / 32) + x
pkt.tile_y = math.floor(get_local().pos_y / 32) + y
pkt.pos_x = get_local().pos_x
pkt.pos_y = get_local().pos_y
pkt.int_data = 18
send_packet_raw(pkt)
end

function wrench(x,y)
pkt = {}
pkt.type = 3
pkt.tile_x = math.floor(get_local().pos_x / 32) + x
pkt.tile_y = math.floor(get_local().pos_y / 32) + y
pkt.pos_x = get_local().pos_x
pkt.pos_y = get_local().pos_y
pkt.int_data = 32
send_packet_raw(pkt)
end

function move(x,y)
posx = math.floor(get_local().pos_x / 32)
posy = math.floor(get_local().pos_y / 32)
find_path(posx + x, posy + y)
end

function place(id,x,y)
pkt = {}
pkt.type = 3
pkt.tile_x = math.floor(get_local().pos_x / 32) + x
pkt.tile_y = math.floor(get_local().pos_y / 32) + y
pkt.pos_x = get_local().pos_x
pkt.pos_y = get_local().pos_y
pkt.int_data = id
send_packet_raw(pkt)
end

function say(text)
send_packet(2, "action|input\n|text|"..text)
end

function sendPacket(type,packet)
send_packet(type,packet)
end

function sendPacketRaw(packet)
send_packet_raw(packet)  
end

function collectSet(status, range)
toggle_button(AUTO_COLLECT, status)
toggle_button(FORCE_AUTO_COLLECT, status)
input_button(COLLECT_RANGE, range)
end

function collect(range)
toggle_button(AUTO_COLLECT, true)
toggle_button(FORCE_AUTO_COLLECT, true)
input_button(COLLECT_RANGE, range)
sleep(200)
toggle_button(AUTO_COLLECT, false)
toggle_button(FORCE_AUTO_COLLECT, false)
input_button(COLLECT_RANGE, range)
end

function findItem(id)
for key, value in pairs(get_backpack()) do
if value.item_id == id then
return value.amount
end
end
return 0
end

function findPath(x,y)
return find_path(x,y)
end

function getBot()
local bot = {}
bot.x = get_local().pos_x
bot.y = get_local().pos_x
bot.name = get_local().name
bot.world = get_world().name
return bot
end

function getTile(x,y)
local tile = {}
tiles = get_tile(x,y)
tile.fg = tiles.foreground
tile.bg = tiles.background
tile.ready = tiles.ready_to_harvest
tile.x = x
tile.y = y
return tile
end

function getTiles()
local tiles = {}
for key, value in pairs(get_tiles()) do
tiles[#tiles + 1] = {fg = value.foreground, bg = value.background, ready = value.ready_to_harvest, x = value.x, y = value.y}
end
return tiles
end

function getObjects()
local obj = {}
for key, value in pairs(get_objects()) do
obj[#obj + 1] = {id = value.item_id, count = value.amount, x = value.pos_x, y = value.pos_y , oid = value.object_id}
end
return obj
end

function getPlayers()
local players = {}
for key, value in pairs(get_players()) do
players[#players + 1] = {name = value.name, netid = value.net_id, userid = value.user_id, x = value.pos_x, y = value_pos_y}
end
return players
end

function getInventory()
local inventory = {}
for key, value in pairs(get_backpack()) do
inventory[#inventory + 1] = {id = value.item_id, count = value.amount}
end
return inventory
end
