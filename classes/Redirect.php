<?php
/*
Перенаправляет на другую страницу или выдает страницу ошибки
Redirect::to('index.php');
Redirect::to(404);

*/

class Redirect {
	public static function to($location = null, $fields = array()) {
		if ($location) {

			if ($location == 'self') {
				$location = $_SERVER['PHP_SELF'];
			} else if (is_numeric($location)) {
				switch ($location) {
					case 404:
						header('HTTP/1.0 404 Not Found');
						include '404.php';
						exit();
					break;
				}
			}

			$getStroke = '';
			if ($fields) {
				$x = 0;
				foreach ($fields as $field => $value) {
					if ($x < count($fields)) {
						if (!$x) {
							$getStroke .= '?' . $field . '=' . $value;
						} else {
							$getStroke .= '&' . $field . '=' . $value;
						}
					}
					$x++;
				}
			}

			header('Location: ' . $location . $getStroke);
			exit();
		}
	}
}