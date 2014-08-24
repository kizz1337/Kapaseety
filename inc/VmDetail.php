<?php
class VmDetail {

	private $moref;
	private $style;
	private $MySQL;

	function __construct($moref) {
		$this->moref = $moref;
		$this->style = new Style();
		$this->MySQL = new SGBD();
	}

	function toHTML() {
		echo "<span id='moref' style='display:none'>".$this->moref."</span>";
		$SQL='SELECT 
			vmname,
			vm_guest_os,
			vm_powerstate,
			vm_cpu_num,
			vm_mem_total 
			FROM data_vms WHERE vm_date="'.Settings::$timestamp.'" and vm_moref="'.$this->moref.'"';
		$Rslt = $this->MySQL->TabResSQL($SQL);	
		$os = $Rslt[0]['vm_guest_os'];
		$logo = '<i class="fa fa-desktop fa-fw"></i> '.$os;
		if (preg_match('#windows#i',$os)) {$logo = '<i class="fa fa-windows fa-fw"></i> '.$os;}
		if (preg_match('#linux|ubuntu|debian|centos|bsd|redhat#i',$os)) {$logo = '<i class="fa fa-linux fa-fw"></i> '.$os;}
		if (preg_match('#apple|mac|osx|macos#i',$os)) {$logo = '<i class="fa fa-apple fa-fw"></i> '.$os;}
		echo "<div class='row'>
				<div class='col-lg-1'><h1><i class='fa fa-laptop fa-fw'></i></h1></div>
				<div class='col-lg-10'><h3> ".$Rslt[0]['vmname']."</h3><h6 class='page-subtitle'>".$logo." - (".$Rslt[0]['vm_cpu_num']." vCPU / ".$Rslt[0]['vm_mem_total']."Mo RAM)</h6></div>
				<div class='col-lg-1'>".$Rslt[0]['vm_powerstate']."</div>
			</div>";
		echo "<div class='row'>";
		$this->style->Graph('graph-cpu','col-lg-4',200);
		$this->style->Graph('graph-mem','col-lg-4',200);
		$this->style->Graph('graph-disk','col-lg-4',200);
		echo "</div>";	
		echo "<div class='row'>";
		$this->style->Graph('graph-consommation','col-lg-12');
		echo "</div>";
		echo "<div class='row'>";
		$SQL='SELECT 
			date,
			vm_date as "Date",
			hostname as "Host",
			vm_cpu_num "vCPU",
			vm_cpu_usage as "Usage CPU (Mhz)",
			vm_cpu_total as "Total CPU (Mhz)",
			vm_mem_usage as "Usage Memory (Mo)",
			vm_mem_total as "Total Memory (Mo)"
			FROM ClustersAndHostsAndGuests WHERE vm_moref="'.$this->moref.'" order by vm_date';
		$Resulats = $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resulats,"datelist-stats");
		echo "</div>";
	}
}
?>