extends CharacterBody2D

var speed = 200
var combustivel = 100
var balap = preload("res://script/laser.tscn") #chamou tudo que era cena do script no laser.gd
var lado = 1

func _ready():
	$AnimatedSprite2D.play()
	
func _physics_process(delta): #aqui eu acionei a variável speed
	velocity.x = 0
	velocity.y = 0
	
	if  Input.is_action_pressed("ui_up"): #esse priquito aqui determina 
		velocity.y -= speed
	if  Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if  Input.is_action_pressed("ui_right"):
		velocity.x += speed
		$AnimatedSprite2D.flip_h = false
		lado = 1
	if  Input.is_action_pressed("ui_left"): 
		velocity.x -= speed
		$AnimatedSprite2D.flip_h = true
		lado = -1
		
	if Input.is_action_pressed("atira"): #ao pressionado o espaço o botão atira
		$atira.play() #acionado pela string atira, touxe a animação para a cena
		var novabala = balap.instantiate() #balap chamado a partir do preload, criando ela cada vez que ele clica
		novabala.position.x = position.x + 4 #posição em que há o tiro, 4 pixels depois da nave
		novabala.position.y = position.y + 4
		novabala.z_index = -1
		novabala.setLado(lado) #linquei o setlado do script laser.gd
		get_tree().current_scene.add_child(novabala) #adicionar cena do novo tiro
	move_and_slide() 
	
	#EXEMPLO DE POO: classe estado = objeto ceara
	#salvei o main no script
