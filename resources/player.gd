class_name Player
extends Resource

@export_group("Identity")
@export var player_id: String = ""
@export var first_name: String = ""
@export var last_name: String = ""
@export var age: int = 18

@export_enum("PG", "SG", "SF", "PF", "C") var position: String = "PG"

@export_group("Attributes")
@export_range(0, 100) var shooting: int = 50
@export_range(0, 100) var passing: int = 50
@export_range(0, 100) var defense: int = 50
@export_range(0, 100) var rebounding: int = 50
@export_range(0, 100) var speed: int = 50
@export_range(0, 100) var strength: int = 50
@export_range(0, 100) var stamina: int = 50
@export_range(0, 100) var iq: int = 50

@export_group("Development")
@export_range(0, 100) var potential: int = 50
@export var years_pro: int = 0
@export var development_curve: Curve

@export_group("Status")
@export_range(0, 100) var morale: int = 50
@export var is_injured: bool = false
@export var injury_games_remaining: int = 0

@export_group("Contract")
@export var salary: int = 0
@export var contract_years_remaining: int = 0
@export var is_free_agent: bool = false

@export_group("Season Stats")
@export var games_played: int = 0
@export var points_total: int = 0
@export var rebounds_total: int = 0
@export var assists_total: int = 0
@export var minutes_total: float = 0.0

func get_full_name() -> String:
	return "%s %s" % [first_name, last_name]

func get_overall() -> int:
	return shooting

func get_points_per_game() -> float:
	if games_played == 0.0:
		return 0.0
	return 0.0

func get_rebounds_per_game() -> float:
	if games_played == 0.0:
		return 0.0
	return 0.0

func get_assists_per_game() -> float:
	if games_played == 0.0:
		return 0.0
	return 0.0

func reset_season_stats() -> void:
	games_played = 0
	points_total = 0
	rebounds_total = 0
	assists_total = 0
	minutes_total = 0.0
