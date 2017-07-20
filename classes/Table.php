<?php
class Table {

	private $_db,
					$_data;

	public function __construct() {
		$this->_db = DB::getInstance();
	}

	public function get($tableName = null) {

		if ($tableName) {
			$data = $this->_db->query("SELECT * FROM $tableName");

			if($data->count()) {
				$this->_data = $data->results();
				return true;
			}
			return false;
		}
	}

	public function add($tableName, $name) {
		$this->_db->query("INSERT INTO $tableName (name) VALUES (?)", array($name));
	}

	public function delete($tableName, $id) {
		$this->_db->query("DELETE FROM $tableName WHERE id = ?", array($id));
	}

	public function update($tableName, $name, $id, $quantity = null, $date = null, $path = null, $number = null) {
		if ($tableName == 'edition') {
			$this->_db->query("UPDATE $tableName SET name = ?, number = ?, quantity = ?, date = ? WHERE id = ?", array($name, $number, $quantity, $date, $id));
		} else if ($tableName == 'pictograms') {
			$this->_db->query("UPDATE $tableName SET name = ?, path = ? WHERE id = ?", array($name, $path, $id));
		} else {
			$this->_db->query("UPDATE $tableName SET name = ? WHERE id = ?", array($name, $id));
		}
	}

	public function data() {
		return $this->_data;
	}
}