<?php
class Dashboard {

	private $order;
	private $desc;
	private $style;
	private $MySQL;

	function __construct($order = "1",$desc = "desc") {
		$this->order = $order;
		$this->desc = $desc;
		$this->style = new Style();
		$this->MySQL = new SGBD();
	}

	function toHTML() {
		echo "<div class='row'><div class='col-lg-12'><h3 class='page-header'><i class='fa fa-dashboard fa-fw'></i>Dashboard</h3></div></div>";
		echo "<div class='row'>";
		$this->style->Label('datacenter_vms_total','success','Machines virtuelles','col-lg-6');
		$this->style->Label('datacenter_hosts_total','success','Hyperviseurs','col-lg-6');
		echo "</div>";
		echo "<div class='row'>";
		//~ echo "<div class='row'>";
		//~ self::Graph('graph-consommation','col-lg-12');
		//~ echo "</div>";
		$SQL='SELECT 
			cluster_moref,
			clustername as "Nom",
			cluster_vms_total as "Nombre de VM",
			cluster_mem_total as "Memoire totale (Mo)" ,
			cluster_cpu_total as "CPU totale (Mhz)" 
			FROM clusters order by '.$this->order.' '.$this->desc;
		$Resulats = $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resulats,"dashboard","Les clusters");
		echo "</div>";
	}
}
?>