<script type="text/javascript" src="../plugins/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
	tinymce.init({
		selector: "textarea.tinymce",
		menubar : false,
		plugins : 'advlist autolink link code image lists charmap print preview',
		toolbar1: "undo redo | bold italic underline strikethrough subscript superscript | alignleft aligncenter alignright alignjustify | bullist numlist | asteroid crown hand infinity inst promo strategy tap ultra | erratadate | code removeformat",
		setup : function(ed) {
				// Add a custom button
				ed.addButton('asteroid', {
						title : 'Asteroid icon',
						image : '/images/icon-asteroid.png',
						onclick : function() {
								ed.focus();
								ed.selection.setContent('<img src="/images/icon-asteroid.png">');
						}
				});

				ed.addButton('crown', {
						title : 'Crown icon',
						image : '/images/icon-crown.png',
						onclick : function() {
								// Add you own code to execute something on click
								ed.focus();
								ed.selection.setContent('<img src="/images/icon-crown.png">');
						}
				});

				ed.addButton('hand', {
						title : 'Hand icon',
						image : '/images/icon-hand.png',
						onclick : function() {
								ed.focus();
								ed.selection.setContent('<img src="/images/icon-hand.png">');
						}
				});

				ed.addButton('infinity', {
						title : 'Inst icon',
						image : '/images/icon-infinity.png',
						onclick : function() {
								ed.focus();
								ed.selection.setContent('<img src="/images/icon-infinity.png">');
						}
				});

				ed.addButton('inst', {
						title : 'Inst icon',
						image : '/images/icon-inst.png',
						onclick : function() {
								ed.focus();
								ed.selection.setContent('<img src="/images/icon-inst.png">');
						}
				});

				ed.addButton('promo', {
						title : 'Tap icon',
						image : '/images/icon-promo.png',
						onclick : function() {
								ed.focus();
								ed.selection.setContent('<img src="/images/icon-promo.png">');
						}
				});

				ed.addButton('strategy', {
						title : 'Tap icon',
						image : '/images/icon-strategy.png',
						onclick : function() {
								ed.focus();
								ed.selection.setContent('<img src="/images/icon-strategy.png">');
						}
				});

				ed.addButton('tap', {
						title : 'Tap icon',
						image : '/images/icon-tap.png',
						onclick : function() {
								ed.focus();
								ed.selection.setContent('<img src="/images/icon-tap.png">');
						}
				});

				ed.addButton('ultra', {
						title : 'Tap icon',
						image : '/images/icon-ultra.png',
						onclick : function() {
								ed.focus();
								ed.selection.setContent('<img src="/images/icon-ultra.png">');
						}
				});

				ed.addButton('erratadate', {
						title : 'Errata Date',
						text : '[Дата]',
						onclick : function() {
								ed.focus();
								ed.selection.setContent("[<?php echo date("d.m.y"); ?>]");
						}
				});

		},
	});
</script>