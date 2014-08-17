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
		$SQL='SELECT hostname,version,manufacturer,cpu_socket_num,mem_total,clustername FROM clusterhosts WHERE moref="'.$this->moref.'"';
		$Rslt = $this->MySQL->TabResSQL($SQL);	
		$os = $Rslt[0]['manufacturer'];
		$logo = '<i class="fa fa-building fa-fw"></i> '.$os;
		if (preg_match('#ibm#i',$os)) {$logo = 'IBM -  '.$os;}
		if (preg_match('#dell#i',$os)) {$logo = 'DELL - '.$os;}
		if (preg_match('#cisco#i',$os)) {$logo = 'DELL - '.$os;}
		if (preg_match('#hp|hewlett|packard#i',$os)) {$logo = 'HP - '.$os;}
		echo "<div class='row'>
				<div class='col-lg-1'><h1><i class='fa fa-building fa-fw'></i></h1></div>
				<div class='col-lg-10'><h3> ".$Rslt[0]['hostname']."</h3><h6 class='page-subtitle'>".$logo." - (".$Rslt[0]['cpu_socket_num']." vCPU / ".$Rslt[0]['mem_total']."Mo RAM) - VMWare ESXi v".$Rslt[0]['version']."</h6></div>
				<div class='col-lg-1'><h1><i class='fa fa-sitemap fa-fw'></i>".$Rslt[0]['clustername']."</h1></div>
			</div>";
		echo "<div class='row'>";
		$this->style->Graph('graph-cpu','col-lg-4',200);
		$this->style->Graph('graph-mem','col-lg-4',200);
		$this->style->Graph('graph-disk','col-lg-4',200);
		echo "</div>";	
		echo "<div class='row'>";
		$this->style->Label('vms_total','success','Nombre de VM','col-lg-12');
		echo "</div>";	
		echo "<div class='row'>";
		$this->style->Graph('graph-consommation','col-lg-12');
		echo "</div>";	
		echo "<div class='row'>";
		$SQL='SELECT 
			vm_num as "Nombre de VM",
			mem_total as "Memoire totale",
			cpu_socket_num as "Nombre des coeurs",
			datastore_free as "Espace libre",
			datastore_total as "Volumetrie totale",
			cpu_usage as "Consommation CPU",
			mem_usage as "Consommation RAM",
			date as "Date"
			FROM data_hosts WHERE moref="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		$Resulats = $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resulats,"host-stats",null,true);
		echo "</div>";	
	}
}
?>