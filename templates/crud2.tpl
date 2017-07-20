<div class="row">
	<div class="col-md-4 col-md-offset-4">

		<div class="row">
			<h3>Редактировать таблицу <small><?php echo $tableName;?></small></h3>
		</div>

		<div class="row">
			<p><a href="<?php echo $_SERVER['PHP_SELF'].'?tableName='.$tableName.'&action=add'; ?>" class="btn btn-success btn-sm">Создать</a></p>

			<table class="table table-bordered table-condensed">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Управление</th>
	
					</tr>
				</thead>
				<tbody>

					<?php foreach ($table->data() as $item) { ?>
						<tr>
							<td class="col-md-1"><?php echo $item->id; ?></td>
							<td class="col-md-9"><?php echo $item->name; ?></td>

							<td class="col-md-2">
								<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-remove red"></span></button>
								<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-pencil green"></span></button>



							</td>
						</tr>
					<?php } ?>


				</tbody>
			</table>
		</div>






	</div> <!-- /col -->
</div> <!-- /row -->