<?php
require_once 'core.php';

$user = new User();
if (!$user->isLoggedIn() || !$user->hasPermission('admin')) {
	Redirect::to('/user/login.php');
}


if (Input::exists('get')) {
	$subject = "Тест";
	$message = "Привет!";
	$name = "Вася";
	$mail_from = "akim_now@mail.ru";
	$header = "from: $name <$mail_from>"; 
	$to = 'akim_now@mail.ru'; 

	//Mail::send($to, $subject, $message, $header);
}




echo "11";


$tpl = "feedback.tpl";
include "templates/body.tpl";