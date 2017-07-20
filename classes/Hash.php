<?php
class Hash {
	public static function make($string, $salt = '') {
		return hash('sha256', $string . $salt);
	}

	public static function salt() {
		return $salt = md5(uniqid());
		//$salt = uniqid(mt_rand(), true);
		//return mcrypt_create_iv($length);
	}

	public static function unique() {
		return self::make(uniqid());
	}
}