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
		$SQL='SELECT clustername, count(vmname) as vms_num,sum(vm_mem_total) as mem_total, sum(vm_cpu_num) as vcpu_total FROM clusters_hosts_vms WHERE cluster_moref="'.$this->moref.'"';
		$Rslt = $this->MySQL->TabResSQL($SQL);
		//~ var_dump($Rslt);
		// Memory Resource Pool calculator
		//~ $rp_gold_mem_recommanded = $Rslt[0]['mem_total']*Settings::$rp_ratio_gold;
		//~ $rp_silver_mem_recommanded = $Rslt[0]['mem_total']*Settings::$rp_ratio_silver;
		//~ $rp_bronze_mem_recommanded = $Rslt[0]['mem_total']*Settings::$rp_ratio_bronze;

		// CPU Resource Pool calculator
		//~ $rp_gold_cpu_recommanded = $Rslt[0]['vcpu_total']*Settings::$rp_ratio_gold;
		//~ $rp_silver_cpu_recommanded = $Rslt[0]['vcpu_total']*Settings::$rp_ratio_silver;
		//~ $rp_bronze_cpu_recommanded = $Rslt[0]['vcpu_total']*Settings::$rp_ratio_bronze;
		
		//Resource Pool
		//~ $rp[]= array("Name"=>"<img src='../img/gold.png' width='25px'>","CPU Shares"=>$rp_gold_cpu_recommanded,"MEM Shares"=>$rp_gold_mem_recommanded);	
		//~ $rp[]= array("Name"=>"<img src='../img/silver.png' width='25px'>","CPU Shares"=>$rp_silver_cpu_recommanded,"MEM Shares"=>$rp_silver_mem_recommanded);		
		//~ $rp[]= array("Name"=>"<img src='../img/bronze.png' width='25px'>","CPU Shares"=>$rp_bronze_cpu_recommanded,"MEM Shares"=>$rp_bronze_mem_recommanded);
		

		echo "<div class='row'>
				<div class='col-lg-1'><h1><i class='fa fa-sitemap fa-fw'></i></h1></div>
				<div class='col-lg-11'><h3> ".$Rslt[0]['clustername']."</h3><h6 class='page-subtitle'></h6></div>
			</div>";
		echo "<div class='row'>";
		$this->style->Graph('graph-vm-left','col-lg-4',220);//VM Left
				echo "<div class='col-lg-4'>";
					echo "<div class='row'>";
					$this->style->Graph('graph-ratio-cpu','col-lg-12',105);//Ratio CPU
					$this->style->Graph('graph-ratio-vm','col-lg-12',105); //Ratio VM
					echo "</div>";							
				echo "</div>";			
		$this->style->Graph('graph-ha','col-lg-4',220);	//HA	
		echo "</div>";				
		echo "<div class='row'>";//VM  Buttons List
				echo "<div class='panel-yellow-titletab'>Virtual machines <b>".$Rslt[0]['vms_num']."</b></div>";
				echo "<div class='panel panel-yellow-bodytab vmlist-stats'>";
				echo "<div class='panel-body'>";
				$SQL='SELECT vm_moref,vmname,vm_cpu_usage,vm_mem_usage FROM clusters_hosts_vms WHERE cluster_moref="'.$this->moref.'" order by vmname';
				$RsltVM = $this->MySQL->TabResSQL($SQL);
				foreach ($RsltVM as $value) {
				echo "<button class='btn btn-warning btn-circle' style='margin-left:2px' data-toggle='tooltip' data-placement='top' data-moref='".$value['vm_moref']."' title='Name :".$value['vmname']."\nCPU: ".$value['vm_cpu_usage']."Mhz\nRAM: ".$value['vm_mem_usage']."Mo'><i class='fa fa-laptop'></i></button>";
				}
				echo "</div></div>";
		echo "</div>";		
		echo "<div class='row'>";
		echo "</div>";			
		echo "<div class='row'>";
		$this->style->Graph('graph-consommation','col-lg-8'); //graph Consumed
		$this->style->Graph('graph-disk','col-lg-4',220); //graph Disk
		echo "</div>";	
		echo "<div class='row'>";
			echo "<div class='col-lg-12'>"; //Host  Buttons List
				$SQL='SELECT count(hostname) as hosts_num FROM clusterhosts WHERE moref_cluster="'.$this->moref.'"';
				$Rslt = $this->MySQL->TabResSQL($SQL);
				echo "<div class='panel-primary-titletab'>Hosts <b>".$Rslt[0]['hosts_num']."</b></div>";		
				echo "<div class='panel panel-primary-bodytab hostlist-stats'>";
				echo "<div class='panel-body'>";
				$SQL='SELECT moref,hostname,cpu_usage,mem_usage FROM clusterhosts WHERE moref_cluster="'.$this->moref.'" order by hostname';
				$Rslt = $this->MySQL->TabResSQL($SQL);
				foreach ($Rslt as $value) {
				echo "<button class='btn btn-primary btn-circle' style='margin-left:2px' data-toggle='tooltip' data-placement='top' data-moref='".$value['moref']."' title='Name :".$value['hostname']."\nCPU: ".$value['cpu_usage']."Mhz\nRAM: ".$value['mem_usage']."Mo'><i class='fa fa-building'></i></button>";
				}
				echo "</div></div>";
			echo "</div>";			
		echo "</div>";
		echo "<div class='row'>";
			echo "<div class='col-lg-8'>"; //Ressource Pool
			$SQL='SELECT respool_name as "Name",respool_cpu_reservation as "CPU Reserv.",respool_cpu_limit as "CPU Limit",respool_cpu_expand as "CPU expand" ,respool_cpu_shares as "CPU Shares",respool_mem_reservation as "RAM Reserv." ,respool_mem_limit as "RAM Limit" ,respool_mem_expand as "RAM Expand",respool_mem_shares as "RAM Share"
			FROM clusterresourcepools WHERE respool_name !="Resources" AND cluster_moref="'.$this->moref.'" order by respool_mem_shares desc';
			$Resultats = $this->MySQL->TabResSQL($SQL);
			$this->style->Tableau($Resultats,"respools-stats","Resource Pools",true,"table-simple");
			echo "</div>";	
			echo "<div class='col-lg-4'>"; //Resource Pool Recommandation
			$RPStats = new RPCompute();
			$rp = $RPStats->compute($this->moref);
			$this->style->Tableau($rp,"respools-stats","Recomandations",true,"table-simple");
			echo "</div>";
		echo "</div>";		
		echo "<div class='row'>"; //VM Consummed Historic
			$this->style->Graph('graph-consommation-hist','col-lg-12');
		echo "</div>";		
		echo "<div class='row'>"; //VM Historic
		$this->style->Graph('graph-nombrevm-hist','col-lg-12');
		echo "</div>";
		echo "<div class='row'>"; // Hypervisor Table
		$SQL='SELECT moref,hostname as Host,version as Version ,vm_num as "Vm",datastore_free as "Free space (Go)",datastore_used as "Espace pris"
			FROM hosts WHERE moref_cluster="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		$Resultats = $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,"hostlist-stats",null,false,"table-simple");
		echo "</div>";
		echo "<div class='row'>"; //Statics Table
		$SQL='SELECT 		
			cluster_vms_total as "VM",
			cluster_mem_total as "Memory Total (Mo)" ,
			cluster_cpu_total as "CPU Total (Mhz)" , 
			cluster_vmcpu_average as "CPU average/VM (Mhz)",
			cluster_vmmem_average as "Memoire average/VM (Mo)"
			FROM data_clusters WHERE cluster_moref="'.$this->moref.'" order by '.$this->order.' '.$this->desc;
		$Resultats = $this->MySQL->TabResSQL($SQL);
		$this->style->Tableau($Resultats,null,null,true);
		echo "</div>";	
	}
}
?>