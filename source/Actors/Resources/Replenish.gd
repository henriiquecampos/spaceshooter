extends Timer

signal started
signal finished

export var resource_path: NodePath
export var recharge_per_second := 10.0

onready var resource: ActionResource = get_node_or_null(resource_path)


func _ready() -> void:
	resource.connect("depleted", self, "_on_Resource_depleted")


func _process(delta: float) -> void:
	resource.current += recharge_per_second * delta
	if resource.current >= resource.max_amount:
		resource.depleted = false
		set_process(false)
		emit_signal("finished")


func _on_timeout() -> void:
	set_process(true)
	emit_signal("started")


func _on_Resource_depleted() -> void:
	start()
