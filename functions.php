<?php

function escape($string) {
	return htmlentities($string, ENT_QUOTES, 'UTF-8');
}

/**
 * Функция возвращает окончание для множественного числа слова на основании числа и массива окончаний
 * @param  $number Integer Число на основе которого нужно сформировать окончание
 * @param  $endingsArray  Array Массив слов или окончаний для чисел (1, 4, 5),
 *         например array('яблоко', 'яблока', 'яблок')
 * @return String
 */
function getNumEnding($number, $endingArray) {
	$number = $number % 100;
	if ($number>=11 && $number<=19) {
		$ending=$endingArray[2];
	} else {
		$i = $number % 10;
		switch ($i) {
			case (1): $ending = $endingArray[0]; break;
			case (2):
			case (3):
			case (4): $ending = $endingArray[1]; break;
			default: $ending=$endingArray[2];
		}
	}
	return $ending;
}

function makePictograms($text, $tags = array(), $pictograms = array()) {
	$tags = array('{star}', '{hand}', '{crown}', '{inst}', '{tap}', '{asteroid}', '{shrapnel}');
	$pictograms = array('/images/icon-star.png', '/images/icon-hand.png', '/images/icon-crown.png', '/images/icon-inst.png', '/images/icon-tap.png', '/images/icon-asteroid.png', '/images/icon-shrapnel.png');

	foreach ($pictograms as $item) {
		$img[] = '<img src="'.$item.'">';
	}
	$data = str_replace($tags, $img, $text);
	echo $data;
}