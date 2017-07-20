<?php
/*
Проверяет существование суперглобальной переменной $_SESSION[$name]
Session::exists($name);

Создает суперглобальную переменную $_SESSION[$name] = $value
Session::put($name, $value);

Получает значение суперглобальной переменной $_SESSION[$name]
Session::get($name);

Удаляет суперглобальную переменую $_SESSION[$name]
Session::delete($name);

Возвращает значение суперглобальной переменной $_SESSION[$name] и удаляет ее, если она существует, или создает такую переменную
Session::flash($name, $string);

*/

class Session {
	public static function exists($name) {
		return (isset($_SESSION[$name])) ? true : false;
	}

	public static function put($name, $value) {
		return $_SESSION[$name] = $value;
	}

	public static function get($name) {
		return $_SESSION[$name];
	}

	public static function delete($name) {
		if (self::exists($name)) {
			unset($_SESSION[$name]);
		}
	}

	public static function flash($name, $string = '') {
		if (self::exists($name)) {
			$session = self::get($name);
			self::delete($name);
			return $session;
		} else {
			self::put($name, $string);
		}
	}
}