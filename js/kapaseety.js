 var gaugeOptions = {
	chart: { type: 'solidgauge', backgroundColor:'white',borderRadius:5,borderwidth:0,shadow: false},
	pane: { center: ['50%', '85%'],size: '140%',startAngle: -90,endAngle: 90, background: {backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',innerRadius: '60%',outerRadius: '100%',shape: 'arc'}},
	yAxis: {stops: [[0.1, '#55BF3B'], [0.5, '#DDDF0D'],[0.9, '#DF5353']],lineWidth: 0, minorTickInterval: null, tickPixelInterval: 400, tickWidth: 0, title: { y: 70},labels: {y: 0}},
	plotOptions: {solidgauge: {dataLabels: { y: 5, borderWidth: 0,  useHTML: true }}},
	credits: {enabled: false}
	};
	
 var gaugeOptionsSmall = {
	chart: { type: 'solidgauge', backgroundColor:'white',borderRadius:5,borderwidth:0,shadow: false},
	pane: { center: ['50%', '85%'],size: '140%',startAngle: -90,endAngle: 90, background: {backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',innerRadius: '60%',outerRadius: '100%',shape: 'arc'}},
	yAxis: {stops: [[0.1, '#55BF3B'], [0.5, '#DDDF0D'],[0.9, '#DF5353']],lineWidth: 0, minorTickInterval: null, tickPixelInterval: 400, tickWidth: 0, title: { y: 40},labels: {y: 0}},
	plotOptions: {solidgauge: {dataLabels: { y: -20, borderWidth: 0,  useHTML: true }}},
	credits: {enabled: false}
	};	

var graphOptions = {  
	chart: {borderRadius:5,borderwidth:0,shadow: false}, 
	exporting: {enabled: true},
	credits: {enabled: false}
	};

function init() {

	$('.table-paging').dataTable({jQueryUI:true,searching:false,scrollX: true,scrollCollapse: true,"order": []})
	$('.table-simple').dataTable({jQueryUI:true,searching:false,scrollX: true,scrollCollapse: true,paging: false,info:false,"order": []})
	$('.table-paging,table-simple').on( 'draw.dt',links);
	links();
}

function links(){
	
	 $('#datacenter_vms_total .label, #datacenter_hosts_total .label').hover(function() {
		$(this).css('cursor','pointer');
	});	

	$('#topmenu .item').unbind();
	$('#topmenu .item').click(function(event){
		type = $(this).attr('data-href');
		url = '?m='+type+'&moref='+$(this).attr('data-moref')+'&madate='+encodeURI($('#madate').val());
		event.preventDefault();

		update_url(url);
		if ($('#side-menu').find(this).length ==1) {
			$('#side-menu .selected').removeClass('active').removeClass('selected');
			$(this).parent().addClass('active selected');
		}
		$('#page-wrapper').load(url,function(){
			if (type=='cluster') {
				loadchart_cluster();}
			if (type=='host') {
				loadchart_host();}
			if (type=='vm') {
				loadchart_vm();}
			if (type=='datastore') {
				loadchart_datastore();}
			if (type=='dashboard') {
				loadchart_dashboard();}				
			init();
		});	
	})
	
	$('#madate').unbind();
	$('#madate').change(function(){
		$('.selected .item').trigger('click');
	});
	
	$('.dashboard td a,.ref-cluster a').unbind();
	$('.dashboard td a,.ref-cluster a').click(function(){
		url = '?m=cluster&moref='+$(this).attr('data-moref');
		$click = $('.sidebar [data-moref='+$(this).attr('data-moref')+']');
		$('.sidebar .active').removeClass('active').removeClass('selected');
		$('.sidebar .in').removeClass('in');
		$click.parent().addClass('active selected');
		$click.parent().parent('ul').collapse('show');
		$click.parent().parent().parent().addClass('active');
		update_url(url);
		$('#page-wrapper').load(url,function(){
			loadchart_cluster();
			init();
		});	
	return false;		
	})

	$('.vmlist-stats td a,.vmlist-stats .btn').unbind();
	$('.vmlist-stats td a,.vmlist-stats .btn').click(function(){
		url ='?m=vm&moref='+$(this).attr('data-moref');
		update_url(url);
		$('#page-wrapper').load(url,function(){
			loadchart_vm();
			init();
		});	
	return false;
	})

	$('.hostlist-stats td a,.hostlist-stats .btn').unbind();
	$('.hostlist-stats td a,.hostlist-stats .btn').click(function(){
		url ='?m=host&moref='+$(this).attr('data-moref');
		update_url(url);
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
	return false;
	})

	$('#datacenter_vms_total').unbind();
	$('#datacenter_vms_total').click(function(){
		url ='?m=vms';
		update_url(url);
		$('#page-wrapper').load(url,function(){
			init();
		});	
	return false;		
	})

	$('#datacenter_hosts_total').unbind();
	$('#datacenter_hosts_total').click(function(){
		url ='?m=hosts';
		update_url(url);
		$('#page-wrapper').load(url,function(){
			init();
		});	
	return false;
	})
	
	$('#search').unbind();
	$('#search').change(function(){
		url ='?m=search&search='+$('#search').val();
		update_url(url);
		$('#page-wrapper').load(url,function(){
			init();
			$('#search').val(null);
		});	
	});
	
	$('#search-btn').unbind();
	$('#search-btn').click(function(){
		url ='?m=search&search='+$('#search').val();
		update_url(url);
		$('#page-wrapper').load(url,function(){
			init();
			$('#search').val(null);
		});	
	});	
	
	
}

function loadchart_vm() {

	moref = $('#moref').html();
	//Graph CPU
	$('#graph-cpu').highcharts(Highcharts.merge(gaugeOptions,{
	title:{ text: 'Compute'},
        yAxis: { min: 0, max: 100,},
        credits: {enabled: false},
	series: [{	name: 'CPU', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:20px">{y}</span><span style="font-size:20px"> %</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	//Graph MEM
	$('#graph-mem').highcharts(Highcharts.merge(gaugeOptions,{
	title:{ text: 'Memory'},
        yAxis: { min: 0, max: 100},
        credits: {enabled: false},
	series: [{	name: 'Memoire', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:20px">{y}</span><span style="font-size:20px"> %</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));		
	//Graph Disk
	$('#graph-disk').highcharts(Highcharts.merge(gaugeOptions,{
	title:{ text: 'Disk'},
        yAxis: { min: 0, max: 100},
        credits: {enabled: false},
	series: [{	name: 'Disques', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:20px">{y}</span><span style="font-size:20px"> %</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	
	// Load series for Graph below
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_serie","params":[{"moref":moref,"select":"round(vm_cpu_usage*100/vm_cpu_total),round(vm_mem_usage*100/vm_mem_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){
			$('#graph-cpu').highcharts().series[0].setData([data.result[0]]);
			$('#graph-mem').highcharts().series[0].setData([data.result[1]]);
		});
	
	//Graph Consommation
        $('#graph-consommation').highcharts({
            chart: {type: 'spline',zoomType: 'x',borderRadius:5,borderwidth:0,shadow: true,marginLeft:100,marginRight:150}, title: {text: 'Consommation moyenne par jour'}, subtitle: {text: 'un point de mesure par jour'},
	    credits: {enabled: false},
            xAxis: {type:'datetime',title: {text: 'Date'}, tickmarkPlacement: 'on', title: {enabled: false}},
            yAxis: [
		{labels: {format: '{value} Mhz',style: {color: Highcharts.getOptions().colors[0]}},title: {text: 'CPU Usage (Mhz)', style: {color: Highcharts.getOptions().colors[0]}}, min: 0},
		{labels: {format: '{value} Mo',style: {color: Highcharts.getOptions().colors[1]}}, title: {text: 'Mem Usage (Mo)', style: {color: Highcharts.getOptions().colors[1]}}, min: 0,opposite: true}
		],
            tooltip: {shared:true},
	   series: [{name: 'CPU',data:[0]}, {name: 'RAM',data:[0],yAxis: 1}]
        });
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_hist","params":[{"moref":moref,"select":"unix_timestamp(vm_date)*1000,vm_cpu_usage"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[0].setData(data.result)});		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vm_hist","params":[{"moref":moref,"select":"unix_timestamp(vm_date)*1000,vm_mem_usage"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[1].setData(data.result)});
}

function loadchart_cluster(){
	
	moref = $('#moref').html();
	
	//Graph Left VM			
	$('#graph-vm-left').highcharts(Highcharts.merge(gaugeOptions,{
	chart:{shadow:true},
        yAxis: { min: 0, max: 50, title: { text: 'VM Restante '}},
	title: {text:'Cluster Capacity'},
	series: [{	name: 'Qt', 
			data: [0],
			dataLabels: {format: '<div class="dataLabels" style="text-align:center"><span style="font-size:12px">{y} </span><span style="font-size:12px">Machines</span></div>'}
		   }]
	}));
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"DISTINCT LEAST(cluster_vmcpu_left,cluster_vmmem_left) as cluster_vm_left,cluster_vms_total as vm_num"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){
			$('#graph-vm-left').highcharts().yAxis[0].axisTitle.attr({text:'VM Restante :'+data.result[0]+' (moy. '+vm_cpu_average+'Mhz - '+vm_mem_average+'Mo)'});
			$('#graph-vm-left').highcharts().yAxis[0].setExtremes(0,(data.result[0]+data.result[1]));
			$('#graph-vm-left').highcharts().series[0].setData([data.result[1]]);
			});		
	
	//Graph Ratio CPU
	$('#graph-ratio-cpu').highcharts(Highcharts.merge(gaugeOptionsSmall,{
	title: null,
        yAxis: { min: 0, max: 8, title: { text: 'Ratio vCpu/pCpu'}},
	series: [{	name: 'Qt', 
			data: [0],
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px">{y} </span></div>'},
			tooltip: {valueSuffix: ' Qt'}
		   }]
	}));
	//Graph Ratio VM
	$('#graph-ratio-vm').highcharts(Highcharts.merge(gaugeOptionsSmall,{
	title: null,
        yAxis: { min: 60, max: 0, title: {text: 'Ratio VM/Host'}},
	series: [{	name: 'Qt', 
			data: [0],
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px">{y} </span></div>'},
			tooltip: {valueSuffix: ' Qt'}
		   }]
	}));
	// Graph HA Cluster
	$('#graph-ha').highcharts(Highcharts.merge(graphOptions,{
        chart: { type: 'bar',marginLeft:100,marginRight:50}, title: {text: 'HA cluster'},subtitle: {text:'avec HA'},
        xAxis: { categories: ['']},
        yAxis: { title: {text: 'Qantity (unit)'},min:0},
	tooltip: {valueSuffix: ' Qt'},
        series: [{name: 'HA Memory',data:[0]},{name: 'HA CPU',data:[0]},{name: 'Hypervisors',data:[0]}]
	}));	
	//Graph Disk space
	$('#graph-disk').highcharts(Highcharts.merge(gaugeOptions,{
	title: {text: 'Disk Usage'},
        yAxis: { min: 0, max: 1000,title: {text: 'Free space'}},
	series: [{	name: 'Go', 
			data: [0],
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px">{y} Go</span></div>'},
			tooltip: {valueSuffix: ' Go'}
		   }]
	}));	
		
	// Load series for Graph below
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"cluster_vmcpu_average,cluster_vmmem_average,cluster_vcpu_ratio,cluster_vmhost_ratio,cluster_failover_mem,cluster_failover_cpu,cluster_hosts_total,cluster_datastore_used,cluster_datastore_total,cluster_datastore_free"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){
			vm_cpu_average = data.result[0];
			vm_mem_average =data.result[1];
			$('#graph-ratio-cpu').highcharts().series[0].setData([data.result[2]]);
			$('#graph-ratio-vm').highcharts().series[0].setData([data.result[3]]);
			$('#graph-ha').highcharts().series[0].setData([data.result[4]]);
			$('#graph-ha').highcharts().series[1].setData([data.result[5]]);
			$('#graph-ha').highcharts().series[2].setData([data.result[6]]);
			$('#graph-ha').highcharts().yAxis[0].setExtremes(0,data.result[6]);
			$('#graph-disk').highcharts().yAxis[0].axisTitle.attr({text:'Free space :'+data.result[9]+'<br/>Total space :'+data.result[8]});
			$('#graph-disk').highcharts().yAxis[0].setExtremes(0,data.result[8]);
			$('#graph-disk').highcharts().series[0].setData(([data.result[7]]));			
		});		
			
	//Graph Consommation
	$('#graph-consommation').highcharts(Highcharts.merge(graphOptions,{
        chart: { type: 'bar',marginLeft:100,marginRight:50}, title: {text: 'Consommation cluster'},subtitle: {text:'avec HA'},
        xAxis: { categories: ['CPU', 'Mémoire']},
        yAxis: { title: {text: 'Consommation (%)'},min:0,max:100},
	tooltip: {valueSuffix: ' %'},
        series: [{name: 'Puissance consommée',data:[0]}, {name: 'Capacite totale',data:[0]}]
	}));	
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"round(cluster_cpu_usage*100/cluster_cpu_total) as cpu,round(cluster_mem_usage*100/cluster_mem_total) as mem"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[0].setData(data.result)});
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_serie","params":[{"moref":moref,"select":"round(cluster_cpu_realcapacity*100/cluster_cpu_total) as cpur,round(cluster_mem_realcapacity*100/cluster_mem_total) as memr"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[1].setData(data.result)});

	// Graph Historic Consommation 
        $('#graph-consommation-hist').highcharts(Highcharts.merge(graphOptions,{
            chart: {type: 'spline',zoomType: 'x',marginLeft:150,marginRight:150}, title: {text: 'Consommation moyenne des vms par jour'}, subtitle: {text: 'un point de mesure par jour'},
            xAxis: {type:'datetime',title: {text: 'Date'}, tickmarkPlacement: 'on', title: {enabled: false},labels:{rotation: -45}},
            yAxis: [
		{labels: {format: '{value} Mhz',style: {color: Highcharts.getOptions().colors[0]}},title: {text: 'CPU Usage (Mhz)', style: {color: Highcharts.getOptions().colors[0]}}, min: 0},
		{labels: {format: '{value} Mo',style: {color: Highcharts.getOptions().colors[1]}}, title: {text: 'Mem Usage (Mo)', style: {color: Highcharts.getOptions().colors[1]}}, min: 0,opposite: true}
		],
            tooltip: {shared:true},
	   series: [{name: 'CPU',data:[0]}, {name: 'RAM',data:[0],yAxis: 1}]
        }));
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_hist","params":[{"moref":moref,"select":"unix_timestamp(cluster_date)*1000,cluster_vmcpu_average"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation-hist').highcharts().series[0].setData(data.result)});		
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_hist","params":[{"moref":moref,"select":"unix_timestamp(cluster_date)*1000,cluster_vmmem_average"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation-hist').highcharts().series[1].setData(data.result)});	
		
	// Graph Historic VM Numbers
        $('#graph-nombrevm-hist').highcharts(Highcharts.merge(graphOptions,{
            chart: {type: 'area',zoomType: 'x',marginLeft:100,marginRight:50},title: {text: 'Nombre de machines virtuelles'},subtitle: {text: 'un point de mesure par jour'},
	    legend: {layout: 'vertical',align: 'left',verticalAlign: 'top',x: 100,y: 50,floating: true,borderWidth: 1,backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'},
            xAxis: {type:'datetime',zoomType: 'x',title: {text: 'Date'}, tickmarkPlacement: 'on', title: {enabled: false}},
            yAxis: {title: {text: 'Unit'}},
            tooltip: {shared: true,valueSuffix: ' Unit'},
            plotOptions: {area: {stacking: 'normal',lineColor: '#666666',lineWidth: 1,marker: {lineWidth: 1,lineColor: '#666666'}}},
            series: [{name: 'VM Restante',data:[0]}, {name: 'VM Totale',data:[0]}]
        }));
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_hist","params":[{"moref":moref,"select":"unix_timestamp(cluster_date)*1000,cluster_vmmem_left"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-nombrevm-hist').highcharts().series[0].setData(data.result)});
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.cluster_hist","params":[{"moref":moref,"select":"unix_timestamp(cluster_date)*1000,cluster_vms_total"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-nombrevm-hist').highcharts().series[1].setData(data.result)});		

	
}

function loadchart_host(){

	moref = $('#moref').html();
	
	//Graph CPU
	$('#graph-cpu').highcharts(Highcharts.merge(gaugeOptions,{
	title: { text: 'Compute'},
        yAxis: { min: 0, max: 100},
        credits: {enabled: false},
	series: [{	name: 'CPU', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px">{y}</span><span style="font-size:14px">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	// Graph Mem
	$('#graph-mem').highcharts(Highcharts.merge(gaugeOptions,{
	title: { text: 'Memory'},
        yAxis: { min: 0, max: 100},
        credits: {enabled: false},
	series: [{	name: 'Memoire', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px">{y}</span><span style="font-size:14px">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	//Graph Disk
	$('#graph-disk').highcharts(Highcharts.merge(gaugeOptions,{
	title: { text: 'Datastore'},
        yAxis: { min: 0, max: 100},
        credits: {enabled: false},
	series: [{	name: 'Disque', 
			data: [0], 
			dataLabels: {format: '<div style="text-align:center"><span style="font-size:14px">{y}</span><span style="font-size:14px">%</span></div>'},
			tooltip: {valueSuffix: ' %'}
		   }]
	}));	
	
	// Load series for Graph below
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_serie","params":[{"moref":moref,"select":"round(cpu_usage*100/cpu_total),round(mem_usage*100/mem_total),round(datastore_used*100/datastore_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){
			$('#graph-cpu').highcharts().series[0].setData([data.result[0]]);
			$('#graph-mem').highcharts().series[0].setData([data.result[1]]);
			$('#graph-disk').highcharts().series[0].setData([data.result[2]]);
	});
	
	// Graph Consommation
        $('#graph-consommation').highcharts({
            chart: {type: 'spline',zoomType: 'x',borderRadius:5,borderwidth:0,shadow: true,marginLeft:100,marginRight:50}, title: {text: 'Consommation moyenne par jour'}, subtitle: {text: 'un point de mesure par jour'},
           credits: {enabled: false},
            xAxis: {type:'datetime',title: {text: 'Date'}, tickmarkPlacement: 'on', title: {enabled: false}},
            yAxis: {title: {text: 'cpu usage (%)'}, min: 0},
            tooltip: {headerFormat: '<b>{series.name}</b><br>',pointFormat: '{point.x:%e. %b}: {point.y:.2f} %'},
            series: [{name: 'CPU'}, { name: 'Memoire'}, {name: 'Disque'}]
        });

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_hist","params":[{"moref":moref,"select":"unix_timestamp(date)*1000,round(cpu_usage*100/cpu_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[0].setData(data.result)});
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_hist","params":[{"moref":moref,"select":"unix_timestamp(date)*1000,round(mem_usage*100/mem_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[1].setData(data.result)});
	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.host_hist","params":[{"moref":moref,"select":"unix_timestamp(date)*1000,round(datastore_used*100/datastore_total)"}],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#graph-consommation').highcharts().series[2].setData(data.result)});
}

function loadchart_dashboard() {

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.vms_total","params":[null],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#datacenter_vms_total .label').html(data.result[0])});

	var js = JSON.stringify({"jsonrpc":"2.0","method":"WS_Stats.hosts_total","params":[null],"id":"1"});
		$.ajax({url:'',data:js,type:'POST',dataType:"json",contentType: "application/json"})
		.done(function(data){$('#datacenter_hosts_total .label').html(data.result[0])});	
}

function update_url(url,name){
	if(typeof history.pushState == 'function') { 
		var stateObj = {};
		history.pushState(stateObj, "KapaSeeTy - " + name, url);
	}
}


$(document).ready(function(){
	//Load init
	
	$('#side-menu [data-href="dashboard"]').parent('li').addClass('active');
	$('#side-menu [data-href="dashboard"]').parent('li').addClass('selected');	
	$('#side-menu').metisMenu();
	init();
});

history.replaceState(true, null, window.location.href);

$(window).bind('popstate', function(event) {
  if (event.originalEvent.state) {
	location.reload();
  }
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