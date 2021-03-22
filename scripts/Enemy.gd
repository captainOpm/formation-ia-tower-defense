extends Area2D
class_name Enemy

export (float) var speed
var destination

func _process(delta):
	var world = get_node("..")
	if world.dijkstra.has("distance_to_base"):
		var distance = 0
		if destination:
			distance = position.distance_to(destination)
		var move_amount = delta * speed
		if (distance < move_amount):
			var tile_map = world.tile_map
			var tile_pos = tile_map.world_to_map(position)
			destination = tile_map.map_to_world(world.dijkstra["distance_to_base"].get_next(tile_pos))
		position = position.move_toward(destination, move_amount)