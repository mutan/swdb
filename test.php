<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	</head>
<body>

	<p>

			<form action="" method="post">
				<div class="col-md-8">
					<label for="username">Username</label>
					<input type="text" name="username" id="username" class="form-control" value="" autocomplete="off">
				</div>

				<input type="submit" value="Register">


			</form>

			<br><br>


		<?php
			require_once 'core.php';
			//echo Config::get('session/token_name');

			//$res = DB::getInstance()->get("rarity", array('id', '>=', '2'))->results();
			//echo var_dump($res);

			// if ($res = DB::getInstance()->insert('rarity', array('name' => 'eeee'))) {
			// 	echo 'true';
			// }

			// if ($res = DB::getInstance()->update('rarity', '7', array('name' => 'ef'))) {
			// 	echo 'true';
			// }



		?>
	</p>

</body>
</html>