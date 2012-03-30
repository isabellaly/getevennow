
$ ->
	
	if !$.cookie('equalpay_dol_disclaimer_agreed')
		
		$('#license_agreement').dialog {
				modal: true
				height: 400
				width: 700
				closeOnEscape: false
				buttons:
					Agree: ->
						$.cookie('equalpay_dol_disclaimer_agreed', 'true', {expires: 7, path: '/'})
						$(this).dialog('close')

					Cancel: ->
						window.location.replace('http://www.google.com')
					
			}
