<?php

/*
Экземпляр класса создается конструкцией $db = DB::getInstance();
Если ранее во время работы скрипта уже был создан экземпляр, новый не создается, а возвращается существующий.

Универсальный способ сделать запрос
$db->query('sql query', array('parameters'));
$db->query("SELECT * FROM users WHERE id = ?", array('17'));

Запрос SELECT
$db->get($table, array($field, $operation, $value));
$db->get('users', array('username', '=', 'Admin')); // SELECT * FROM users WHERE username = Admin

Запрос DELETE
$db->delete($table, array($field, $operation, $value));
$db->delete('users', array('username', '=', 'Admin')); // DELETE * FROM users WHERE username = Admin

Запрос INSERT
db->insert($table, array(field1 => value1, field2 => value2)); 
db->insert('users', array('username' => 'Admin', 'password' => 12345));  // INSERT INTO users (username, password) VALUES ('Admin', 12345)

Запрос UPDATE
db->update($table, $id, array(field1 => value1, field2 => value2));
db->update($table, $id, array('username' => Admin, 'password' => 12345)); // UPDATE users SET 'username' = Admin, 'password' = 12345 WHERE id = {$id}

$db->results() // возвращает результирующий набор SQL запроса в виде массива объектов
$db->first() // возвращает первый объект результирующего набора
$db->count() // возвращает количество строк, модифицированных последним SQL запросом
$db->last() // возвращает ID последней вставленной строки

*/

class DB {

	private static $_instance = null;
	private $_pdo,
					$_query,
					$_error = false,
					$_results,
					$_lastId,
					$_count = 0;

	private function __construct() {
		try {
			$this->_pdo = new PDO('mysql:host=' . Config::get('mysql/host') . '; dbname=' . Config::get('mysql/db') . '; charset=utf8', Config::get('mysql/username'), Config::get('mysql/password'));
		} catch(PDOException $e) {
			die($e->getMessage());
		}
	}

	public static function getInstance() {
		if(!isset(self::$_instance)) {
			self::$_instance = new DB;
		}
		return self::$_instance;
	}

	public function query($sql, $params = array()) {
		$this->_error = false;

		if ($this->_query = $this->_pdo->prepare($sql)) {
			$x = 1;
			if (count($params)) {
				foreach ($params as $param) {
					$this->_query->bindValue($x, $param);
					$x++;
				}
			}

			if ($this->_query->execute()) {
				$this->_results = $this->_query->fetchAll(PDO::FETCH_OBJ);
				$this->_count = $this->_query->rowCount();
				$this->_lastId = $this->_pdo->lastInsertId();
			} else {
				$this->_error = true;
				$this->_results = null;
			}
		}

		return $this;
	}

	public function action($action, $table, $where = array()) {
		if (count($where) === 3) {
			$operators = array('=', '>', '<', '>=', '<=', 'LIKE');

			$field 		= $where[0];
			$operator = $where[1];
			$value		= $where[2];

			if (in_array($operator, $operators)) {
				$sql = "{$action} FROM {$table} WHERE {$field} {$operator} ?";
				if (!$this->query($sql, array($value))->error()) {
					return $this;
				}
			}
		}

		return false;
	}

	public function get($table, $where) {
		return $this->action('SELECT *', $table, $where);
	}

	public function delete($table, $where) {
		return $this->action('DELETE', $table, $where);
	}

	public function insert($table, $fields = array()) {
		$keys = array_keys($fields);
		$values = '';
		$x = 1;

		foreach ($fields as $field) {
			$values .= '?';
			if ($x < count($fields)) {
				$values .= ', ';
			}
			$x++;
		}

		$sql = "INSERT INTO {$table} (`" . implode('`, `', $keys) . "`) VALUES ({$values})";

		if (!$this->query($sql, $fields)->error()) {
			return true;
		}

		return false;
	}

	public function update($table, $id, $fields) {
		$set = '';
		$x = 1;

		foreach ($fields as $name => $value) {
			$set .= "{$name} = ?";
			if ($x < count($fields)) {
				$set .= ', ';
			}
			$x++;
		}

		$sql = "UPDATE {$table} SET {$set} WHERE id = {$id}";

		if (!$this->query($sql, $fields)->error()) {
			return true;
		}

		return false;
	}

	public function results() {
		return $this->_results;
	}

	public function first() {
		return $this->results()[0];
	}

	public function error() {
		return $this->_error;
	}

	public function count() {
		return $this->_count;
	}

	public function last() {
		return $this->_lastId;
	}

}