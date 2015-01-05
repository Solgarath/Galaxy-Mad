$(document).ready(function(){

	$('#NavBtn').click(function(){
		$('#menu').toggleClass('invisible');
	});

	$("#btnValideMusician").click(function(){
		$("#checkMusician").collapsible('collapse');
	});

	$("#btnValideVolunteer").click(function(){
		$("#checkVolunteer").collapsible('collapse');
	});

	$("#btnValideMerchant").click(function(){
		$("#checkMerchant").collapsible('collapse');
	});
});