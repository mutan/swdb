<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="page-header">
			<h3>Создание прокси-карт <br><small>(формат А4, количество 3x3 на листе)</small></h3>
		</div>
	</div>

	<div class="col-md-6 col-md-offset-3">
		<?php if (isset($errors)) { ?>
			<p class="text-danger">
				<?php foreach ($errors as $error) { echo $error . "<br>"; } ?>
			</p>
		<?php } ?>
		<?php if (Session::exists('danger')) { ?><p class="bg-danger text-center"><?php echo Session::flash('danger'); ?></p><?php } ?>
		<?php if (Session::exists('success')) { ?><p class="bg-success text-center"><?php echo Session::flash('success'); ?></p><?php } ?>
	</div>
	
	<div class="col-md-6 col-md-offset-3">
		<p class="text-justify">Введите количество и название карт, которые Вы хотите напечатать:<br>"Количество _ пробел _ точное название".</p>
		<p>Пример:</p>
		<p>4 Корвет дальней связи "Альбатрос"<br>4 Ударный истребитель "Кобольд"</p>
	</div>
</div>

<form role="form" action="" method="POST">
	<div class="col-md-4 col-md-offset-4 text-center">
		<label for="proxy" class="control-label small"></label>
		<textarea name="proxy" id="proxy" class="form-control input-sm" rows="10"><?php if(Input::get('proxy')) { echo Input::get('proxy'); } ?></textarea>
		<br>
		<label class="radio-inline">
			<input type="radio" name="radioOptions" id="radio1" value="fileOpen" checked> Открыть файл в браузере
		</label>
		<label class="radio-inline">
			<input type="radio" name="radioOptions" id="radio2" value="fileDownload"> Скачать файл
		</label>
		<br><br>
		<input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
		<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-ok green"></span> Создать PDF файл с прокси</button>
	</div>
</form>