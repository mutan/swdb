<?php

# Позволяет обращаться к глобальному массиву $GLOBALS['config'], содержащему настройки системы, при помощи конструкции
# Config::get('mysql/host') // возвращает значение host

class Config {
	public static function get($path = null) {
			if ($path) {
			$config = $GLOBALS['config'];
			$path = explode('/', $path);

			foreach ($path as $bit) {
				if (isset($config[$bit])) {
					$config = $config[$bit];
				}
			}
			return $config;
		}
		return false;
	}
}