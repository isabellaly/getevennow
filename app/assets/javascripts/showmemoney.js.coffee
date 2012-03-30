currentQuestionIndex = 0
questionList = ["occupation", "gender", "location", "paycheck"]
@testBarChart
@testAreaChart
 


$ ->
	$('#OccupationList').change (e) -> alert e.currentTarget
		
	$('#occupation, #location, #gender, #paycheck').hide('fast')
	$('#occup_link').click ->
		initCurrentMenuItem('#occup_link')		
		$('#occupation').show('fast')
	$('#occup_link').mouseenter ->
		initCurrentMenuItem('#occup_link')
		$('#occupation').show()
	
	$('#loc_link').click ->
		initCurrentMenuItem('#loc_link')
		$('#location').show()
	
	$('#loc_link').mouseenter ->
		initCurrentMenuItem('#loc_link')
		$('#location').show('fast')
	$('#gend_link').click ->
		initCurrentMenuItem('#gend_link')
		$('#gender').show('fast')

	$('#gend_link').mouseenter ->
		initCurrentMenuItem('#gend_link')
		$('#gender').show('fast')


		
	$('#paychk_link').click ->
		initCurrentMenuItem('#paychk_link')
		$('#paycheck').show()

	$('#paychk_link').mouseenter ->
		initCurrentMenuItem('#paychk_link')
		$('#paycheck').show()
	$('#nextlink1').click ->
		$('#loc_link').trigger('click')
	$('#nextlink2').click ->
		$('#gend_link').trigger('click')
	$('#nextlink3').click ->
		$('#paychk_link').trigger('click')
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
		$('#userform > div').hide()
		$('#chartscontainer').show()
		$('#chartscontainer2').show()
		$('#chartscontainer2').show()	
		
	
	testBarChart =  new Highcharts.Chart {
	         chart: 
	            renderTo: 'chartscontainer',
	            type: 'bar'
	         
	         title: 
	            text: 'Wage Gap'
	
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
	            text: 'Wage Gap Trend'

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



