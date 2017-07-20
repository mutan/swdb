<?php
require_once 'core.php';

$user = new User();
if (!$user->isLoggedIn() || !$user->hasPermission('admin')) {
	Redirect::to('/user/login.php');
}

$card = new Card();

if (Input::exists()) {
	try {
		$card->update(array(
			'name' => Input::get('name'),
			'image' => Input::get('image'),
			'firepower' => Input::get('firepower'),
			'defence' => Input::get('defence'),
			'features_line' => Input::get('features_line'),
			'command_line1' => Input::get('command_line1'),
			'command_line2' => Input::get('command_line2'),
			'number' => Input::get('number'),
			'flavor' => Input::get('flavor'),
			'errata' => Input::get('errata'),
			'comment' => Input::get('comment'),
			'dopotsek' => Input::get('dopotsek'),
			'energy' => Input::get('energy'),
			'strategy' => Input::get('strategy'),
			'rarity_id' => Input::get('rarity'),
			'edition_id' => Input::get('edition')			
		), Input::get('race'), Input::get('type'), Input::get('artist'), Input::get('card_id'));

		Session::flash('success', 'Карта обновлена');
		Redirect::to('self', array('card_id' => Input::get('card_id')));
	} catch(Exception $e) {
		die($e->getMessage());
	}
}

if (!$card->get(Input::get('card_id'))) {
	Session::flash('danger', 'Карты с ID ' . Input::get("card_id") . ' не существует. Выберите нужную карту из списка ниже.');
	Redirect::to('allcardslist.php');
}


$tpl = "editcard.tpl";
include "templates/body.tpl";