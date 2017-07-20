<?php
require_once 'core.php';

$user = new User();
if (!$user->isLoggedIn() || !$user->hasPermission('admin')) {
	Redirect::to('/user/login.php');
}

//$res = DB::getInstance()->get("rarity", array('id', '>=', '2'))->results();
//echo var_dump($res);

$tableName = Input::get('tableName');

$result = DB::getInstance()->query("SELECT * FROM $tableName")->results();






$tpl = "crud.tpl";
include "templates/body.tpl";