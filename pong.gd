extends Node2D

var player1_goals : int = 0
var player2_goals : int = 0

var ball_scene = preload("res://ball.tscn")
var ball_center = Vector2(640,360)

@onready var respawn_ball: Timer = $respawnBall
@onready var player_1_score: Label = $Score/Player1Score
@onready var player_2_score: Label = $Score/Player2Score



func _on_player_1_goal_body_entered(body: Node2D) -> void:
	print('goal against player 1')
	reset_ball(body, "p2")


func _on_player_2_goal_body_entered(body: Node2D) -> void:
	print('goal against player 2')
	reset_ball(body, "p1")


func reset_ball(body: Node2D, player: String):
	if player == 'p1':
		player1_goals += 1
	elif player == 'p2':
		player2_goals += 1
	body.queue_free()
	$respawnBall.start()


func _on_respawn_ball_timeout() -> void:
	var ball = ball_scene.instantiate()
	ball.position = ball_center
	add_child(ball)
	$Score/Player1Score.text = str(player1_goals)
	$Score/Player2Score.text = str(player2_goals)
	respawn_ball.stop()
