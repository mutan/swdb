	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="page-header">
				<h2>Редактировать таблицу <small><?php echo $tableName;?></small></h2>
			</div>
		</div> <!-- /col -->
	</div> <!-- /row -->


	<?php if ($tableName == "race") { ?> <!-- if -->

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<table id="<?php echo $tableName ?>" class="table">
					<tr><th>ID</th><th>Название</th><th>Управление</th></tr>

					<?php foreach ($table->data() as $item) { ?>

						<tr>
						<td><?php echo $item->id; ?></td>
						<td><?php echo $item->name; ?></td>
						<td><button class="btn btn-default">Read</button> <button class="btn btn-success">Update</button> <button class="btn btn-danger">Delete</button></td>
						</tr>
					<?php } ?> <!-- /while -->

				</table>

				<div class="form-group text-center">
					<button class="btn btn-default"><span class="glyphicon glyphicon-plus green"></span> Добавить запись</button>
				</div>
				
			</div> <!-- /col -->
		</div> <!-- /row -->

	<?php } ?> <!-- /else -->


