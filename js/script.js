function clearForm(form) {

	var elements = form.elements; 

	form.reset();

	for(i=0; i<elements.length; i++) {

		field_type = elements[i].type.toLowerCase();

		//alert(field_type);

		switch(field_type) {
			case "text": 
			case "password": 
			case "textarea":
			case "hidden":
				elements[i].value = ""; 
				break;
			case "radio":
			case "checkbox":
				if (elements[i].checked) {
				elements[i].checked = false; 
				}
				break;
			case "select-one":
			case "select-multiple":
				elements[i].selectedIndex = -1;
				break;
			default: 
				break;
		}
	}
}


$(document).ready(function() {



$('#example').dataTable();

// Редактирование таблиц БД: Тип, Раса, Художник, Выпуск, Редкость и Пиктограммы
// edittable.php
$(".edit_tr").click(function() {
	var ID = $(this).attr('id');
	$("#name_"+ID).hide();
	$("#number_"+ID).hide();
	$("#quantity_"+ID).hide();
	$("#date_"+ID).hide();
	$("#path_"+ID).hide();
	$("#name_input_"+ID).show();
	$("#number_input_"+ID).show();
	$("#quantity_input_"+ID).show();
	$("#date_input_"+ID).show();
	$("#path_input_"+ID).show();
	}).change(function() {
		var tableName = $("table").attr('id');
		var ID = $(this).attr('id');
		var number = $("#number_input_"+ID).val();
		var name = $("#name_input_"+ID).val();
		var quantity = $("#quantity_input_"+ID).val();
		var date = $("#date_input_"+ID).val();
		var path = $("#path_input_"+ID).val();
		var dataString = 'action=ajaxUpdate'+'&tableName='+tableName+'&id='+ID+'&number='+number+'&name='+name+'&quantity='+quantity+'&date='+date+'&path='+path;
		if(name.length>0) {
			$.ajax({
			type: "POST",
			url: "edittable.php",
			dataType: "html",
			data: dataString,
			cache: false,
			success: function() {
				$("#name_"+ID).html(name);
				$("#number_"+ID).html(number);
				$("#quantity_"+ID).html(quantity);
				$("#date_"+ID).html(date);
				$("#path_"+ID).html(path);
				$("#img_"+ID).each( function() {this.src = path;} );
			},
			error: function(xhr, status, error) {
				alert(xhr.responseText);
				var err = eval("(" + xhr.responseText + ")");
				alert(err.Message);
			}
			});
		} else {
			alert('Пустым поле оставлять нельзя!');
		}
});

$(".editbox").mouseup(function() {
	return false;
});

$(document).mouseup(function() {
	$(".editbox").hide();
	$(".text").show();
});


// Добавление мета-кодов по клику
// addcard.php
$("a.meta-tag").click(function() {
	var tag = $(this).attr('id');
	var val = $(this).parent().parent().next("textarea").val();
	$(this).parent().parent().next("textarea").val(tag+val);
})

//allcardslist
$(".remove_card").click(function() {
	var ID = $(this).attr('id');
	if (confirm('Удалить карту с ID = ' + ID + '?')) {
		var dataString = 'action=delete' + '&id='+ID;
		$.ajax({
			type: "POST",
			url: "allcardslist.php",
			dataType: "html",
			data: dataString,
			cache: false,
			success: function() {
				$("#"+ID).hide();
				alert('Карта удалена');
			},
			error: function(xhr, status, error) {
				alert(xhr.responseText);
				var err = eval("(" + xhr.responseText + ")");
				alert(err.Message);
			}
		});
	}
});


// index.php
$('#extSearch').hide();

$('#extSearchHeader').click(function(){
	$('#extSearch').slideToggle(250);
});

$(function(){
	$('form').submit(function(){
		$('select').each(function(){
			if($(this).val()==''){
				$(this).attr('disabled','disabled');
			}
		});
		$('input').each(function(){
			if($(this).val()==''){
				$(this).attr('disabled','disabled');
			}
		});
	});
});














});