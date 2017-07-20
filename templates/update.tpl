<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<form class="form-horizontal" role="form" action='' method="POST">
			<div id="legend">
				<legend>Обновить профиль</legend>
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
				<label for="name" class="col-md-3 control-label">Имя</label>
				<div class="col-md-9">
					<input type="twxt" name="name" id="name" class="form-control" value="<?php echo $user->data()->name; ?>">
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-9 col-md-offset-3">
					<input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
					<button class="btn btn-primary">Обновить</button>
				</div>
			</div>
		</form>
	</div>
</div>