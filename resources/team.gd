class_name Team
extends Resource

@export_group("Identity")
@export var team_id: String = ""
@export var team_name: String = ""
@export var city: String = ""
@export var abbreviation: String = ""
@export var primary_color: Color = Color.ROYAL_BLUE
@export var secondary_color: Color = Color.DARK_RED
@export var auxiliary_color: Color = Color.DARK_GOLDENROD
#@export var logo: Texture2D

@export_group("Roster")
@export var roster: Array[Player] = []
@export var max_roster_size: int = 15
@export var min_roster_size: int = 12
@export var starting_five: Array[Player] = []

@export_group("Finances")
@export var salary_cap: int = 100000000
@export var current_payroll: int = 0
@export var budget: int = 0

@export_group("Season Record")
@export var wins: int = 0
@export var losses: int = 0
@export var conference: String = ""
@export var division: String = ""
@export var streak: int = 0

func get_win_percentage() -> float:
	var total := wins + losses
	if total == 0:
		return 0.0
	return float(wins) / total

func get_roster_size() -> int:
	return roster.size()

func add_player(player: Player) -> bool:
	if roster.size() >= max_roster_size:
		return false
	roster.append(player)
	recalculate_payroll()
	return true

func remove_player(player: Player) -> bool:
	var idx := roster.find(player)
	if idx == -1:
		return false
	roster.remove_at(idx)
	starting_five.erase(player)
	recalculate_payroll()
	return true

func recalculate_payroll() -> void:
	current_payroll = 0
	for p in roster:
		current_payroll += p.salary

func get_cap_space() -> int:
	return salary_cap - current_payroll

func record_game_result(won: bool) -> void:
	if won:
		wins += 1
		streak = streak + 1 if streak >= 0 else 1
	else:
		losses += 1
		streak = streak - 1 if streak <= 0 else -1

func reset_season_record() -> void:
	wins = 0
	losses = 0
	streak = 0

func get_player_by_id(id: String) -> Player:
	for p in roster:
		if p.player_id == id:
			return p
	return null
