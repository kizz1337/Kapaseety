<?php
class HostDetail {

	private $moref;
	private $order;
	private $desc;
	private $style;
	private $MySQL;

	function __construct($moref,$order = "1",$desc = "desc") {
		$this->moref = $moref;
		$this->order = $order;
		$this->desc = $desc;
		$this->style = new Style();
		$this->MySQL = new SGBD();
	}

	function toHTML() {
		echo "<span id='moref' style='display:none'>".$this->moref."</span>";
		$SQL='SELECT hostname,version,manufacturer,cpu_socket_num,mem_total,clustername,cluster_moref FROM clusterhosts WHERE moref="'.$this->moref.'"';
		$Rslt = $this->MySQL->TabResSQL($SQL);	
		$os = $Rslt[0]['manufacturer'];
		$logo = '<i class="fa fa-building fa-fw"></i> '.$os;
		if (preg_match('#ibm#i',$os)) {$logo = 'IBM -  '.$os;}
		if (preg_match('#dell#i',$os)) {$logo = 'DELL - '.$os;}
		if (preg_match('#cisco#i',$os)) {$logo = 'DELL - '.$os;}
		if (preg_match('#hp|hewlett|packard#i',$os)) {$logo = 'HP - '.$os;}
		echo "<div class='row'>
				<div class='col-lg-1'><h1><i class='fa fa-building fa-fw'></i></h1></div>
				<div class='col-lg-10'>
					<h3>".$Rslt[0]['hostname']."</h3>
					<h6 class='page-subtitle'>(".$Rslt[0]['cpu_socket_num']." vCPU / ".$Rslt[0]['mem_total']."Mo RAM) - VMWare ESXi v".$Rslt[0]['version']."</h6>
				</div>
				<div class='col-lg-1 ref-cluster'><a href='#' data-moref='".$Rslt[0]['cluster_moref']."'><h6><i class='fa fa-sitemap fa-fw'></i>".$Rslt[0]['clustername']."</h6></a></div>					
			</div>";
		echo "<div class='row'>";
		$this->style->Graph('graph-cpu','col-lg-4',200);
		$this->style->Graph('graph-mem','col-lg-4',200);
		$this->style->Graph('graph-disk','col-lg-4',200);
		echo "</div>";	
		echo "<div class='row'>";
		echo "<div class='panel panel-yellow vmlist-stats' style='margin: 9px 18px;'>";
		echo "<div class='panel-body'>";
		$SQL='SELECT vm_moref,vmname,vm_cpu_usage,vm_mem_usage FROM clusters_hosts_vms WHERE moref="'.$this->moref.'" order by vmname';
		$Rslt = $this->MySQL->TabResSQL($SQL);
		foreach ($Rslt as $value) {
		echo "<button class='btn btn-warning btn-circle' style='margin-left:2px' data-toggle='tooltip' data-placement='top' data-moref='".$value['vm_moref']."' title='Name :".$value['vmname']."\nCPU: ".$value['vm_cpu_usage']."%\nRAM: ".$value['vm_mem_usage']."Mo'><i class='fa fa-laptop'></i></button>";
		}
		echo "</div></div>";
		echo "</div>";	
		echo "<div class='row'>";
		$this->style->Graph('graph-consommation','col-lg-12');
		echo "</div>";	
		echo "<div class='row'>";
		$SQL='SELECT vm_moref,vmname as "Name",vm_guest_os as "OS" ,vm_cpu_num "Cores",vm_cpu_total as "Total compute",vm_mem_total as "Total memory"
			FROM vmhosts WHERE moref="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		$Resulats = $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resulats,"vmlist-stats");
		echo "</div>";		
		echo "<div class='row'>";
		$SQL='SELECT 
			cpu_socket_num as "Cores",
			mem_total as "Memory (Mo)",
			datastore_free as "Freee disk",
			datastore_total as "Total disk",
			cpu_usage as "CPU Usage (Mhz)",
			mem_usage as "Memory Usage (Mo)",
			date as "Date"
			FROM data_hosts WHERE moref="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		$Resulats = $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resulats,null,null,true);
		echo "</div>";	
	}
}
?>