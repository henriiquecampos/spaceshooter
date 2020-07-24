extends Timer


export var resource_path: NodePath
export var recharge_per_second := 10.0

onready var resource: ActionResource = get_node_or_null(resource_path)

func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	resource.current += recharge_per_second * delta
	if resource.current >= resource.max_amount:
		resource.depleted = false
		set_process(false)


func _on_timeout() -> void:
	set_process(true)


func _on_Energy_changed(new_amount) -> void:
	if not is_processing():
		start()
