<?php
require_once '../core.php';

$user = new User();

if (!$user->isLoggedIn()) {
	Redirect::to('/user/login.php');
}

if (Input::exists()) {
	if (Token::check(Input::get('token'))) {

		$validate = new Validate();
		$validation = $validate->check($_POST, array(
			'password_current' => array(
				'required' => true,
				'min' => 4
			),
			'password_new' => array(
				'required' => true,
				'min' => 4
			),
			'password_new_again' => array(
				'required' => true,
				'min' => 4,
				'matches' => 'password_new'
			)
		));

		if ($validation->passed()) {
			
			if (Hash::make(escape(Input::get('password_current')), $user->data()->salt) !== $user->data()->password) {
				echo 'You current password is wrong';
			} else {
				$salt = Hash::salt();
				$user->update(array(
					'password' => Hash::make(escape(Input::get('password_new')), $salt),
					'salt' => $salt
				));

				Session::flash('success', 'Your password has been changed');
				Redirect::to('self');
			}
		}
	}
}

$tpl = "changepassword.tpl";
include "../templates/body.tpl";