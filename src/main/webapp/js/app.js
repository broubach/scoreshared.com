$(function(){
  $(document).foundation();
	// Abre o popup
	$('.ajax-popup-link').magnificPopup({
	  type: 'ajax',
	  focus: 'textarea',
	  removalDelay: 300,
	  mainClass: 'mfp-fade',
	  midClick: true
	});

	
})