<?php
error_reporting(-1);
header('Content-Type: text/html; charset=utf-8');
define('FPDF_FONTPATH', './plugins/fpdf/font/');
require_once './plugins/fpdf/fpdf.php';
require_once 'core.php';

$user = new User();
$card = new Card();

if (Input::exists()) {
	if (Token::check(Input::get('token'))) {

		$list = escape(Input::get('proxy'));
		$list = explode("\n", $list);
		$errors = array();

		foreach ($list as $item) {
			$item = trim($item);
			$item = str_replace(array("'", "\"", "&quot;"), "", $item);

			if (!preg_match("/^[0-9]+\s[а-яА-Я\s]+/u", $item)) {
				if ($item == '') {
					$errors[] = "Неверный формат строки: (пустая строка)";
				} else {
					$errors[] = "Неверный формат строки: " . $item;
				}
			} else {
				$x = 0;
				$number = '';

				while ($item[$x] != ' ') {
					$number .= $item[$x];
					$x++;
				}

				$name = mb_substr($item, $x+1);

				for ($i = 0; $i < $number; $i++) {
					$string = str_replace(array("'", "\"", "&quot;"), "", $name);
					$card->searchName($string);

						foreach ($card->data() as $item) {
							$proxyImages[] = mb_substr($item->image, 1);
						}
				}
			}
		}


		if (empty($errors)) {
			
			class PDF extends FPDF {
				function Header() {
					$this->SetFont('Arial', '', 10);
					$this->Cell(0, 0, $this->Write(0,'www.starworlds.ru','http://starworlds.ru'), 0, 0, 'C');
				}
			}


			$pdf = new PDF();
			$pdf->Open();

			$pages = ceil(count($proxyImages) / 9);

			for ($i = 0; $i < $pages; $i++) {

				$pdf->AddPage();

				if (isset($proxyImages[0 + $i * 9])) {
					$pdf->image($proxyImages[0 + $i * 9], 10, 15, 64, 89.5);
				}

				if (isset($proxyImages[1 + $i * 9])) {
					$pdf->image($proxyImages[1 + $i * 9], 74.5, 15, 64, 89.5);
				}

				if (isset($proxyImages[2 + $i * 9])) {
					$pdf->image($proxyImages[2 + $i * 9], 139, 15, 64, 89.5);
				}

				if (isset($proxyImages[3 + $i * 9])) {
					$pdf->image($proxyImages[3 + $i * 9], 10, 105, 64, 89.5);
				}

				if (isset($proxyImages[4 + $i * 9])) {
					$pdf->image($proxyImages[4 + $i * 9], 74.5, 105, 64, 89.5);
				}

				if (isset($proxyImages[5 + $i * 9])) {
					$pdf->image($proxyImages[5 + $i * 9], 139, 105, 64, 89.5);
				}

				if (isset($proxyImages[6 + $i * 9])) {
					$pdf->image($proxyImages[6 + $i * 9], 10, 195, 64, 89.5);
				}
				
				if (isset($proxyImages[7 + $i * 9])) {
					$pdf->image($proxyImages[7 + $i * 9], 74.5, 195, 64, 89.5);
				}

				if (isset($proxyImages[8 + $i * 9])) {
					$pdf->image($proxyImages[8 + $i * 9], 139, 195, 64, 89.5);
				}
			}

			switch (Input::get('radioOptions')) {
				case 'fileOpen':
					$pdf->Output();
				break;
				case 'fileDownload':
					$pdf->Output('starworlds-proxy.pdf', D);
				break;
			}	

		}

	} # if (Token::check(Input::get('token')))
} # if (Input::exists())


$tpl = "proxy.tpl";
include "templates/body.tpl";