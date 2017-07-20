<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<form class="form-horizontal" role="form" action='' method="POST">
			<div id="legend">
				<legend>Регистрация</legend>
			</div>

			<div class="col-md-12">
				<?php if (isset($validation)) { ?>
					<p class="text-danger">
						<?php foreach ($validation->errors() as $error) { echo $error . "<br>"; } ?>
					</p>
				<?php } ?>
				<?php if (Session::exists('danger')) { ?><p class="bg-danger text-center"><?php echo Session::flash('danger'); ?></p><?php } ?>
				<?php if (Session::exists('success')) { ?><p class="bg-success text-center"><?php echo Session::flash('success'); ?></p><?php } ?>
			</div>

			<div class="form-group">
				<label for="username" class="col-md-4 control-label">Логин</label>
				<div class="col-md-8">
					<input type="text" name="username" id="username" class="form-control" value="<?php echo escape(Input::get('username'));?>" autocomplete="off">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-md-4 control-label">Пароль</label>
				<div class="col-md-8">
					<input type="password" name="password" id="password" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label for="password_again" class="col-md-4 control-label">Пароль еще раз</label>
				<div class="col-md-8">
					<input type="password_again" name="password_again" id="password_again" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-md-4 control-label">Ваше имя</label>
				<div class="col-md-8">
					<input type="text" name="name" id="name" class="form-control" value="<?php echo escape(Input::get('name'));?>">
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-8 col-md-offset-4">
					<input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
					<button class="btn btn-primary">Зарегистрироваться</button>
				</div>
			</div>
		</form>
	</div>
</div>