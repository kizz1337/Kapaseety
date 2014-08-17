<?php
class ClusterDetail {

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
		$SQL='SELECT clustername FROM clusters WHERE cluster_moref="'.$this->moref.'"';
		$Rslt = $this->MySQL->TabResSQL($SQL);	
		echo "<div class='row'><div class='col-lg-12'><h3 class='page-header'><i class='fa fa-sitemap fa-fw'></i>".$Rslt[0]['clustername']."</h3></div></div>";
		echo "<div class='row'>";
		$this->style->Graph('graph-ratio-cpu','col-lg-4',200);
		$this->style->Graph('graph-disk','col-lg-4',200);
		$this->style->Graph('graph-ratio-vm','col-lg-4',200);
		echo "</div>";
		echo "<div class='row'>";
		$this->style->Label('vm_left','success','Nombre de VM possible','col-lg-4');
		$this->style->Label('vms_total','warning','Nombre de VM','col-lg-4');
		$this->style->Label('hosts_total','primary','Nombre d\'hyperviseurs','col-lg-4');
		echo "</div>";			
		echo "<div class='row'>";
		$this->style->Label2('vm_cpu_average','success','CPU moyen','col-lg-2');
		$this->style->Label2('vm_mem_average','success','RAM moyenne','col-lg-2');	
		$this->style->Label2('','','','col-lg-4');	
		$this->style->Label2('cluster_failover_cpu','info','HA CPU','col-lg-2');
		$this->style->Label2('cluster_failover_mem','info','HA Memoire','col-lg-2');			
		echo "</div>";		
		echo "<div class='row'>";
		$this->style->Graph('graph-consommation','col-lg-12');
		echo "</div>";	
		echo "<div class='row'>";
		$this->style->Graph('graph-consommation-hist','col-lg-12');
		echo "</div>";		
		echo "<div class='row'>";
		$this->style->Graph('graph-nombrevm-hist','col-lg-12');
		echo "</div>";
		echo "<div class='row'>";
		print "// --> Correction necessaire , ajouter cluster_moref dans table data_hosts";
		//~ $SQL='SELECT moref,hostname as Hyperviseur,version as Version ,vm_num "Nombre de vm",datastore_free as "Espace Libre (Go)",datastore_used as "Espace pris"
			//~ FROM hosts WHERE cluster_moref="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		//~ $Resulats = $this->MySQL->TabResSQL($SQL);
		//~ $this->style->Tableau($Resulats,"cluster-stats");
		echo "</div>";
		echo "<div class='row'>";
		$SQL='SELECT 		
			cluster_vms_total as "Nombre de VM",
			cluster_mem_total as "Memoire totale (Mo)" ,
			cluster_cpu_total as "CPU totale (Mhz)" , 
			cluster_vmcpu_average as "CPU moy./VM (Mhz)",
			cluster_vmmem_average as "Memoire moy./VM (Mo)"
			FROM data_clusters WHERE cluster_moref="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		$Resulats = $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resulats,"cluster-stats",null,true);
		echo "</div>";	
	}
}
?>