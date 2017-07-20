<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<form class="form-horizontal" role="form" action='' method="POST">
			<div id="legend">
				<legend>Авторизация</legend>
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
				<label for="username" class="col-md-3 control-label">Логин</label>
				<div class="col-md-9">
					<input type="text" name="username" id="username" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-md-3 control-label">Пароль</label>
				<div class="col-md-9">
					<input type="password" name="password" id="password" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<div class="checkbox">
						<label for"remember">
							<input type="checkbox" name="remember" id="remember">Запомнить меня</input>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-9 col-md-offset-3">
					<input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
					<button class="btn btn-primary">Войти</button>
				</div>
			</div>
		</form>
	</div>
</div>