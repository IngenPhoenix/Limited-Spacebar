extends CharacterBody2D

@onready var anim: AnimationPlayer = $AnimationPlayer

@export var speed: float = 250.0
@export var health: int = 3

@export var dashStrenght: float = 100.0


var canDash: bool = true
var dashOver: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.player = self
	
	GameManager.gameStarted = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * speed
	
	if canDash:
		if Input.is_action_just_pressed("space") and dashOver:
			velocity = direction * dashStrenght
			var tween = create_tween()
			tween.tween_property(self, "position", position + velocity, 0.25)
			
			GameManager.spacesPressed += 1
			
			$Area2D/CollisionShape2D.disabled = true
			
			dashOver = false
			await get_tree().create_timer(0.3).timeout
			dashOver = true
			
			$Area2D/CollisionShape2D.disabled = false

	move_and_slide()
	
	if GameManager.spacesPressed == GameManager.maxSpaces:
		canDash = false
	else:
		canDash = true

func _damage():
	health -= 1
	
	if health == 0:
		_death()
	
	anim.play("damage")

func _death():
	GameManager.gameStarted = false
	GameManager.isDead = true
	
#	queue_free()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Damage"):
		call_deferred("_damage")
