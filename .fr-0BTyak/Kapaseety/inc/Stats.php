<?php

class Stats extends Index
{
	
	
	function __construct(){
		 $this->MySQL = new SGBD();

	}
	
	function query($sql,$series=false){
		return $this->MySQL->TabResSQL($sql);
	}
	
	function ClusDetail($title,$moref,$order="1",$desc="desc") { //Liste les hyperviseurs

		echo "<span id='moref' style='display:none'>$moref</span>";
		echo "<div class='container-fluid panel panel-default'>";
			echo "<center><h4 class='content_title'>$title</h4></center>";
			echo "<div class='row-fluid'>";
			self::Graph('graph-ratio-cpu','col-md-4',200);
			self::Graph('graph-disk','col-md-4',200);
			self::Graph('graph-ratio-vm','col-md-4',200);
			echo "</div>";
			echo "<div class='row-fluid'>";
			self::Label('vm_left','success','Nombre de VM possible','col-md-4');
			self::Label('vm_total','warning','Nombre de VM','col-md-4');
			self::Label('hosts_total','primary','Nombre d\'hyperviseurs','col-md-4');
			echo "</div>";			
			echo "<div class='row-fluid'>";
			self::Label2('vm_cpu_average','success','CPU moyen','col-md-2');
			self::Label2('vm_mem_average','success','RAM moyenne','col-md-2');	
			self::Label2('','','','col-md-4');	
			self::Label2('cluster_failover_cpu','info','HA CPU','col-md-2');
			self::Label2('cluster_failover_mem','info','HA Memoire','col-md-2');			
			echo "</div>";		
			echo "<div class='row-fluid'>";
			self::Graph('graph-consommation','col-md-12');
			echo "</div>";	
			echo "<div class='row-fluid'>";
			self::Graph('graph-consommation-hist','col-md-12');
			echo "</div>";		
			echo "<div class='row-fluid'>";
			self::Graph('graph-nombrevm-hist','col-md-12');
			echo "</div>";
			echo "<div class='row-fluid'>";
			$SQL='SELECT moref,hostname as Hyperviseur,version as Version ,vm_num "Nombre de vm",datastore_free as "Espace Libre (Go)",datastore_used as "Espace pris"
				FROM Hosts WHERE cluster="'.$title.'" order by '.$order.' '.$desc;
			$this->Resulats = $this->query($SQL);
			$this->classtype = "cluster-stats";
			self::Tableau();
			echo "</div>";
			echo "<div class='row-fluid'>";
			$SQL='SELECT 		
				cluster_vms_total as "Nombre de VM",
				cluster_mem_total as "Memoire totale (Mo)" ,
				cluster_cpu_total as "CPU totale (Mhz)" , 
				cluster_vmcpu_average as "CPU moy./VM (Mhz)",
				cluster_vmmem_average as "Memoire moy./VM (Mo)"
				FROM data_clusters WHERE clustername="'.$title.'" order by '.$order.' '.$desc;
			$this->Resulats = $this->query($SQL);
			$this->link=true;
			$this->classtype = "cluster-stats";
			self::Tableau();
			echo "</div>";	
		echo "</div>";	

	
	}

	function HostList($title,$moref,$order="1",$desc="desc") { //D�tail d'un h�te
		$SQL='SELECT moref,hostname as Hyperviseur,version as Version ,vm_num "Nombre de vm",mem_total as "RAM Total (Mo)",cpu_total as "Puissance CPU (Mhz)" FROM clusterhosts WHERE cluster_moref="'.$moref.'" order by '.$order.' '.$desc;
		$this->Resulats = $this->query($SQL);
		echo "<center><h4 class='content_title'>$title</h4></center>";				
		echo "<span id='moref' style='display:none'>$moref</span>";				
		echo "<div class='row-fluid'>";
		$this->classtype = "hostlist-stats";
		$this->title = "Hyperviseurs";
		self::Tableau();
		echo "</div>";	
	}
	
	function HostDetail($title,$moref,$order="1",$desc="desc") { //D�tail d'un h�te
		echo "<span id='moref' style='display:none'>$moref</span>";
		echo "<div class='container-fluid panel panel-default'>";
			echo "<center><h4 class='content_title'>$title</h4></center>";		
			echo "<div class='row-fluid'>";
			self::Graph('graph-cpu','col-md-4',200);
			self::Graph('graph-mem','col-md-4',200);
			self::Graph('graph-disk','col-md-4',200);
			echo "</div>";	
			echo "<div class='row-fluid'>";
			self::Label('vm_total','success','Nombre de VM','col-md-12');
			echo "</div>";	
			echo "<div class='row-fluid'>";
			self::Label2('version','success','Version ESXi','col-md-4');
			self::Label2('manufacturer','success','Fabricant','col-md-4');
			self::Label2('cluster','success','Cluster','col-md-4');
			echo "</div>";	
			echo "<div class='row-fluid'>";
			self::Graph('graph-consommation','col-md-12');
			echo "</div>";	
			echo "<div class='row-fluid'>";
			$SQL='SELECT 
				vm_num as "Nombre de VM",
				mem_total as "Memoire totale",
				cpu_socket_num as "Nombre des coeurs",
				datastore_free as "Espace libre",
				datastore_total as "Volumetrie totale",
				cpu_usage as "Consommation CPU",
				mem_usage as "Consommation RAM",
				date as "Date"
				FROM data_hosts WHERE hostname="'.$title.'" order by '.$order.' '.$desc;
			$this->Resulats = $this->query($SQL);
			$this->link=true;
			$this->classtype = "host-stats";
			self::Tableau();
		echo "</div>";				
		echo "</div>";	
	}
	
	function VMList($title,$moref,$order="1",$desc="desc") { //D�tail d'un h�te
		$SQL='SELECT vm_moref,vmname as "Nome",vm_cpu_total as "Nombre de CPU",vm_mem_total as "M�moire total (Mo)",vm_cpu_usage as "Usage CPU (Mhz)",vm_mem_usage as "Usage RAM (Mo)",vm_guest_os as "OS" FROM  clusters_hosts_vms WHERE cluster_moref="'.$moref.'" OR moref_host="'.$moref.'" order by '.$order.' '.$desc;
		print_r($sql);
		$this->Resulats = $this->query($SQL);
		echo "<center><h4 class='content_title'>$title</h4></center>";				
		echo "<span id='moref' style='display:none'>$moref</span>";				
		echo "<div class='row-fluid'>";
		$this->classtype = "vmlist-stats";
		self::Tableau();
		echo "</div>";	
	}

	function VMDetail($title,$moref,$order="1",$desc="desc") { //D�tail d'un h�te
		$SQL='SELECT moref,hostname as Hyperviseur,vm_cpu_usage as "CPU Usage (Mhz)",vm_mem_usage as "Memoire Usage (Mo)" FROM VmHosts WHERE vm_moref="'.$moref.'" order by '.$order.' '.$desc;
		$this->Resulats = $this->query($SQL);
		echo "<span id='moref' style='display:none'>$moref</span>";
		echo "<div class='container-fluid panel panel-default'>";
			echo "<center><h4 class='content_title'>$title</h4></center>";				
			echo "<div class='row-fluid'>";
			self::Graph('graph-cpu','col-md-4',200);
			self::Graph('graph-mem','col-md-4',200);
			self::Graph('graph-disk','col-md-4',200);
			echo "</div>";	
			echo "<div class='row-fluid'>";
			self::Label('vm_cpu_num','success','vCPU','col-md-6');
			self::Label('vm_mem_total','success','RAm (Mo)','col-md-6');
			echo "</div>";
			echo "<div class='row-fluid'>";
			self::Label2('vm_guest_os','success','','col-md-6');
			self::Label2('vm_powerstate','success','','col-md-6');		
			echo "</div>";
			echo "<div class='row-fluid'>";
			self::Graph('graph-consommation','col-md-12');
			echo "</div>";
			echo "<div class='row-fluid'>";
			$this->classtype = "host-stats";
			self::Tableau();
		echo "</div>";
		echo "</div>";	
	}


	
	function ClusterList($title,$order="1",$desc="desc") { //Liste les clusters
		echo "<div class='container-fluid panel panel-default'>";	
			echo "<div class='row-fluid'>";
			self::Label('datacenter_vms_total','success','Machines virtuelles','col-md-6');
			self::Label('datacenter_hosts_total','success','Hyperviseurs','col-md-6');
			echo "</div>";
			//~ echo "<div class='row-fluid'>";
			//~ self::Graph('graph-consommation','col-md-12');
			//~ echo "</div>";
		echo "</div>";		
		$SQL='SELECT 
			cluster_moref,
			clustername as "Nom",
			cluster_vms_total as "Nombre de VM",
			cluster_mem_total as "Memoire totale (Mo)" ,
			cluster_cpu_total as "CPU totale (Mhz)" 
			FROM Clusters order by '.$order.' '.$desc;
		$this->Resulats = $this->query($SQL);
		$this->title = $title;
		$this->classtype = "datacenter-stats";
		self::Tableau();
	}	

	function Label($id="myLabel",$type="success",$titre=null,$class=null) {
		echo '<div id="'.$id.'" class="'.$class.' labelinfo" data-href="'.urlencode($titre).'"><center><h1><span class="label label-'.$type.'"></span></h1><h5 style="padding-top: 5px;">'.$titre.'</h5></center></div>';
		//~ echo '<div id="'.$id.'" class="'.$class.' labelinfo" data-href="'.urlencode($titre).'"><center><button type="button" class="btn btn-lg btn-'.$type.'"><span class="badge"></span><br/>'.$titre.'</button></center></div>';
	}

	function Label2($id="myLabel",$type="success",$titre=null,$class=null) {
		echo '<div id="'.$id.'" class="'.$class.' labelinfo" data-href="'.urlencode($titre).'"><center><h3><span class="label label-'.$type.'"></span></h3><h5 style="padding-top: 5px;">'.$titre.'</h5></center></div>';
	}
	
	function Graph($id="myGraph",$class=null,$height=300) {
		echo '<div id="'.$id.'" class="gauge '.$class.'" style="height:'.$height.'px"></div>';
	}

	// Fonction Tableau , prend en argument $this->Resultat , si $this->link vaut TRUE alors crée un lien avec la deuxième colonne en passant en lien 'data-moref' de la premiere colonne.
	function Tableau() {
		echo "
		<div class='cold-md-12' style='float:left;width:100%;'>
		<div class='panel panel-default panel-stats ".$this->classtype."' style='padding-left: 0px; margin: 9px 16px 0px 18px;'>";

		if (isset($this->title)) {echo "<div class='panel-heading'>".htmlentities ($this->title)."</div>";}

		echo "
		<table class='table table-striped tablesorter'>
		<thead>
		<tr>";
		$j=0;
		foreach (array_keys($this->Resulats[0]) as $th) {
			if ($j ==0) {
				if (!$this->link) {
					next();
				} else {
					echo "<th>$th</th>";
				}
			} else {
				echo "<th>$th</th>";
			}
				
		$j++;
		}
		echo '
		</tr>
		</thead>
		<tbody>';
		foreach ($this->Resulats as $value)  {
			echo '<tr>';
			$i=0;
			foreach (array_keys($value) as $index) {
				if ($i ==0) {
					if (!$this->link) {
						$moref=$value[$index];
						next();
						
					} else {
						echo '<td>'.$value[$index].'</td>';
					}
				}  else {
					if ($i==1) {
						if (!$this->link) {	
							echo '<td><a href="#" data-href="'.$value[$index].'" data-moref="'.$moref.'" >'.$value[$index].'</a></td>';
						} else {
							echo '<td>'.$value[$index].'</td>';
						}
					} else {
						echo '<td>'.$value[$index].'</td>';
					}
				}
			$i++;
			}
			echo '</tr>';
		}
		echo '
		</tbody>
		</table>
		</div>
		</div>';
	}	
}

?>