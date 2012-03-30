$ ->
	$('#video1Link').click ->
		$('#video2, #video3, #video4').hide('slow')
		$('#video1').show('slow')
	$('#video2Link').click ->
		$('#video1, #video3, #video4').hide('slow')
		$('#video2').show('slow')
	$('#video3Link').click ->
		$('#video1, #video2, #video4').hide('slow')
		$('#video3').show('slow')
	$('#video4Link').click ->
		$('#video1, #video2, #video3').hide('slow')
		$('#video4').show('slow')