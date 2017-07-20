<?php if (isset($user) && $user->isLoggedIn()) { ?>

	<div class="row">
		<div class="col-md-3" id="sidebar" role="navigation">
			<div class="page-header"><h4>Справка<small></small></h4></div>
			<ul class="nav">
				<li><a href="/help.php?part=about">О проекте</a></li>
				<li><a href="/help.php?part=menu_edit">Меню "Редактировать"</a></li>
				<li><a href="/help.php?part=tech_info">Техническая информация</a></li>
			</ul>
		</div>

		<div class="col-md-9">

			<?php if (Input::get('part')) { $part = Input::get('part'); } else { $part = 'about'; }?>

			<?php if ($part == 'about') { ?>

				<div class="page-header"><h4>О проекте<small></small></h4></div>
				<p>Каталог карт ККИ "Звездные миры" создан на основе галереи карт с <a href="http://www.starworlds.ru/karty" target="_blank">официального сайта</a> игры.</p>

			<?php } else if ($part == 'menu_edit') { ?>

				<div class="page-header"><h4>Меню "Редактировать"<small></small></h4></div>
				<h4>Все карты</h4>
				<p>Список всех карт в базе данных. По умолчанию отсортирован по названию, также можно отсортировать по номеру карты в выпуске.</p>
				<p><strong>ID</strong> – id карты в базе данных, не отображается пользователю.</p>
				<p><strong>Название</strong> карты – ссылка на редактирование этой карты.</p>
				<p><strong>Выпуск, номер</strong> – издание карты и ее порядковый номер в этом издании.</p>
				<p>Кнопка <span class="glyphicon glyphicon-remove red"></span> удаляет карту из базы данных. Случайное удаление не критично, нужно только правильно заново добавить эту карту (см. след. п. меню)</p>

				<h4>Редактировать – Добавить карту</h4>
				<p>...</p>

			<?php } else if ($part == 'tech_info') { ?>

				<div class="page-header"><h4>Техническая информация<small></small></h4></div>
				<p>Бекенд написан на <a href="http://www.php.net/">PHP</a> + <a href="http://www.mysql.com/">MySQL</a>.</p>
				<p>Фронтенд на <a href="http://getbootstrap.com">Bootstrap</a> v3.2, <a href="http://jquery.org">jQuery</a> v1.11.0.</p>

			<?php } ?>






		</div>

	</div>

<?php } ?>