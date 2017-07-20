<?php
require_once 'core.php';

$user = new User();
$card = new Card();

if (!$card->getEdition(Input::get('edition_id'))) {
	Session::flash('danger', 'Такого выпуска не существует.');
	Redirect::to('/index.php');
}


$tpl = "edition.tpl";
include "templates/body.tpl";