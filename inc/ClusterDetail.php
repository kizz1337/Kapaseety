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
		echo "<div class='row'>
				<div class='col-lg-1'><h1><i class='fa fa-sitemap fa-fw'></i></h1></div>
				<div class='col-lg-11'><h3> ".$Rslt[0]['clustername']."</h3><h6 class='page-subtitle'></h6></div>
			</div>";
		echo "<div class='row'>";
		$this->style->Graph('graph-vm-left','col-lg-4',220);
				echo "<div class='col-lg-4'>";
					echo "<div class='row'>";
					$this->style->Graph('graph-ratio-cpu','col-lg-12',105);
					$this->style->Graph('graph-ratio-vm','col-lg-12',105);
					echo "</div>";							
				echo "</div>";			
		$this->style->Graph('graph-ha','col-lg-4',220);		
		echo "</div>";				
		echo "<div class='row'>";
				echo "<div class='panel panel-yellow vmlist-stats' style='margin: 9px 18px;'>";
				echo "<div class='panel-body'>";
				$SQL='SELECT vm_moref,vmname,vm_cpu_usage,vm_mem_usage FROM clusters_hosts_vms WHERE cluster_moref="'.$this->moref.'" order by vmname';
				$Rslt = $this->MySQL->TabResSQL($SQL);
				foreach ($Rslt as $value) {
				echo "<button class='btn btn-warning btn-circle' style='margin-left:2px' data-toggle='tooltip' data-placement='top' data-moref='".$value['vm_moref']."' title='Name :".$value['vmname']."\nCPU: ".$value['vm_cpu_usage']."%\nRAM: ".$value['vm_mem_usage']."Mo'><i class='fa fa-laptop'></i></button>";
				}
				echo "</div></div>";
		echo "</div>";		
		echo "<div class='row'>";
		echo "</div>";			
		echo "<div class='row'>";
		$this->style->Graph('graph-consommation','col-lg-8');
		$this->style->Graph('graph-disk','col-lg-4',220);
		echo "</div>";	
		echo "<div class='row'>";
				echo "<div class='panel panel-primary hostlist-stats' style='margin: 9px 18px;'>";
				echo "<div class='panel-body'>";
				$SQL='SELECT moref,hostname,cpu_usage,mem_usage FROM clusters_hosts_vms WHERE cluster_moref="'.$this->moref.'" order by vmname';
				$Rslt = $this->MySQL->TabResSQL($SQL);
				foreach ($Rslt as $value) {
				echo "<button class='btn btn-primary btn-circle' style='margin-left:2px' data-toggle='tooltip' data-placement='top' data-moref='".$value['moref']."' title='Name :".$value['hostname']."\nCPU: ".$value['cpu_usage']."%\nRAM: ".$value['mem_usage']."Mo'><i class='fa fa-building'></i></button>";
				}
				echo "</div></div>";
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