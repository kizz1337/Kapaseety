<?php
class HostList {

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
		echo "<div class='row'><div class='col-lg-12'><h3 class='page-header'><i class='fa fa-laptop fa-fw'></i>Hosts</h3></div></div>";
		echo "<div class='row'>";
		$SQL='SELECT moref,hostname as "Name",version as Version ,vm_num "VM",cpu_total as "CPU (Mhz)",mem_total as "Memory (Mo)" FROM clusterhosts order by '.$this->order.' '.$this->desc;
		$Resultats = $this->MySQL->TabResSQL($SQL);		
		$this->style->Tableau($Resultats,"hostlist-stats","Hosts");
		echo "</div>";	
	
	}
}
?>
