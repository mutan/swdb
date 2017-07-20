<?php
require_once 'core.php';

$user = new User();
$card = new Card();

if (Input::exists() && Input::get('searchName')) {
	if (Token::check(Input::get('token'))) {

		if ($card->searchName(escape(Input::get('searchName')))) {
			Session::flash('success', 'Результат поиска: ' . count($card->data()) . ' ' . getNumEnding(count($card->data()), array('карта', 'карты', 'карт')));
		} else {
			Session::flash('danger', 'Поиск не дал результатов.');
		}
	}
}

if (Input::exists('get')) {

	$data = array (
		'race' => Input::get('race'),
		'rarity' => Input::get('rarity'),
		'type' => Input::get('type'),
		'edition' => Input::get('edition'),
		'artist' => Input::get('artist'),
		'features_line' => Input::get('features_line'),
		'command_line' => Input::get('command_line'),
		'dopotsek' => Input::get('dopotsek'),
		'crown' => Input::get('crown'),
		'hand' => Input::get('hand'),
		'asteroid' => Input::get('asteroid'),
		'strategy' => Input::get('strategy')
	);

	if ($card->search($data)) {
		Session::flash('success', 'Результат поиска: ' . count($card->data()) . ' ' . getNumEnding(count($card->data()), array('карта', 'карты', 'карт')));
	} else {
		Session::flash('danger', 'Поиск не дал результатов.');
	}
}


$tpl = 'index.tpl';
include "templates/body.tpl";