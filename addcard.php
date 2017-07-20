<?php
require_once 'core.php';

$user = new User();
if (!$user->isLoggedIn() || !$user->hasPermission('admin')) {
	Redirect::to('/user/login.php');
}

$card = new Card();

if (Input::exists()) {
	try {
		$card_id = $card->create(array(
			'name' => Input::get('name'),
			'image' => Input::get('image'),
			'firepower' => Input::get('firepower'),
			'defence' => Input::get('defence'),
			'features_line' => Input::get('features_line'),
			'command_line1' => Input::get('command_line1'),
			'command_line2' => Input::get('command_line2'),
			'number' => Input::get('number'),
			'flavor' => Input::get('flavor'),
			'comment' => Input::get('comment'),
			'dopotsek' => Input::get('dopotsek'),
			'energy' => Input::get('energy'),
			'strategy' => Input::get('strategy'),
			'edition_id' => Input::get('edition'),
			'rarity_id' => Input::get('rarity')
		), Input::get('race'), Input::get('type'), Input::get('artist'));

		Session::flash('success', 'Карта <strong>' . Input::get('name') . '</strong> записана в базу данных. Вы можете ее <a href="/editcard.php?card_id=' . $card_id . '">отредактировать</a>.');
		Redirect::to('self');
	} catch(Exception $e) {
		die($e->getMessage());
	}
}

$tpl = "addcard.tpl";
include "templates/body.tpl";