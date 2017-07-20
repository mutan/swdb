<form id="form" method="get" role="form" action="index.php">
<div class="row">
	<div class="col-md-12 bg-border">

		<div class="row">
			<div class="col-md-12 text-center">
				<h4 id="extSearchHeader">Расширенный поиск<small></small></h4>
			</div>
		</div>

		<div id="extSearch" class="row">
			<div class="col-md-12">

				<div class="row">

					<div class="col-md-3">
						<strong><small>Раса</small></strong>
						<div class="checkbox">
							<label><input type="checkbox" name="race[]" id="race1" value="1" <?php if (in_array('1', Input::get('race'))) { echo 'checked'; } ?>> Земная империя</label>
						</div>
						<div class="checkbox">
							<label><input type="checkbox" name="race[]" id="race2" value="2" <?php if (in_array('2', Input::get('race'))) { echo 'checked'; } ?>> Сообщество Дварг</label>
						</div>
						<div class="checkbox">
							<label><input type="checkbox" name="race[]" id="race3" value="3" <?php if (in_array('3', Input::get('race'))) { echo 'checked'; } ?>> Таргонская федерация</label>
						</div>
<!-- 						<div class="checkbox disable">
	<label><span class="disable text-muted"><input disabled type="checkbox" name="race[]" id="race3" value="3"> Таргонская федерация</span></label>
</div> -->

						<strong><small>Cпецсимволы</small></strong><br>
						<div class="checkbox-inline">
							<label><input type="checkbox" name="crown" id="crown" value="1" <?php if (Input::get('crown')) { echo 'checked'; } ?>> <img src="/images/icon-crown.png" class="pointer"></label>
						</div>
						<div class="checkbox-inline">
							<label><input type="checkbox" name="hand" id="hand" value="1" <?php if (Input::get('hand')) { echo 'checked'; } ?>> <img src="/images/icon-hand.png" class="pointer"></label>
						</div>
						<div class="checkbox-inline">
							<label><input type="checkbox" name="asteroid" id="asteroid" value="1" <?php if (Input::get('asteroid')) { echo 'checked'; } ?>> <img src="/images/icon-asteroid.png" class="pointer"></label>
						</div>
						<div class="checkbox-inline">
							<label><input type="checkbox" name="strategy" id="strategy" value="1" <?php if (Input::get('strategy')) { echo 'checked'; } ?>> <img src="/images/icon-strategy.png" alt="Стратегическая победа" class="pointer"></label>
						</div>
					</div>

					<div class="col-md-2">
						<strong><small>Редкость</small></strong>
						<div class="checkbox">
							<label><input type="checkbox" name="rarity[]" id="rarity2" value="2" <?php if (in_array('2', Input::get('rarity'))) { echo 'checked'; } ?>> Частая</label>
						</div>
						<div class="checkbox">
							<label><input type="checkbox" name="rarity[]" id="rarity3" value="3" <?php if (in_array('3', Input::get('rarity'))) { echo 'checked'; } ?>> Редкая</label>
						</div>
						<div class="checkbox">
							<label><input type="checkbox" name="rarity[]" id="rarity4" value="4" <?php if (in_array('4', Input::get('rarity'))) { echo 'checked'; } ?>> Ультраредкая</label>
						</div>
						<div class="checkbox">
							<label><input type="checkbox" name="rarity[]" id="rarity1" value="1" <?php if (in_array('1', Input::get('rarity'))) { echo 'checked'; } ?>> Базовая</label>
						</div>
						<div class="checkbox">
							<label><input type="checkbox" name="rarity[]" id="rarity5" value="5" <?php if (in_array('5', Input::get('rarity'))) { echo 'checked'; } ?>> Промо</label>
						</div>
					</div>

					<div class="col-md-3">
						<label for="type" class="control-label small">Тип <small>(можно выбрать несколько с Ctrl)</small></label>
						<select multiple name="type[]" id="type" class="form-control input-sm" size="7">
							<?php $card->showList('type', Input::get('type')); ?>
							<option></option>
						</select>
					</div>

					<div class="col-md-4">
						<div class="row">
							<div class="col-md-6">
								<label for="edition" class="control-label small">Выпуск</label>
								<select name="edition" id="edition" class="form-control input-sm">
									<option></option>
									<?php $card->showList('edition', Input::get('edition')); ?>
								</select>
								<label for="artist" class="control-label small">Художник</label>
								<select name="artist" id="artist" class="form-control input-sm">
									<option></option>
									<?php $card->showList('artist', Input::get('artist')); ?>
								</select>
							</div>
							<div class="col-md-6">
								<label for="features_line" class="control-label small">Строка особенностей</label>
								<input type="text" name="features_line" id="features_line" class="form-control input-sm" <?php if (Input::exists('get')) { echo 'value=' . Input::get('features_line');}?>>

								<label for="command_line" class="control-label small">Командная строка</label>
								<input type="text" name="command_line" id="command_line" class="form-control input-sm" <?php if (Input::exists('get')) { echo 'value=' . Input::get('command_line');}?>>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="checkbox">
									<label><input type="checkbox" name="dopotsek" id="dopotsek" value="1" <?php if (Input::get('dopotsek')) { echo 'checked'; } ?>> Доп. отсек</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="checkbox disable">
									<label><span class="disable text-muted"><input disabled type="checkbox" name="energy" id="energy" value="1" <?php if (Input::get('energy')) { echo 'checked'; } ?>> Энергия</span></label>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> Искать</button>
						<button class="btn btn-default" type="button" onclick="clearForm(this.form);"><span class="glyphicon glyphicon-refresh"></span> Очистить</button>
					</div>
				</div>

			</div>
		</div>

	</div>
</div>
</form>

<div class="row top-buffer">
	<div class="col-md-12">
		<?php if (Session::exists('danger')) { ?><p class="bg-danger text-center"><?php echo Session::flash('danger'); ?></p><?php } ?>
		<?php if (Session::exists('success')) { ?><p class="bg-success text-center"><?php echo Session::flash('success'); ?></p><?php } ?>
	</div>
</div>

<div class="row">
	<?php foreach ($card->data() as $item) { 
		$image = getimagesize(substr($item->image, 1));
		if ($image[0] > $image[1]) {
			$item->image = 'images/' . substr($item->image, 8, 6) . '-rotated.jpg';
		} ?>
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="form-group">
				<a href="card.php?card_id=<?php echo $item->id; ?>" target="_blank">
					<img src="<?php echo $item->image; ?>" class="img-responsive" alt="<?php echo $item->name; ?>">
				</a>
			</div>
		</div>
	<?php } ?>
</div>