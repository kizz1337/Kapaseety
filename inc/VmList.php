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
		$SQL='SELECT clustername FROM  clusters_hosts_vms WHERE cluster_moref="'.$this->moref.'"';
		$Rslt =  $this->MySQL->TabResSQL($SQL);
		$select_view = $Rslt[0]['clustername'];
		
		$SQL='SELECT clustername,hostname FROM  clusters_hosts_vms WHERE cluster_moref="'.$this->moref.'" OR moref_host="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		$Resulats =  $this->MySQL->TabResSQL($SQL);
		$clustername = $Resulats[0]['clustername'];
		if ($select_view !='') {
				$title = "<i class='fa fa-sitemap fa-fw'></i> Cluster : ".$clustername;
				$SQL='SELECT vm_moref,vmname as "Nome",vm_cpu_total as "Nombre de CPU",vm_mem_total as "Memoire total (Mo)",vm_cpu_usage as "Usage CPU (Mhz)",vm_mem_usage as "Usage RAM (Mo)",vm_guest_os as "OS",hostname as "Hyperviseur" FROM  clusters_hosts_vms WHERE cluster_moref="'.$this->moref.'" OR moref_host="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		}
		$hostname = $Resulats[0]['hostname'];
		if ($select_view =='') {
				$title = "<i class='fa fa-building fa-fw'></i> Hyperviseur : ".$hostname;
				$SQL='SELECT vm_moref,vmname as "Name",vm_cpu_num as "Cores",vm_cpu_total as "Comptute (Mhz)",vm_mem_total as "Memory (Mo)",vm_cpu_usage as "CPU Usage (Mhz)",vm_mem_usage as "Memory Usage (Mo)",vm_guest_os as "OS",clustername as "Cluster" FROM  clusters_hosts_vms WHERE cluster_moref="'.$this->moref.'" OR moref_host="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		}		
		echo "<div class='row'><div class='col-lg-12'><h3 class='page-header'><i class='fa fa-laptop fa-fw'></i>Virtuals Machines</h3></div></div>";
		echo "<span id='moref' style='display:none'>".$this->moref."</span>";				
		echo "<div class='row'>";
		$Resultats =  $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,"vmlist-stats");
		echo "</div>";	
	
	}
}
?>
