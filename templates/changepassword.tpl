<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<form class="form-horizontal" role="form" action='' method="POST">
			<div id="legend">
				<legend>Сменить пароль</legend>
			</div>

			<div class="col-md-12">
				<?php if (isset($validation)) { ?>
					<p class="text-danger">
						<?php foreach ($validation->errors() as $error) { echo $error . "<br>"; } ?>
					</p>
				<?php } ?>
				<?php if (Session::exists('success')) { ?><p class="bg-success text-center"><?php echo Session::flash('success'); ?></p><?php } ?>
			</div>
			
			<div class="form-group">
				<label for="password_current" class="col-md-6 control-label">Текущий пароль</label>
				<div class="col-md-6">
					<input type="password" name="password_current" id="password_current" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="password_new" class="col-md-6 control-label">Новый пароль</label>
				<div class="col-md-6">
					<input type="password" name="password_new" id="password_new" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="password_new_again" class="col-md-6 control-label">Новый пароль еще раз</label>
				<div class="col-md-6">
					<input type="password" name="password_new_again" id="password_new_again" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-6 col-md-offset-6">
					<input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
					<button class="btn btn-primary">Обновить</button>
				</div>
			</div>
		</form>
	</div>
</div>











