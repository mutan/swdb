<?php
require_once 'core.php';

$user = new User();
if (!$user->isLoggedIn() || !$user->hasPermission('admin')) {
	Redirect::to('/user/login.php');
}

if (isset($_REQUEST["action"])) {
	switch ($_REQUEST["action"]) {
		case "add": add(); break; // Добавить новую запись в таблицу БД
		case "del": del(); break; // Удалить запись из таблицы БД
		case "update": update(); break; // Обновить запись
	}
}

$tableName = Input::get('tableName');
$table = new Table();
$table->get($tableName);

function add() {
	$table = new Table();
	$table->add(Input::get('tableName'), Input::get('name'));
	Redirect::to('self', array('tableName' => Input::get('tableName')));
}

function del() {
	$table = new Table();
	$table->delete(Input::get('tableName'), Input::get('id'));
	Redirect::to('self', array('tableName' => Input::get('tableName')));
}

function update() {
	if (Input::get('tableName')) {
		$tableName = Input::get('tableName');
		$id = Input::get('id');
		$number = Input::get('number');
		$name = Input::get('name');
		$quantity = Input::get('quantity');
		$date = Input::get('date');
		$path = Input::get('path');

		$table = new Table();

		if($tableName == "edition") {
			$table->update($tableName, $name, $id, $quantity, $date, $path, $number);
		} else if ($tableName == "pictograms") {
			$table->update($tableName, $name, $id, $quantity, $date, $path);
		} else {
			$table->update($tableName, $name, $id);
		}
	}
}






$tpl = "crud2.tpl";
include "templates/body.tpl";