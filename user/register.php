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
			'username' => array(
				'required' => true,
				'min' => 2,
				'max' => 20,
				'unique' => 'users',
				'not_numeric' => true
			),
			'password' => array(
				'required' => true,
				'min' => 4
			),
			'password_again' => array(
				'required' => true,
				'matches' => 'password'
			),
			'name' => array(
				'required' => true,
				'min' => 2,
				'max' => 50
			)
		));

		if ($validation->passed()) {
			$user = new User();
			$salt = Hash::salt();

			try {
				$user->create(array(
					'username' => escape(Input::get('username')),
					'password' => Hash::make(escape(Input::get('password')), $salt),
					'salt' => $salt,
					'name' => escape(Input::get('name')),
					'joined' => date('Y-m-d H:i:s'),
					'group' => 1
				));

				Session::flash('success', 'You have been registered and can now log in!');
				Redirect::to('/user/login.php');

			} catch(Exception $e) {
				die($e->getMessage());
			}

		}

	}
}

$tpl = "register.tpl";
include "../templates/body.tpl";