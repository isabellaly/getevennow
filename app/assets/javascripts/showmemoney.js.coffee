currentQuestionIndex = 0
@testBarChart
@testAreaChart
@validationmessages = []



$ ->
	

	$('#occupation, #location, #gender, #paycheck').hide('fast')
	clearErrorMessage()
	

	initCurrentMenuItem('#occup_link')		
	$('#occupation').show('fast')

	$('#occup_link').click ->
		initCurrentMenuItem('#occup_link')		
		$('#occupation').show('fast')
	
	$('#loc_link').click ->
		initCurrentMenuItem('#loc_link')
		$('#location').show()

	$('#gend_link').click ->
		initCurrentMenuItem('#gend_link')
		$('#gender').show('fast')

	
	$('#paychk_link').click ->
		initCurrentMenuItem('#paychk_link')
		$('#paycheck').show()

		
	$('#nextlink1').click ->
		initCurrentMenuItem('#loc_link')		
		$('#location').show('fast')
		

	$('#nextlink2').click ->
		initCurrentMenuItem('#gend_link')		
		$('#gender').show('fast')

	$('#nextlink3').click ->
		initCurrentMenuItem('#paychk_link')
		$('#paycheck').show('fast')

	$('#occup_link,#loc_link,#gend_link,#paychk_link').mouseleave ->
		return false

	$('#salarycomjob_jobtitle').autocomplete
		source: '/SalaryComJobs'
		select: (event, ui) ->
			this.value = ui.item.label
			$('#jobcode').val(ui.item.value)
			return false
	$('#zip_code').autocomplete
		source: '/Zips'
		select: (event, ui) ->
			$('#zip_code').val(ui.item.value)
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
	$('#methodology_link').click ->
		$('#methodology_dialog').dialog {
			modal: true
			height: 300
			width: 400
			buttons:
				Ok: ->
					$(this).dialog("close")
		}

	$('#showmemoney').click ->
		if isFormValid()
		  $('#userform > div').hide()
		  $('#chartscontainer').show()
		  $('#chartscontainer2').show()
		  
		else
		  displayErrorMessage()
		  $('#chartscontainer').hide('fast')
		  $('#chartscontainer2').hide('fast')
		  return false
				


	testBarChart =  new Highcharts.Chart {
	         chart: 
	            renderTo: 'chartscontainer',
	            type: 'bar'

	         title: 
	            text: 'Wage Gap Estimate'

	         subtitle:
	            text: 'Source Salary.com, Bureau of Labor Statistics'

	         xAxis:
	            categories: ['Wages']

	         yAxis:
	            title: 
	               text: 'Median Annual Salary' 
	            labels:
	               formatter: ->
	                     return "$" + Highcharts.numberFormat(this.value, 0) 
	         plotOptions:
	            bar:
	               dataLabels:
	                   enabled: true
	                   formatter: ->
	                     return "$" + Highcharts.numberFormat(this.y, 2)
	         tooltip:
	            formatter: ->
	               return "$" + Highcharts.numberFormat(this.y, 2)

	         series:[{name: 'Men', data:[$('#mydatadiv').data('chartdata').Men] },
	             {name:'Women', data:[$('#mydatadiv').data('chartdata').Women]}]
		    }


	testAreaChart =  new Highcharts.Chart {
	         chart: 
	            renderTo: 'chartscontainer2',
	            type: 'areaspline'

	         title: 
	            text: 'Effect of Initial Gap on Annual Wage Over 30 Years'

	         subtitle:
	            text: 'Source Salary.com, Bureau of Labor Statistics'

	         xAxis:
	            categories: [0,5, 10, 15, 20, 25, 30]
	            title:
	               text: 'Years from now'

	         yAxis:
	            title: 
	               text: 'Median Annual Salary' 
	            labels:
	               formatter: ->
	                     return "$" +  Highcharts.numberFormat(this.value, 0)    
	         plotOptions:
	            areaspline:
	               fillOpacity: 0.5
	         tooltip:
	            formatter: ->
	               return "$" + Highcharts.numberFormat(this.y, 2)

	         series:[{name: 'Men', data:$('#mydatadiv').data('wagegaptrend').Men },
	             {name:'Women', data:$('#mydatadiv').data('wagegaptrend').Women}]

		    }











initCurrentMenuItem= (currentLink) -> 
	$('#occupation, #location, #gender, #paycheck').hide('fast')
	$('#verticalnavbar > ul > li').removeClass('currentMenuItem')
	$(currentLink).parent().addClass('currentMenuItem')

isFormValid = () ->
	valid = true
	clearErrorMessage()
	
	if !$('#jobcode').val()
		@validationmessages.push('Please enter a valid occupation')
		valid = false
	
	if $('#zip_code').val() and !(/^\d{5}$/.test($('#zip_code').val()))
		@validationmessages.push('Please enter a valid zip code. For e.g. 15222')
		valid = false
	return valid



	 

displayErrorMessage = () ->
	for msg in @validationmessages
        $('#errormsgpanel').append(msg + '<br/>')
	$('#errormsgpanel').show('fast')

clearErrorMessage = () ->
	@validationmessages = []
	$('#errormsgpanel').html('')
	$('#errormsgpanel').hide('fast')






