extends Sprite
signal taken_out()
signal was_selected(piece)
signal was_deselected(piece)
class_name Piece
export(Array) var SELECT_COLORS: Array
var selected: bool = false

func set_piece(board_pos: Vector2) -> void:
	self.global_position = board_pos

func piece_taken_out() -> void:
	self.emit_signal("taken_out")
	self.queue_free()

func select() -> void:
	self.selected = not self.selected
	self.self_modulate = self.SELECT_COLORS[int(self.selected)]
	if self.selected:
		self.emit_signal("was_selected", self)
	else:
		self.emit_signal("was_deselected", self)
