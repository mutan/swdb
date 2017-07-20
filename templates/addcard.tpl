<div class="row">
	<div class="col-md-12">
		<div class="page-header">
			<h3>Добавить карту <small></small> </h3>
		</div>
	</div>
	<div class="col-md-12">
		<?php if (Session::exists('danger')) { ?><p class="bg-danger text-center"><?php echo Session::flash('danger'); ?></p><?php } ?>
		<?php if (Session::exists('success')) { ?><p class="bg-success text-center"><?php echo Session::flash('success'); ?></p><?php } ?>
	</div>		
</div>

<form method="post" action="" class="form-horizontal" role="form">

<div class="row">

	<div class="col-md-4">

		<label for="name" class="control-label small">Название</label>
		<input type="text" name="name" id="name" class="form-control input-sm">

		<label for="race" class="small">Раса</label>
		<select multiple name="race[]" id="race" class="form-control input-sm" size="3">
			<?php $card->showList("race"); ?>
		</select>

		<label for="type" class="small">Тип</label>
		<select multiple name="type[]" id="type" class="form-control input-sm">
			<?php $card->showList('type'); ?>
		</select>

		<label for="artist" class="small">Художник</label>
		<select multiple name="artist[]" id="artist" class="form-control input-sm">
			<?php $card->showList('artist'); ?>
		</select>

	</div>

	<div class="col-md-4">

		<label for="image" class="control-label small">Картинка</label>
		<input type="text" id="image" name="image" class="form-control input-sm">

		<div class="row">
			<div class="col-md-8">
				<label for="edition" class="small">Выпуск</label>
				<select name="edition" id="edition" class="form-control input-sm">
					<option></option>
					<?php $card->showList('edition'); ?>
				</select>
			</div>
			<div class="col-md-4">
				<label for="number" class="small">Номер</label>
				<input type="text" name="number" id="number" class="form-control input-sm">
			</div>
		</div>

		<label for="rarity" class="small">Редкость</label>
		<select name="rarity" id="rarity" class="form-control input-sm">
			<option></option>
			<?php $card->showList('rarity'); ?>
		</select>

		<div class="row">
			<div class="col-md-6">
				<label for="firepower" class="control-label small">Огневая мощь</label>
				<input type="text" name="firepower" id="firepower" class="form-control input-sm">
			</div>
			<div class="col-md-6">
				<label for="defence" class="control-label small">Защита</label>
				<input type="text" name="defence" id="defence" class="form-control input-sm">
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<label for="energy" class="control-label small">Энергия</label>
				<input type="text" name="energy" id="energy" class="form-control input-sm">
			</div>
			<div class="col-md-4">
				<label for="strategy" class="control-label small">Страт. поб.</label>
				<input type="text" name="strategy" id="strategy" class="form-control input-sm">
			</div>
			<div class="col-md-4">
				<label for="dopotsek" class="control-label small">Доп. отсек</label>
				<input type="text" name="dopotsek" id="dopotsek" class="form-control input-sm">
			</div>				
		</div>

		<label for="comment" class="control-label small">Комментарии</label>
		<textarea name="comment" id="comment" class="form-control input-sm" rows="3"></textarea>

	</div>

	<div class="col-md-4">

		<label for="features_line" class="control-label small">Строка особенностей</label>
		<br><small><strong><a id="{crown}" class="meta-tag">{crown}</a> <a id="{hand}" class="meta-tag">{hand}</a> <a id="{asteroid}" class="meta-tag">{asteroid}</a> <a id="После применения карта кладется в потери." class="meta-tag">{После...}</a> <a id="Карта выставляется на поле закрытой." class="meta-tag">{Карта...}</a></strong></small>
		<textarea name="features_line" id="features_line" class="form-control input-sm" rows="2"></textarea>

		<label for="command_line1" class="control-label small">Командная строка 1</label>
		<small><strong><a id="{inst}" class="meta-tag">{inst}</a> <a id="{tap}" class="meta-tag">{tap}</a></strong></small>
		<textarea name="command_line1" id="command_line1" class="form-control input-sm" rows="2"></textarea>

		<label for="command_line2" class="control-label small">Командная строка 2</label>
		<small><strong><a id="{inst}" class="meta-tag">{inst}</a> <a id="{tap}" class="meta-tag">{tap}</a></strong></small>
		<textarea name="command_line2" id="command_line2" class="form-control input-sm" rows="2"></textarea>

		<label for="flavor" class="control-label small">Художественный текст</label>
		<textarea name="flavor" id="flavor" class="form-control input-sm" rows="2"></textarea>

	</div>

</div>

<div class="row">

	<div class="col-md-4 col-md-offset-4 text-center">
		<br>
		<input type="submit" name="ok" class="btn btn-primary" value="Отправить"></input>
		<input type="reset" class="btn btn-primary" value="Очистить"></input>
	</div>

</div>

</form>