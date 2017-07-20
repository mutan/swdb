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
			'name' => array(
				'required' => true,
				'min' => 2,
				'max' => 50
			)
		));

		if ($validation->passed()) {
			try {
				$user->update(array(
					'name' => escape(Input::get('name'))
				));

				Session::flash('success', 'Your details have been updated');
				Redirect::to('self');
			} catch(Exception $e) {
				die($e->getMessage());
			}
		}
	}
}

$tpl = "update.tpl";
include "../templates/body.tpl";