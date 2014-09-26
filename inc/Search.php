<?php
class Search {
	private $search;
	private $style;
	private $MySQL;

	function __construct($search) {
		$this->search = $search;
		$this->style = new Style();
		$this->MySQL = new SGBD();
	}
	
	function toHTML() {
		
		echo "<div class='row'><div class='col-lg-12'><h3 class='page-header'><i class='fa fa-search fa-fw'></i>".htmlentities($this->search)."</h3></div></div>";
		$SQL='SELECT DISTINCT cluster_moref,clustername as "Name" FROM clustersandhostsandguests WHERE cluster_date="'.Settings::$timestamp.'" and clustername like "%'.mysql_real_escape_string($this->search).'%"';
		echo "<div class='row'>";
		$Resultats =  $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,"ref-cluster");
		echo "</div>";	
		$SQL='SELECT DISTINCT moref,hostname as "Name",clustername as "Cluster" FROM  clustersandhostsandguests WHERE date="'.Settings::$timestamp.'" and hostname like "%'.mysql_real_escape_string($this->search).'%"';
		echo "<span id='moref' style='display:none'>".$this->search."</span>";				
		echo "<div class='row'>";
		$Resultats =  $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,"hostlist-stats");
		echo "</div>";	
		$SQL='SELECT DISTINCT vm_moref,vmname as "Name",hostname as "Host",clustername as "Cluster" FROM  clustersandhostsandguests WHERE vm_date="'.Settings::$timestamp.'" and vmname like "%'.mysql_real_escape_string($this->search).'%"';
		echo "<span id='moref' style='display:none'>".$this->search."</span>";				
		echo "<div class='row'>";
		$Resultats =  $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,"vmlist-stats");
		echo "</div>";			
	
	
	}
}
?>