<!-- TinyMCE -->
<?php include_once './plugins/tinymce/swdb.config.php';?>

<div class="row">
	<div class="col-md-12">
		<div class="page-header">
			<h3><?php echo $card->data()->name; ?> <small><?php echo $card->data()->edition; ?> <a href="/card.php?card_id=<?php echo $card->data()->id; ?>">[Просмотр]</a> </small></h3>
		</div>
	</div>

	<div class="col-md-12">
		<p class="bg-danger text-center">
			<?php if (Session::exists('danger')) {echo Session::flash('danger');} ?>
		</p>
		<p class="bg-success text-center">
			<?php if (Session::exists('success')) {echo Session::flash('success');} ?>
		</p>
	</div>
</div>

<form role="form" action="" method="POST">

<div class="row">

	<div class="col-md-4">
		<img src="<?php echo $card->data()->image; ?>" class="img-responsive" alt="Responsive image">
	</div>

	<div class="col-md-8">

		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="name" class="control-label small">Название</label>
					<input name="name" id="name" class="form-control input-sm" type="text" value='<?php echo $card->data()->name; ?>' required>

					<div class="row">
						<div class="col-md-8">
							<label for="edition" class="control-label small">Выпуск</label>
							<select name="edition" id="edition" class="form-control input-sm" required>
								<option></option>
								<?php $card->showList('edition', $card->data()->edition); ?>
							</select>
						</div>
						<div class="col-md-4">
							<label for="number" class="control-label small">Номер</label>
							<input name="number" type="text" id="number" class="form-control input-sm" value='<?php echo $card->data()->number; ?>' required>
						</div>
					</div>

					<label for="rarity" class="control-label small">Редкость</label>
					<select name="rarity" id="rarity" class="form-control input-sm" required>
						<option></option>
						<?php $card->showList('rarity', $card->data()->rarity); ?>
					</select>

					<label for="race" class="control-label small">Раса</label>
					<select multiple name="race[]" id="race" class="form-control input-sm" required>
						<?php $card->showList('race', $card->data()->races); ?>
					</select>

					<label for="type" class="control-label small">Тип</label>
					<select multiple name="type[]" id="type" class="form-control input-sm" required>
						<?php $card->showList('type', $card->data()->types); ?>
					</select>

					<label for="artist" class="control-label small">Художник</label>
					<select multiple name="artist[]" id="artist" class="form-control input-sm" required>
						<?php $card->showList('artist', $card->data()->artists); ?>
					</select>

				</div>
			</div>

			<div class="col-md-6">
				<div class="form-group">

					<label for="image" class="control-label small">Картинка</label>
					<input id="image" name="image" class="form-control input-sm" type="text" value='<?php echo $card->data()->image; ?>'>

					<div class="row">
						<div class="col-md-6">
							<label for="firepower" class="control-label small">Огневая мощь</label>
							<input name="firepower" id="firepower" class="form-control input-sm" type="text" value='<?php echo $card->data()->firepower; ?>'>
						</div>
						<div class="col-md-6">
							<label for="defence" class="control-label small">Защита</label>
							<input name="defence" id="defence" class="form-control input-sm" type="text" value='<?php echo $card->data()->defence; ?>'>
						</div>			
					</div>

					<div class="row">
						<div class="col-md-4">
							<label for="energy" class="control-label small">Энергия</label>
							<input name="energy" id="energy" class="form-control input-sm" type="text" value='<?php echo $card->data()->energy; ?>'>
						</div>
						<div class="col-md-4">
							<label for="dopotsek" class="control-label small">Доп. отсек</label>
							<input name="dopotsek" id="dopotsek" class="form-control input-sm" type="text" value='<?php echo $card->data()->dopotsek; ?>'>
						</div>
						<div class="col-md-4">
							<label for="strategy" class="control-label small">Стр. поб.</label>
							<input name="strategy" id="strategy" class="form-control input-sm" type="text" value='<?php echo $card->data()->strategy; ?>'>
						</div>
					</div>

					<label for="features_line" class="control-label small">Строка особенностей</label>
					<br><small><strong><a id="{crown}" class="meta-tag">{crown}</a> <a id="{hand}" class="meta-tag">{hand}</a> <a id="{asteroid}" class="meta-tag">{asteroid}</a> <a id="После применения карта кладется в потери." class="meta-tag">{После...}</a> <a id="Карта выставляется на поле закрытой." class="meta-tag">{Карта...}</a></strong></small>
					<textarea name="features_line" id="features_line" class="form-control input-sm" rows="2"><?php echo $card->data()->features_line; ?></textarea>

					<label for="command_line1" class="control-label small">Командная строка 1</label>
					<small><strong><a id="{inst}" class="meta-tag">{inst}</a> <a id="{tap}" class="meta-tag">{tap}</a></strong></small>
					<textarea name="command_line1" id="command_line1" class="form-control input-sm" rows="2"><?php echo $card->data()->command_line1; ?></textarea>

					<label for="command_line2" class="control-label small">Командная строка 2</label>
					<small><strong><a id="{inst}" class="meta-tag">{inst}</a> <a id="{tap}" class="meta-tag">{tap}</a></strong></small>
					<textarea name="command_line2" id="command_line2" class="form-control input-sm" rows="2"><?php echo $card->data()->command_line2; ?></textarea>

					<label for="flavor" class="control-label small">Художественный текст</label>
					<textarea name="flavor" id="flavor" class="form-control input-sm" rows="2"><?php echo $card->data()->flavor; ?></textarea>

				</div>
			</div>

		</div>

		<label for="errata" class="control-label small">Эрраты</label>
		<textarea name="errata" id="errata" class="form-control input-sm tinymce" rows="5"><?php echo $card->data()->errata; ?></textarea>

		<label for="comment" class="control-label small">Комментарии</label>
		<textarea name="comment" id="comment" class="form-control input-sm tinymce" rows="10"><?php echo $card->data()->comment; ?></textarea>

	</div>

</div>

<div class="row">
	<div class="col-md-8 col-md-offset-4 text-center">
		<br>
		<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-ok green"></span> Сохранить изменения</button>
	</div>
</div>

</form>