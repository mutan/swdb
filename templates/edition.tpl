<div class="row">
	<div class="col-md-12">
		<div class="page-header">
			<h3>Все карты выпуска "<?php echo $card->data()[0]->edition; ?>" <small><?php echo $card->data()[0]->quantity; ?> карт, <?php echo $card->data()[0]->date; ?></small></h3>
		</div>
	</div>

	<div class="col-md-12">
		<?php if (Session::exists('danger')) { ?><p class="bg-danger text-center"><?php echo Session::flash('danger'); ?></p><?php } ?>
		<?php if (Session::exists('success')) { ?><p class="bg-success text-center"><?php echo Session::flash('success'); ?></p><?php } ?>
	</div>

</div>


<div class="row">
	<div class="col-md-12">
		<table class="table">
			<tr><th>№</th><th>Название</th><th>Тип</th><th>Раса</th><th>Редкость</th><th>Художник</th></tr>

			<?php foreach ($card->data() as $item) { ?>
			<tr id="<?php echo $item->id; ?>">
				<td><?php echo $item->number; ?></td>
				<td><a href="card.php?card_id=<?php echo $item->id; ?>"><?php echo $item->name; ?></a></td>
				<td>
					<?php
					echo $item->types;
					if ($item->firepower || $item->defence) {
						echo " " . $item->firepower . "/" . $item->defence;
					}
					if ($item->strategy) { 
						for ($i = 0; $i < $item->strategy; $i++) { ?>
							<img src="/images/icon-star.png">
						<?php } ?>
					<?php } ?>
					
				</td>
				<td><?php echo $item->races; ?></td>
				<td><?php echo $item->rarity; ?></td>
				<td><?php echo $item->artists; ?></td>
			</tr>
			<?php } ?>

		</table>
	</div>
</div>