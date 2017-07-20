<?php
require_once '../core.php';

$user = new User();

if ($user->isLoggedIn()) {
	Redirect::to('/index.php');
}

if (Input::exists()) {
	if (Token::check(Input::get('token'))) {

		$validate = new Validate();
		$validation = $validate->check($_POST, array(
			'username' => array('required' => true),
			'password' => array('required' => true)
		));

		if ($validation->passed()) {
			$user = new User();
			$remember = (escape(Input::get('remember')) === 'on') ? true : false;
			$login = $user->login(escape(Input::get('username')), escape(Input::get('password')), $remember);

			if ($login) {
				Redirect::to('/index.php');
			} else {
				Session::flash('danger', 'Logging in failed');
			}
		}
	}
}

$tpl = "login.tpl";
include "../templates/body.tpl";