<?php

class Mail {
	public static function send($to = null, $subject = null, $message = null, $header = null) {

		if ($send_contact = mail($to, $subject, $message, $header)) {
			echo "We've recived your contact information";
		} else {
			echo "ERROR";
		}
	}



}