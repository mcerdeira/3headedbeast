extends Node
var shaker_obj = null
var player_obj = null
var gameman_obj = null
var selector_obj = null
var GAMEOVER = false
var FULLSCREEN = false
var MAIN_THEME = null
var scrolling_speed_total = 100
var scrolling_speed = scrolling_speed_total
var current_lvl = 1.0
var current_level_max = 5.0
var current_level_val = 0.0
#Effect duration
var sword_ttl = 5.0
var tongue_ttl = 3.0
var bullet_ttl = 3.0

#Fire rate bullets
var blue_ttl_total = 1.3
var green_ttl_total = 2.3
var purple_ttl_total = 3.5

#Damage
var blue_dmg = 7
var green_dmg = 7
var purple_dmg = 7
var sword_dmg = 1
var fire_dmg = 1

var Items = []

## FIRE RATE ITEMS ##
var item_blue_ttl = {
	"title": "Blue Fire rate--",
	"description": "Decreases fire rate to blue parts.",
	"icon": "blue",
	"action": Callable(self, "add_blue_ttl")
}
var item_green_ttl= {
	"title": "Green Fire rate--",
	"description": "Decreases fire rate to blue parts.",
	"icon": "green",
	"action": Callable(self, "add_green_ttl")
}
var item_purple_ttl = {
	"title": "Purple Fire rate--",
	"description": "Decreases purple rate to blue parts.",
	"icon": "purple",
	"action": Callable(self, "add_purple_ttl")
}

## TIME ITEMS ##
var item_sword_ttl = {
	"title": "Sword Duration++",
	"description": "Increases duration to swords.",
	"icon": "player",
	"action": Callable(self, "add_sword_ttl")
}
var item_tongue_ttl = {
	"title": "Fire Duration++",
	"description": "Increases duration to swords.",
	"icon": "player",
	"action": Callable(self, "add_fire_ttl")
}
var item_bullet_ttl = {
	"title": "Bullets Duration++",
	"description": "Increases duration to bullets.",
	"icon": "player",
	"action": Callable(self, "add_bullet_ttl")
}


## DMG ITEMS ##
var item_blue_dmg = {
	"title": "Blue Dmg++",
	"description": "Increases damage to blue parts.",
	"icon": "blue",
	"action": Callable(self, "add_blue_dmg")
}
var item_green_dmg = {
	"title": "Green Dmg++",
	"description": "Increases damage to green parts.",
	"icon": "green",
	"action": Callable(self, "add_green_dmg")
}
var item_purple_dmg = {
	"title": "Purple Dmg++",
	"description": "Increases damage to purple parts.",
	"icon": "purple",
	"action": Callable(self, "add_purple_dmg")
}
var item_sword_dmg = {
	"title": "Sword Dmg++",
	"description": "Increases damage to swords.",
	"icon": "player",
	"action": Callable(self, "add_sword_dmg")
}
var item_fire_dmg = {
	"title": "Fire Dmg++",
	"description": "Increases damage to fire.",
	"icon": "player",
	"action": Callable(self, "add_fire_dmg")
}

## ITEMS ##
var item_green = {
	"title": "Green body part",
	"description": "Cross spread shot.",
	"icon": "green",
	"action": Callable(self, "add_green")
}
var item_blue = {
	"title": "Blue body part",
	"description": "Shoots 1 bullet in random direction.",
	"icon": "blue",
	"action": Callable(self, "add_blue")
}
var item_yellow = {
	"title": "Yellow body part",
	"description": "Uses a sword in a circled area.",
	"icon": "yellow",
	"action": Callable(self, "add_yellow")
}
var item_purple = {
	"title": "Purple body part",
	"description": "Radial spread shot.",
	"icon": "purple",
	"action": Callable(self, "add_purple")
}
var item_sword = {
	"title": "[Head] a sword",
	"description": "Uses a sword in a circled area.",
	"icon": "player",
	"action": Callable(self, "add_sword")
}
var item_fire = {
	"title": "[Head] fire breath",
	"description": "Spits fire forward.",
	"icon": "player",
	"action": Callable(self, "add_fire")
}

func add_green():
	Global.player_obj.add_part("green")
	
func add_blue():
	Global.player_obj.add_part("blue")
	
func add_yellow():
	Global.player_obj.add_part("yellow")
	
func add_purple():
	Global.player_obj.add_part("purple")
	
func add_sword():
	Global.player_obj.add_sword()
	
func add_fire():
	Global.player_obj.add_fire()

func add_blue_dmg():
	Global.blue_dmg += 1
	
func add_green_dmg():
	Global.green_dmg += 1
	
func add_purple_dmg():
	Global.purple_dmg += 1
	
func add_sword_dmg():
	Global.sword_dmg += 1
	
func add_fire_dmg():
	Global.fire_dmg += 1
	
func add_sword_ttl():
	Global.sword_ttl += 1
	
func add_fire_ttl():
	Global.tongue_ttl += 1
	
func add_bullet_ttl():
	Global.bullet_ttl += 1

func add_blue_ttl():
	Global.blue_ttl_total -= 0.1
	
func add_green_ttl():
	Global.green_ttl_total -= 0.1
	
func add_purple_ttl():
	Global.purple_ttl_total -= 0.1
	
func init_vars():
	#MAIN_THEME = load("res://music/Night On Bald Mountain.mp3")
	Global.Items.append(item_blue_ttl)
	Global.Items.append(item_green_ttl)
	Global.Items.append(item_purple_ttl)
	Global.Items.append(item_sword_ttl)
	Global.Items.append(item_tongue_ttl)
	Global.Items.append(item_bullet_ttl)
	Global.Items.append(item_blue_dmg)
	Global.Items.append(item_green_dmg)
	Global.Items.append(item_purple_dmg)
	Global.Items.append(item_sword_dmg)
	Global.Items.append(item_fire_dmg)
	Global.Items.append(item_green)
	Global.Items.append(item_blue)
	Global.Items.append(item_yellow)
	Global.Items.append(item_purple)
	Global.Items.append(item_sword)
	Global.Items.append(item_fire)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	init_vars()
	Music.play(MAIN_THEME, 0.0)
	
func check_levelup():
	Global.current_level_val += 1
	if Global.current_level_val >= Global.current_level_max:
		Global.current_lvl += 1
		Global.current_level_val = 0
		Global.current_level_max *= 2.3
		Global.selector_obj.show_options()
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_fullscreen"):
		Global.FULLSCREEN = !Global.FULLSCREEN
		if Global.FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			return
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			return

func emit(_global_position, count, particle_obj = null, size = 1):
	var part = particle_obj
	for i in range(count):
		var p = part.instantiate()
		p.global_position = _global_position
		p.size = size
		add_child(p)
	
func pick_random(container):
	if typeof(container) == TYPE_DICTIONARY:
		return container.values()[randi() % container.size() ]
	assert( typeof(container) in [
			TYPE_ARRAY, TYPE_PACKED_COLOR_ARRAY, TYPE_PACKED_INT32_ARRAY,
			TYPE_PACKED_BYTE_ARRAY, TYPE_PACKED_FLOAT32_ARRAY, TYPE_PACKED_STRING_ARRAY,
			TYPE_PACKED_VECTOR2_ARRAY, TYPE_PACKED_VECTOR3_ARRAY
			], "ERROR: pick_random" )
	return container[randi() % container.size()]

func play_sound(stream: AudioStream, options:= {}, _global_position = null, delay = 0.0) -> AudioStreamPlayer:
	var audio_stream_player = AudioStreamPlayer.new()
	audio_stream_player.process_mode = Node.PROCESS_MODE_ALWAYS

	add_child(audio_stream_player)
	audio_stream_player.stream = stream
	audio_stream_player.bus = "SFX"
	
	for prop in options.keys():
		audio_stream_player.set(prop, options[prop])
		
	if delay > 0.0:
		var timer = Timer.new()
		timer.wait_time = delay
		timer.one_shot = true
		timer.connect("timeout", audio_stream_player.play)
		add_child(timer)
		timer.start()
	else:
		audio_stream_player.play()
		
	audio_stream_player.finished.connect(kill.bind(audio_stream_player))
	
	return audio_stream_player
	
func kill(_audio_stream_player):
	if _audio_stream_player and is_instance_valid(_audio_stream_player):
		_audio_stream_player.queue_free()

func is_ok_FX(pos):
	return true
