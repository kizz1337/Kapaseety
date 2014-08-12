function init() {
	
	$(".tablesorter").tablesorter({theme: 'bootstrap',headerTemplate: '{content}{icon}',widgets : [ "uitheme"]});

	$('.datacenter-stats a').unbind();
	$('.datacenter-stats a').click(function(){
		url = '/?m=cluster&name='+$(this).attr('data-href')+'&moref='+$(this).attr('data-moref');
		//~ update_url(url);
		$('#content').load(url,function(){
			loadchart_cluster();
			init();
		});	
	})

	$('.cluster-stats a').unbind();
	$('.cluster-stats a').click(function(){
		url ='/?m=host&name='+$(this).attr('data-href')+'&moref='+$(this).attr('data-moref');
		$('#content').load(url,function(){
			loadchart_host();
			init();
		});	

	})

	$('.vmlist-stats a').unbind();
	$('.vmlist-stats a').click(function(){
		url ='/?m=vm&name='+$(this).attr('data-href')+'&moref='+$(this).attr('data-moref');
		$('#content').load(url,function(){
			loadchart_vm();
			init();
		});	

	})

	$('.host-stats a').unbind();
	$('.host-stats a').click(function(){
		url ='/?m=host&name='+$(this).attr('data-href')+'&moref='+$(this).attr('data-moref');
		$('#content').load(url,function(){
			loadchart_host();
			init();
		});	

	})

	$('#vm_total').unbind();
	$('#vm_total').click(function(){
		url ='/?m=vms&name=Liste%20de%20machines%20virtuelles&moref='+$('#moref').html();
		$('#content').load(url,function(){
			init();
		});	

	})

	$('#hosts_total').unbind();
	$('#hosts_total').click(function(){
		url ='/?m=hosts&name=Liste%20des%20hyperviseurs&moref='+$('#moref').html();
		$('#content').load(url,function(){
			init();
		});	

	})
	
}

function loadchart_vm() {

moref = $('#moref').html();

 var gaugeOptions = {
	chart: { type: 'solidgauge'},
	title: null,
	pane: { center: ['50%', '85%'],size: '140%',startAngle: -90,endAngle: 90, background: {backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',innerRadius: '60%',outerRadius: '100%',shape: 'arc'}},
	yAxis: {stops: [[0.1, '#55BF3B'], [0.5, '#DDDF0D'],[0.9, '#DF5353']],lineWidth: 0, minorTickInterval: null, tickPixelInterval: 400, tickWidth: 0, title: { y: -70},labels: {y: 16}},
	plotOptions: {solidgauge: {dataLabels: { y: 5, borderWidth: 0,  useHTML: true }}}
	};

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"vm_guest_os"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_guest_os .label').html(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"vm_powerstate"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_powerstate .label').html(data.result)});	
		

    $('#graph-cpu').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Consommation CPU'}},
        credits: {enabled: false},
	series: [{	name: 'CPU', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:25px;color:' + ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +      	'<span style="font-size:12px;color:silver">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"round(vm_cpu_usage*100/vm_cpu_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-cpu').highcharts().series[0].setData(data.result[0])});
	
	
    $('#graph-mem').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Consommation Memoire'}},
        credits: {enabled: false},
	series: [{	name: 'Memoire', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:25px;color:' + ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +      	'<span style="font-size:12px;color:silver">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"round(vm_mem_usage*100/(vm_mem_total))"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-mem').highcharts().series[0].setData(data.result[0])});


        $('#graph-consommation').highcharts({
            chart: {type: 'spline'}, title: {text: 'Consommation moyenne d\'une vm par jour'}, subtitle: {text: 'un point de mesure par jour'},
	    credits: {enabled: false},
            xAxis: {type:'category',title: {text: 'Date'}, tickmarkPlacement: 'on', title: {enabled: false}},
            yAxis: [
		{labels: {format: '{value} Mhz',style: {color: Highcharts.getOptions().colors[0]}},title: {text: 'CPU Usage (Mhz)', style: {color: Highcharts.getOptions().colors[0]}}, min: 0},
		{labels: {format: '{value} Mo',style: {color: Highcharts.getOptions().colors[1]}}, title: {text: 'Mem Usage (Mo)', style: {color: Highcharts.getOptions().colors[1]}}, min: 0,opposite: true}
		],
            tooltip: {shared:true},
	   series: [{name: 'CPU',data:[0]}, {name: 'RAM',data:[0],yAxis: 1}]
        });
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_hist","params":[{"moref":moref,"select":"date,vm_cpu_average"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation-hist').highcharts().series[0].setData(data.result)});		
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_hist","params":[{"moref":moref,"select":"date,vm_mem_average"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation-hist').highcharts().series[1].setData(data.result)});



}


function loadchart_cluster(){
	
moref = $('#moref').html();

 var gaugeOptions = {
	chart: { type: 'solidgauge'},
	title: null,
	pane: { center: ['50%', '85%'],size: '140%',startAngle: -90,endAngle: 90, background: {backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',innerRadius: '60%',outerRadius: '100%',shape: 'arc'}},
	yAxis: {stops: [[0.1, '#55BF3B'], [0.5, '#DDDF0D'],[0.9, '#DF5353']],lineWidth: 0, minorTickInterval: null, tickPixelInterval: 400, tickWidth: 0, title: { y: -70},labels: {y: 16}},
	plotOptions: {solidgauge: {dataLabels: { y: 5, borderWidth: 0,  useHTML: true }}}
	};
	

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_vms_total"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_total .label').html(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_hosts_total"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#hosts_total .label').html(data.result)});	
		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"LEAST(cluster_vmcpu_left,cluster_vmmem_left) as cluster_vm_left"}],"id":"1"});
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
        yAxis: { min: 0, max: 8, title: { text: 'Ration vCpu/pCpu'}},
        credits: {enabled: false},
	series: [{	name: 'Qt', 
			data: [0],
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:25px;color:' + ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +      	'<span style="font-size:12px;color:silver">Qt</span></div>'},
			tooltip: {valueSuffix: ' Qt'}
		   }]
	}));
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_vcpu_ratio"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-ratio-cpu').highcharts().series[0].setData(data.result[0])});	
	
	
    $('#graph-ratio-vm').highcharts(Highcharts.merge(gaugeOptions,{
	//data : vm_mem_average
        yAxis: { min: 60, max: 0, title: { text: 'Ration VM/Host'}},
        credits: {enabled: false},
	series: [{	name: 'Qt', 
			data: [0],
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:25px;color:' + ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +      	'<span style="font-size:12px;color:silver">Qt</span></div>'},
			tooltip: {valueSuffix: ' Qt'}
		   }]
	}));
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_vmhost_ratio"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-ratio-vm').highcharts().series[0].setData(data.result[0])});		

	//Graph Consommation
	$('#graph-consommation').highcharts({
        chart: { type: 'bar'}, title: {text: 'Consommation cluster'},subtitle: {text:'avec HA'},
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
	//serie[0] : date,vm_cpu_average
	//serie[1] : date,vm_mem_average
            chart: {type: 'spline'}, title: {text: 'Consommation moyenne d\'une vm par jour'}, subtitle: {text: 'un point de mesure par jour'},
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
	    //serie[0] : date,vm_total
	   //serie[0] : date,vm_mem_left
            chart: {type: 'area'},title: {text: 'Nombre de machines virtuelles'},subtitle: {text: 'un point de mesure par jour'},
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
			    chart: {type: 'gauge',plotBackgroundColor: null,plotBackgroundImage: null,plotBorderWidth: 0,plotShadow: false},
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
	
 var gaugeOptions = {
	chart: { type: 'solidgauge'},
	title: null,
	pane: { center: ['50%', '85%'],size: '140%',startAngle: -90,endAngle: 90, background: {backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',innerRadius: '60%',outerRadius: '100%',shape: 'arc'}},
	yAxis: {stops: [[0.1, '#55BF3B'], [0.5, '#DDDF0D'],[0.9, '#DF5353']],lineWidth: 0, minorTickInterval: null, tickPixelInterval: 400, tickWidth: 0, title: { y: -70},labels: {y: 16}},
	plotOptions: {solidgauge: {dataLabels: { y: 5, borderWidth: 0,  useHTML: true }}}
	};
	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"vm_num"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#vm_total .label').html(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"version"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#version .label').html(data.result)});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"manufacturer"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#manufacturer .label').html(data.result)});


    $('#graph-cpu').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Consommation CPU'}},
        credits: {enabled: false},
	series: [{	name: 'CPU', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:25px;color:' + ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +      	'<span style="font-size:12px;color:silver">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"round(cpu_usage*100/cpu_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-cpu').highcharts().series[0].setData(data.result[0])});
	
	
    $('#graph-mem').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Consommation Memoire'}},
        credits: {enabled: false},
	series: [{	name: 'Memoire', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:25px;color:' + ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +      	'<span style="font-size:12px;color:silver">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"round(mem_usage*100/(mem_total*1000))"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-mem').highcharts().series[0].setData(data.result[0])});

    $('#graph-disk').highcharts(Highcharts.merge(gaugeOptions,{
        yAxis: { min: 0, max: 100, title: { text: 'Consommation Disque'}},
        credits: {enabled: false},
	series: [{	name: 'Disque', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:25px;color:' + ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +      	'<span style="font-size:12px;color:silver">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"round(datastore_used*100/datastore_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-disk').highcharts().series[0].setData(data.result[0])});	
	

        $('#graph-consommation').highcharts({
            chart: {type: 'spline'}, title: {text: 'Consommation moyenne par jour'}, subtitle: {text: 'un point de mesure par jour'},
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

function update_url(url,name){
	if(typeof history.pushState == 'function') { 
		var stateObj = { foo: "bar" };
		history.pushState(stateObj, "PhotoShow - " + name, url);
	}
}

$(document).ready(function(){
	//Load init
	init();
});