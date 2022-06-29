maps = [rm_endless_gr, rm_endless_rg, rm_endless_none]
amount = array_length(maps)
map_choice = random_range(0, amount - 1)
final = round(map_choice) 
targetRoom = maps[final]
targetX = 1100
targetY = 12860
