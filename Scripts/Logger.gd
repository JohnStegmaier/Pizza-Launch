# Logger.gd
extends Node

enum Level { DEBUG, INFO, WARN, ERROR, OFF }

var current_level: Level = Level.DEBUG

func log_debug(msg: String) -> void:
	if current_level <= Level.DEBUG:
		print("[DEBUG]: ", msg)

func log_info(msg: String) -> void:
	if current_level <= Level.INFO:
		print("[INFO]: ", msg)

func log_warn(msg: String) -> void:
	if current_level <= Level.WARN:
		push_warning("[WARN]: " + msg)

func log_error(msg: String) -> void:
	if current_level <= Level.ERROR:
		push_error("[ERROR]: " + msg)
