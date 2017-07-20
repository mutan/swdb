	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="page-header">
				<h2>Редактировать таблицу <small><?php echo $tableName;?></small></h2>
			</div>
		</div> <!-- /col -->
	</div> <!-- /row -->


	<?php if ($tableName == "edition") { ?> <!-- if -->

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<table id="<?php echo $tableName ?>" class="table">
					<tr><th class="text-muted">ID</th><th>Номер</th><th>Название</th><th>Количество карт</th><th>Дата выхода</th></tr>

					<?php foreach ($table->data() as $item) { ?>
						<tr id="<?php echo $item->id; ?>" class="edit_tr">
						<td class="text-muted"><?php echo $item->id; ?></td>
						<td class="edit_td"><span id="number_<?php echo $item->id; ?>" class="text"><?php echo $item->number; ?></span><input type="text" value="<?php echo $item->number; ?>" class="form-control editbox" id="number_input_<?php echo $item->id; ?>"></td>
						<td class="edit_td"><span id="name_<?php echo $item->id; ?>" class="text"><?php echo $item->name; ?></span><input type="text" value="<?php echo $item->name; ?>" class="form-control editbox" id="name_input_<?php echo $item->id; ?>"></td>
						<td class="edit_td"><span id="quantity_<?php echo $item->id; ?>" class="text"><?php echo $item->quantity; ?></span><input type="text" value="<?php echo $item->quantity; ?>" class="form-control editbox" id="quantity_input_<?php echo $item->id; ?>"></td>
						<td class="edit_td"><span id="date_<?php echo $item->id; ?>" class="text"><?php echo $item->date; ?></span><input type="text" value="<?php echo $item->date; ?>" class="form-control editbox" id="date_input_<?php echo $item->id; ?>"></td>
					</tr>
					<?php } ?> <!-- /while -->

				</table>
			</div> <!-- /col -->
		</div> <!-- /row -->

	<?php } else if ($tableName == "pictograms") { ?> <!-- /if --> <!-- else -->

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<table id="<?php echo $tableName ?>" class="table">
					<tr><th class="text-muted">ID</th><th>Мета-код</th><th>Путь к изображению</th><th class="text-muted">Изображение</th></tr>

					<?php foreach ($table->data() as $item) { ?>
						<tr id="<?php echo $item->id; ?>" class="edit_tr">
						<td class="text-muted"><?php echo $item->id; ?></td>
						<td class="edit_td"><span id="name_<?php echo $item->id; ?>" class="text"><?php echo $item->name; ?></span><input type="text" value="<?php echo $item->name; ?>" class="form-control editbox" id="name_input_<?php echo $item->id; ?>"></td>
						<td class="edit_td"><span id="path_<?php echo $item->id; ?>" class="text"><?php echo $item->path; ?></span><input type="text" value="<?php echo $item->path; ?>" class="form-control editbox" id="path_input_<?php echo $item->id; ?>"></td>
						<td><img src="<?php echo $item->path; ?>" id="img_<?php echo $item->id; ?>" class="img-responsive" alt="Responsive image"></td>
						</tr>
					<?php } ?> <!-- /while -->

				</table>
			</div> <!-- /col -->
		</div> <!-- /row -->

	<?php } else { ?> <!-- /if --> <!-- else -->

		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<table id="<?php echo $tableName ?>" class="table">
					<tr><th class="text-muted">ID</th><th>Название</th></tr>

					<?php foreach ($table->data() as $item) { ?>

						<tr id="<?php echo $item->id; ?>" class="edit_tr">
						<td class="text-muted"><?php echo $item->id; ?></td>
						<td class="edit_td"><span id="name_<?php echo $item->id; ?>" class="text"><?php echo $item->name; ?></span><input type="text" value="<?php echo $item->name; ?>" class="form-control editbox" id="name_input_<?php echo $item->id; ?>"></td>
						</tr>
					<?php } ?> <!-- /while -->

				</table>
			</div> <!-- /col -->
		</div> <!-- /row -->

	<?php } ?> <!-- /else -->

	<form class="form-inline text-center" role="form" action="<?php echo $_SERVER['PHP_SELF'].'?tableName='.$tableName.'&action=add'; ?>" method="POST">
		<div class="form-group">
			<input id="name" name="name" class="form-control" placeholder="Название" type="text" required>&nbsp;
			<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-plus green"></span> Добавить запись</button>
		</div>
		<br><br>
	</form>

	<form class="form-inline text-center" role="form" action="<?php echo $_SERVER['PHP_SELF'].'?tableName='.$tableName.'&action=del'; ?>" method="POST">
		<div class="form-group">
			<input id="id" name="id" class="form-control" placeholder="ID записи" type="text" required>&nbsp;
			<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-remove red"></span> Удалить запись</button>
		</div>
		<br><br>
	</form>