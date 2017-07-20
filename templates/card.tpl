<div class="row">

	<div class="col-md-12">
		<?php if (Session::exists('danger')) { ?><p class="bg-danger text-center"><?php echo Session::flash('danger'); ?></p><?php } ?>
		<?php if (Session::exists('success')) { ?><p class="bg-success text-center"><?php echo Session::flash('success'); ?></p><?php } ?>
	</div>
</div>

<div class="row">

	<div class="col-md-12">

		<?php //echo var_dump($card->data()); ?>

		<h3><?php echo $card->data()->name; ?> <small><?php if ($edit) { ?> <a href="<?php echo $edit; ?>">[Редактировать]</a> <?php } ?></small></h3>
	
		<p><a href="edition.php?edition_id=<?php echo $card->data()->edition_id; ?>" ><?php echo $card->data()->edition; ?></a> (<?php echo $card->data()->quantity; ?> карт, <?php echo $card->data()->date; ?>)</p>

		<div class="row">

			<?php
				$image = getimagesize(substr($card->data()->image, 1));

				if ($image[0] > $image[1]) {
					$imgColSize = 5;
					$textColSize = 7;
				} else {
					$imgColSize = 4;
					$textColSize = 8;
				}
			?>

			<div class="col-md-<?php echo $imgColSize?> col-sm-<?php echo $imgColSize?> col-xs-12">
				<img src="<?php echo $card->data()->image; ?>" class="img-responsive" alt="Responsive image">
			</div>

			<div class="col-md-<?php echo $textColSize?> col-sm-<?php echo $textColSize?> col-xs-12">

				<?php if ($card->data()->errata) { ?>
					<h4>Эрраты</h4>
					<div class="bg-info"><?php echo $card->data()->errata; ?></div>
				<?php } ?>

				<?php if ($card->data()->comment) { ?>
					<h4>Часто задаваемые вопросы:</h4>
					<p class="bg-info"><?php echo $card->data()->comment; ?></p>
				<?php } ?>

			</div>

		</div>

	</div>

</div>