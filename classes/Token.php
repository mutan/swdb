<?php
/*
Создает суперглобальную переменную $_SESSION['token'] и присваевает ей MD5-хэш псевдо-случайной строки из 32 символов
Token::generate();

Сравнивает пришедший через input токен со значением ранее сгенерированного $_SESSION['token']
Token::check();

*/

class Token {
	public static function generate() {
		return Session::put(Config::get('session/token_name'), md5(uniqid()));
	}

	public static function check($token) { // $token = $POST['token']
		$tokenName = Config::get('session/token_name'); //'token'

		if (Session::exists($tokenName) && $token === Session::get($tokenName)) {
			Session::delete($tokenName);
			return true;
		}
		
		return false;
	}
}