<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>StarWorlds Cards Database - beta 0.1</title>
	<link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="shortcut icon" href="../favicon.ico">

	<!-- Google Analitics -->
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		ga('create', 'UA-15454453-2', 'auto');
		ga('send', 'pageview');
	</script>
</head>

<body>

<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">

		<div class="navbar-header visible-md visible-lg">
			<a class="navbar-brand" href="/">База карт ККИ "Звездные миры" <small><sup>beta</sup></small></a>
		</div>

		<form method="post" class="navbar-form navbar-left" role="search" action="/index.php">
			<div class="form-group">
				<input type="text" name="searchName" id="search" class="form-control visible-md visible-lg" placeholder="Поиск по названию карты" size="30">
			</div>
			<input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
			<!-- <input type="submit" name="submit" value="Поиск" class="btn btn-default"></input> -->
		</form>

		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Выпуски<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/edition.php?edition_id=1">Вторжение Орды</a></li>
							</ul>
					</li>

					<li><a href="./proxy.php">Прокси</a></li>
				
				<?php if (isset($user) && $user->isLoggedIn()) { ?>

					<?php if ($user->hasPermission('admin')) { ?>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Редактировать<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/allcardslist.php">Все карты</a></li>
								<li><a href="/addcard.php">Добавить карту</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Таблицы</li>
								<li><a href="/edittable.php?tableName=type">Тип</a></li>
								<li><a href="/edittable.php?tableName=race">Раса</a></li>
								<li><a href="/edittable.php?tableName=artist">Художник</a></li>
								<li><a href="/edittable.php?tableName=edition">Выпуск</a></li>
								<li><a href="/edittable.php?tableName=rarity">Редкость</a></li>
								<li><a href="/edittable.php?tableName=pictograms">Пиктограммы</a></li>
							</ul>
					</li>
					<?php } ?>
				
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><? echo $user->data()->name; ?><b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="dropdown-header">Меню пользователя</li>
								<li><a href="/user/update.php">Профиль</a></li>
								<li><a href="/user/changepassword.php">Сменить пароль</a></li>
								<li><a href="/user/logout.php">Выход</a></li>
							</ul>
					</li>

					<?php if ($user->hasPermission('admin')) { ?>
					<li><a href="/help.php"><span class="glyphicon glyphicon-question-sign"></span></a></li>
					<?php } ?>
				
				<?php } else { ?>
					<!-- <li><a href="/user/login.php"><strong>Войти</strong></a></li> -->
				<?php } ?>
			</ul>
		</div>
	</div>
</div> <!-- /Fixed navbar -->