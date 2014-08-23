<?php
class Search {
	private $search;
	private $order;
	private $desc;
	private $style;
	private $MySQL;

	function __construct($search,$order = "1",$desc = "desc") {
		$this->search = $search;
		$this->order = $order;
		$this->desc = $desc;
		$this->style = new Style();
		$this->MySQL = new SGBD();
	}
	
	function toHTML() {
		
		echo "<div class='row'><div class='col-lg-12'><h3 class='page-header'><i class='fa fa-search fa-fw'></i>".htmlentities($this->search)."</h3></div></div>";
		$SQL='SELECT DISTINCT cluster_moref,clustername as "Name" FROM  clusters_hosts_vms WHERE clustername like "%'.mysql_real_escape_string($this->search).'%"';
		echo "<div class='row'>";
		$Resultats =  $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,"ref-cluster");
		echo "</div>";	
		$SQL='SELECT DISTINCT moref,hostname as "Name",clustername as "Cluster" FROM  clusters_hosts_vms WHERE hostname like "%'.mysql_real_escape_string($this->search).'%"';
		echo "<span id='moref' style='display:none'>".$this->search."</span>";				
		echo "<div class='row'>";
		$Resultats =  $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,"hostlist-stats");
		echo "</div>";	
		$SQL='SELECT DISTINCT vm_moref,vmname as "Name",hostname as "Host",clustername as "Cluster" FROM  clusters_hosts_vms WHERE vmname like "%'.mysql_real_escape_string($this->search).'%"';
		echo "<span id='moref' style='display:none'>".$this->search."</span>";				
		echo "<div class='row'>";
		$Resultats =  $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,"vmlist-stats");
		echo "</div>";			
	
	
	}
}
?>