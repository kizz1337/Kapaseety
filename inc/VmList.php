<?php
class VmList {

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
		echo "<div class='row'><div class='col-lg-12'><h3 class='page-header'><i class='fa fa-laptop fa-fw'></i>Virtuals Machines</h3></div></div>";
		echo "<div class='row'>";
		$SQL='SELECT vm_moref,vmname as "Name",vm_cpu_num as "Cores",vm_cpu_total as "Comptute (Mhz)",vm_mem_total as "Memory (Mo)",vm_cpu_usage as "CPU Usage (Mhz)",vm_mem_usage as "Memory Usage (Mo)",vm_guest_os as "OS",clustername as "Cluster" FROM  clusters_hosts_vms  order by '.$this->order.' '.$this->desc;			
		$Resultats =  $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,"vmlist-stats");
		echo "</div>";	
	
	}
}
?>
