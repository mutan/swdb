<?php
require_once 'core.php';

$user = new User();
$card = new Card();

if (!$card->get(Input::get('card_id'))) {
	Session::flash('danger', 'Такой карты не существует. Воспользуйтесь поиском.');
	Redirect::to('/index.php');
}

if ($user->isLoggedIn() || $user->hasPermission('admin')) {
	$edit = '/editcard.php?card_id=' . $card->data()->id;
}


$tpl = "card.tpl";
include "templates/body.tpl";