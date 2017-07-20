<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="page-header">
			<h3>Все карты <small>в алфавитном порядке</small></h3>
		</div>
	</div>

	<div class="col-md-8 col-md-offset-2">
		<?php if (Session::exists('danger')) { ?><p class="bg-danger text-center"><?php echo Session::flash('danger'); ?></p><?php } ?>
		<?php if (Session::exists('success')) { ?><p class="bg-success text-center"><?php echo Session::flash('success'); ?></p><?php } ?>
	</div>

	<div class="col-md-8 col-md-offset-2">
		<p>Карты можно отсортировать по названию и номеру. Для редактирования карты нажмите на ее название.</p>
	</div>
</div>

<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<table class="table">
			<tr><th class="text-muted">ID</th><th><a href='?sort=name'>Название<b class="caret"></b></a></th><th>Выпуск</th><th><a href='?sort=number'>Номер<b class="caret"></b></a></th><th></th></tr>

			<?php foreach ($card->data() as $item) { ?>
			<tr id="<?php echo $item->id; ?>">
				<td class="text-muted"><?php echo $item->id; ?></td>
				<td><a href="editcard.php?card_id=<?php echo $item->id; ?>"><?php echo $item->name; ?></a></td>
				<td><?php echo $item->edition; ?></td>
				<td><?php echo $item->number; ?></td>
				<td><span id="<?php echo $item->id; ?>" class="glyphicon glyphicon-remove red remove_card pointer"></span></td>
			</tr>
			<?php } ?>

		</table>
	</div>
</div>