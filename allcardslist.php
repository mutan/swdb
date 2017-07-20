<?php
require_once 'core.php';

$user = new User();
if (!$user->isLoggedIn() || !$user->hasPermission('admin')) {
	Redirect::to('/user/login.php');
}

if (isset($_REQUEST["action"])) {
	switch ($_REQUEST["action"]) {
		case "delete": delete(); break;
	}
}

$card = new Card();

$sort = (in_array(Input::get('sort'), array("id", "name", "edition", "number"))) ? Input::get('sort') : 'name';
$card->getAllCards($sort);

function delete() {
	$card = new Card();
	$card->delete(escape(Input::get('id')));
}

$tpl = "allcardslist.tpl";
include "templates/body.tpl";