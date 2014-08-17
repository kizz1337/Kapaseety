 var gaugeOptions = {
	chart: { type: 'solidgauge', backgroundColor:'#7cb5ec',borderRadius:5,borderwidth:0,shadow: true},
	title: null,
	pane: { center: ['50%', '85%'],size: '140%',startAngle: -90,endAngle: 90, background: {backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',innerRadius: '60%',outerRadius: '100%',shape: 'arc'}},
	yAxis: {stops: [[0.1, '#55BF3B'], [0.5, '#DDDF0D'],[0.9, '#DF5353']],lineWidth: 0, minorTickInterval: null, tickPixelInterval: 400, tickWidth: 0, title: { y: -70},labels: {y: 16}},
	plotOptions: {solidgauge: {dataLabels: { y: 5, borderWidth: 0,  useHTML: true }}}
	};


function init() {
	
	$(".tablesorter").tablesorter({theme: 'bootstrap',headerTemplate: '{content}{icon}',widgets : [ "uitheme"]});
	
	 $('#vms_total .label, #hosts_total .label').hover(function() {
		$(this).css('cursor','pointer');
	});

	$('#topmenu .item').unbind();
	$('#topmenu .item').click(function(){
		type = $(this).attr('data-href');
		url = '/?m='+type+'&moref='+$(this).attr('data-moref');
		//~ update_url(url);
		$('#page-wrapper').load(url,function(){
			if (type=='cluster') {
				loadchart_cluster();}
			if (type=='host') {
				loadchart_host();}
			if (type=='vm') {
				loadchart_vm();}
			if (type=='datastore') {
				loadchart_datastore();}
			//~ if (type=='datacenter') {
				//~ loadchart_datacenter();}
			if (type=='dashboard') {
				loadchart_dashboard();}				
			init();
		});	
	})
	
	
	
	$('.dashboard a').unbind();
	$('.dashboard a').click(function(){
		url = '/?m=cluster&moref='+$(this).attr('data-moref');
		$click = $('.sidebar [data-moref='+$(this).attr('data-moref')+']');
		$('.sidebar .active').removeClass('active').removeClass('selected');
		$('.sidebar .in').removeClass('in');
		$click.parent().addClass('active selected');
		$click.parent().parent('ul').collapse('show');
		$click.parent().parent().parent().addClass('active');
		//~ update_url(url);
		$('#page-wrapper').load(url,function(){
			loadchart_cluster();
			init();
		});	
		
	})

	$('.cluster-stats a').unbind();
	$('.cluster-stats a').click(function(){
		url ='/?m=host&name='+$(this).attr('data-href')+'&moref='+$(this).attr('data-moref');
		$('#page-wrapper').load(url,function(){
			loadchart_host();
			init();
		});	

	})

	$('.vmlist-stats a').unbind();
	$('.vmlist-stats a').click(function(){
		url ='/?m=vm&name='+$(this).attr('data-href')+'&moref='+$(this).attr('data-moref');
		$('#page-wrapper').load(url,function(){
			loadchart_vm();
			init();
		});	

	})

	$('.host-stats a,.hostlist-stats a').unbind();
	$('.host-stats a,.hostlist-stats a').click(function(){
		url ='/?m=host&name='+$(this).attr('data-href')+'&moref='+$(this).attr('data-moref');

		$click = $('.sidebar [data-moref='+$(this).attr('data-moref')+']');
		$('.sidebar .active').removeClass('active').removeClass('selected');
		$('.sidebar .in').removeClass('in');
		$click.parent('li').parent('ul').parent('li').parent('ul').parent('li').addClass('active');
		$click.parent('li').parent('ul').parent('li').parent('ul').collapse('show');
		$click.parent('li').parent('ul').parent('li').addClass('active');		
		$click.parent('li').parent('ul').collapse('show');
		$click.parent().addClass('active selected');

		$('#page-wrapper').load(url,function(){
			loadchart_host();
			init();
		});	

	})

	$('#vms_total').unbind();
	$('#vms_total').click(function(){
		url ='/?m=vms&moref='+$('#moref').html();
		$('#page-wrapper').load(url,function(){
			init();
		});	
	})

	$('#hosts_total').unbind();
	$('#hosts_total').click(function(){
		url ='/?m=hosts&moref='+$('#moref').html();
		$('#page-wrapper').load(url,function(){
			init();
		});	

	})
	$('#search').unbind();
	$('#search').change(function(){
		alert($(this).val());
	});
	$('#search-btn').unbind();
	$('#search-btn').click(function(){
		alert($('#search').val());
	});	
	
	
}

function loadchart_vm() {

moref = $('#moref').html();

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"vm_guest_os"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_guest_os .label').html(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"vm_powerstate"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_powerstate .label').html(data.result)});	
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"vm_cpu_num"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_cpu_num .label').html(data.result)});	
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"vm_mem_total"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_mem_total .label').html(data.result)});	
		

    $('#graph-cpu').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Compute',style:{color:'white'}}},
        credits: {enabled: false},
	series: [{	name: 'CPU', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:20px;color:white">{y}</span><span style="font-size:20px;color:white"> %</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"round(vm_cpu_usage*100/vm_cpu_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-cpu').highcharts().series[0].setData(data.result[0])});
	
	
    $('#graph-mem').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Memory',style:{color:'white'}}},
        credits: {enabled: false},
	series: [{	name: 'Memoire', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:20px;color:white">{y}</span><span style="font-size:20px;color:white"> %</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"round(vm_mem_usage*100/(vm_mem_total))"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-mem').highcharts().series[0].setData(data.result[0])});
		
    $('#graph-disk').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Disk',style:{color:'white'}}},
        credits: {enabled: false},
	series: [{	name: 'Disques', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:20px;color:white">{y}</span><span style="font-size:20px;color:white"> %</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	//~ var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":""}],"id":"1"});
		//~ $.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		//~ .done(function(data){$('#graph-disk').highcharts().series[0].setData(data.result[0])});		


        $('#graph-consommation').highcharts({
            chart: {type: 'spline',borderRadius:5,borderwidth:0,shadow: true,marginLeft:100,marginRight:150}, title: {text: 'Consommation moyenne d\'une vm par jour'}, subtitle: {text: 'un point de mesure par jour'},
	    credits: {enabled: false},
            xAxis: {type:'category',title: {text: 'Date'}, tickmarkPlacement: 'on', title: {enabled: false}},
            yAxis: [
		{labels: {format: '{value} Mhz',style: {color: Highcharts.getOptions().colors[0]}},title: {text: 'CPU Usage (Mhz)', style: {color: Highcharts.getOptions().colors[0]}}, min: 0},
		{labels: {format: '{value} Mo',style: {color: Highcharts.getOptions().colors[1]}}, title: {text: 'Mem Usage (Mo)', style: {color: Highcharts.getOptions().colors[1]}}, min: 0,opposite: true}
		],
            tooltip: {shared:true},
	   series: [{name: 'CPU',data:[0]}, {name: 'RAM',data:[0],yAxis: 1}]
        });
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_hist","params":[{"moref":moref,"select":"vm_date,vm_cpu_usage"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[0].setData(data.result)});		
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_hist","params":[{"moref":moref,"select":"vm_date,vm_mem_usage"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[1].setData(data.result)});



}


function loadchart_cluster(){
	
moref = $('#moref').html();

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vms_total","params":[{"moref":moref,"select":"cluster_vms_total"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vms_total .label').html(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.hosts_total","params":[{"moref":moref,"select":"cluster_hosts_total"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#hosts_total .label').html(data.result)});	
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.clusters_hosts_vms","params":[{"moref":moref,"select":"DISTINCT LEAST(cluster_vmcpu_left,cluster_vmmem_left) as cluster_vm_left"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_left .label').html(data.result)});
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_vmcpu_average"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_cpu_average .label').html(data.result+' Mhz')});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_vmmem_average"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_mem_average .label').html(data.result+' Mo')});
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_failover_cpu"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#cluster_failover_cpu .label').html(data.result)});		
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_failover_mem"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#cluster_failover_mem .label').html(data.result)});	

	
	//Graph VM CPU
	$('#graph-ratio-cpu').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 8, title: { text: 'Ration vCpu/pCpu',style:{color:'white'}}},
        credits: {enabled: false},
	series: [{	name: 'Qt', 
			data: [0],
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px;color:white">{y}</span><span style="font-size:14px;color:white">vCPU/pCPU</span></div>'},
			tooltip: {valueSuffix: ' Qt'}
		   }]
	}));
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_vcpu_ratio"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-ratio-cpu').highcharts().series[0].setData(data.result[0])});	
	
	
    $('#graph-ratio-vm').highcharts(Highcharts.merge(gaugeOptions,{
	//data : vm_mem_average
        yAxis: { min: 60, max: 0, title: { text: 'Ration VM/Host',style:{color:'white'}}},
        credits: {enabled: false},
	series: [{	name: 'Qt', 
			data: [0],
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px;color:white">{y}</span><span style="font-size:14px;color:white">VM/Hosts</span></div>'},
			tooltip: {valueSuffix: ' Qt'}
		   }]
	}));
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_vmhost_ratio"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-ratio-vm').highcharts().series[0].setData(data.result[0])});		

	//Graph Consommation
	$('#graph-consommation').highcharts({
        chart: { type: 'bar',borderRadius:5,borderwidth:0,shadow: true,marginLeft:100,marginRight:50}, title: {text: 'Consommation cluster'},subtitle: {text:'avec HA'},
	credits: {enabled: false},
        xAxis: { categories: ['CPU', 'Mémoire']},
        yAxis: { title: {text: 'Consommation (%)'},min:0,max:100},
	tooltip: {valueSuffix: ' %'},
        series: [{name: 'Puissance consommee',data:[0]}, {name: 'Capacite totale',data:[0]}]
	});	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"round(cluster_cpu_usage*100/cluster_cpu_total) as cpu,round(cluster_mem_usage*100/cluster_mem_total) as mem"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[0].setData(data.result[0])});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"round(cluster_cpu_realcapacity*100/cluster_cpu_total) as cpur,round(cluster_mem_realcapacity*100/cluster_mem_total) as memr"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[1].setData(data.result[0])});

	
        $('#graph-consommation-hist').highcharts({
            chart: {type: 'spline',borderRadius:5,borderwidth:0,shadow: true,marginLeft:150,marginRight:150}, title: {text: 'Consommation moyenne d\'une vm par jour'}, subtitle: {text: 'un point de mesure par jour'},
	    credits: {enabled: false},
            xAxis: {type:'category',title: {text: 'Date'}, tickmarkPlacement: 'on', title: {enabled: false}},
            yAxis: [
		{labels: {format: '{value} Mhz',style: {color: Highcharts.getOptions().colors[0]}},title: {text: 'CPU Usage (Mhz)', style: {color: Highcharts.getOptions().colors[0]}}, min: 0},
		{labels: {format: '{value} Mo',style: {color: Highcharts.getOptions().colors[1]}}, title: {text: 'Mem Usage (Mo)', style: {color: Highcharts.getOptions().colors[1]}}, min: 0,opposite: true}
		],
            tooltip: {shared:true},
	   series: [{name: 'CPU',data:[0]}, {name: 'RAM',data:[0],yAxis: 1}]
        });
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_hist","params":[{"moref":moref,"select":"cluster_date,cluster_vmcpu_average"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation-hist').highcharts().series[0].setData(data.result)});		
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_hist","params":[{"moref":moref,"select":"cluster_date,cluster_vmmem_average"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation-hist').highcharts().series[1].setData(data.result)});		
	
        $('#graph-nombrevm-hist').highcharts({
            chart: {type: 'area',borderRadius:5,borderwidth:0,shadow: true,marginLeft:100,marginRight:50},title: {text: 'Nombre de machines virtuelles'},subtitle: {text: 'un point de mesure par jour'},
	    credits: {enabled: false},
	    legend: {layout: 'vertical',align: 'left',verticalAlign: 'top',x: 100,y: 50,floating: true,borderWidth: 1,backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'},
            xAxis: {type:'category',title: {text: 'Date'}, tickmarkPlacement: 'on', title: {enabled: false}},
            yAxis: {title: {text: 'Unit'}},
            tooltip: {shared: true,valueSuffix: ' Unit'},
            plotOptions: {area: {stacking: 'normal',lineColor: '#666666',lineWidth: 1,marker: {lineWidth: 1,lineColor: '#666666'}}},
            series: [{name: 'VM Restante',data:[0]}, {name: 'VM Totale',data:[0]}]
        });
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_hist","params":[{"moref":moref,"select":"cluster_date,cluster_vmmem_left"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-nombrevm-hist').highcharts().series[0].setData(data.result)});
	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_hist","params":[{"moref":moref,"select":"cluster_date,cluster_vms_total"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-nombrevm-hist').highcharts().series[1].setData(data.result)});	


	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_datastore_total"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){ 
			var datastore_total = data.result[0][0];
			var minds = Math.round(datastore_total*60/100);
			var medds = Math.round(datastore_total*80/100);
			$('#graph-disk').highcharts({
			    chart: {type: 'gauge',borderRadius:5,borderwidth:0,shadow: true,marginLeft:100,marginRight:50,plotBackgroundColor: null,plotBackgroundImage: null,plotBorderWidth: 0,plotShadow: false},
			    credits: {enabled: false},
			    title: { text: 'Espace disque'},
			    pane: {startAngle: -150,endAngle: 150,background: [{
				backgroundColor: {linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },stops: [[0, '#FFF'],[1, '#333']]},borderWidth: 0,outerRadius: '109%'}, {
				backgroundColor: {linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },stops: [[0, '#333'],[1, '#FFF']]},borderWidth: 1,outerRadius: '107%'}, {
				// default background 
				}, {
				backgroundColor: '#DDD',borderWidth: 0,outerRadius: '105%',innerRadius: '103%'}]},
			    yAxis: {
				min: 0,max: datastore_total,minorTickInterval: 'auto',minorTickWidth: 1,minorTickLength: 10,minorTickPosition: 'inside',minorTickColor: '#666',
				tickPixelInterval: 30,tickWidth: 2,tickPosition: 'inside',tickLength: 10,tickColor: '#666',labels: {step: 2,rotation: 'auto'},
				title: {text: 'Go'},
				plotBands: [{from: 0,to: minds,color: '#55BF3B'}, {from: minds,to: medds,color: '#DDDF0D'}, {from: medds,to: datastore_total,color: '#DF5353'}] },
			    series: [{name: 'Taille',tooltip: {valueSuffix: ' Go'},data:[0]}]
			},function(){
				var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_datastore_used"}],"id":"1"});
				$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
				.done(function(data){$('#graph-disk').highcharts().series[0].setData(data.result[0])})
			});
		});	


	
}

function loadchart_host(){

moref = $('#moref').html();
	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"vm_num"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vms_total .label').html(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"version"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#version .label').html(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"manufacturer"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#manufacturer .label').html(data.result)});
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"cluster"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#cluster .label').html(data.result)});		


    $('#graph-cpu').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Compute',style:{color:'white'}}},
        credits: {enabled: false},
	series: [{	name: 'CPU', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px;color:white">{y}</span><span style="font-size:14px;color:white">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"round(cpu_usage*100/cpu_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-cpu').highcharts().series[0].setData(data.result[0])});
	
	
    $('#graph-mem').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Memory',style:{color:'white'}}},
        credits: {enabled: false},
	series: [{	name: 'Memoire', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px;color:white">{y}</span><span style="font-size:14px;color:white">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"round(mem_usage*100/(mem_total*1000))"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-mem').highcharts().series[0].setData(data.result[0])});

    $('#graph-disk').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Datastore',style:{color:'white'}}},
        credits: {enabled: false},
	series: [{	name: 'Disque', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px;color:white">{y}</span><span style="font-size:14px;color:white">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"round(datastore_used*100/datastore_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-disk').highcharts().series[0].setData(data.result[0])});	
	

        $('#graph-consommation').highcharts({
            chart: {type: 'spline',borderRadius:5,borderwidth:0,shadow: true,marginLeft:100,marginRight:50}, title: {text: 'Consommation moyenne par jour'}, subtitle: {text: 'un point de mesure par jour'},
           credits: {enabled: false},
            xAxis: {type:'category',title: {text: 'Date'}, tickmarkPlacement: 'on', title: {enabled: false}},
            yAxis: {title: {text: 'cpu usage (%)'}, min: 0},
            tooltip: {headerFormat: '<b>{series.name}</b><br>',pointFormat: '{point.x:%e. %b}: {point.y:.2f} %'},
            series: [{name: 'CPU'}, { name: 'Memoire'}, {name: 'Disque'}]
        });

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_hist","params":[{"moref":moref,"select":"date,round(cpu_usage*100/cpu_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[0].setData(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_hist","params":[{"moref":moref,"select":"date,round(mem_usage*100/(mem_total*1000))"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[1].setData(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_hist","params":[{"moref":moref,"select":"date,round(datastore_used*100/datastore_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[2].setData(data.result)});

	
	
}

function loadchart_dashboard() {

moref = $('#moref').html();



	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vms_total","params":[],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#datacenter_vms_total .label').html(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.hosts_total","params":[],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#datacenter_hosts_total .label').html(data.result)});	





}

function update_url(url,name){
	if(typeof history.pushState == 'function') { 
		var stateObj = { foo: "bar" };
		history.pushState(stateObj, "KapaSeeTy - " + name, url);
	}
}

$(document).ready(function(){
	//Load init
	$('#side-menu').metisMenu();
	init();
	loadchart_dashboard();
});

$(window).bind("load resize", function() {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse')
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse')
        }

        height = (this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height-1) + "px");
        }
})