currentQuestionIndex = 0
questionList = ["occupation", "gender", "location", "paycheck"]
@testBarChart
@testAreaChart
 


$ ->
	
		
	
		
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
	$( "#dialog:ui-dialog" ).dialog( "destroy" )
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



