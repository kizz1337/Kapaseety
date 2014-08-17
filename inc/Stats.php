<?php

class Stats extends Index
{
	
	private $MySQL;
	private $Resultat;
	private $link;

	function __construct(){
		 $this->MySQL = new SGBD();
	}
	
	function query($sql,$series=false){
		return $this->MySQL->TabResSQL($sql);
	}

	function HostList($moref,$order="1",$desc="desc") { //D�tail d'un h�te
		$SQL='SELECT clustername FROM clusterhosts WHERE cluster_moref="'.$moref.'" order by '.$order.' '.$desc;
		$this->Resulats = $this->query($SQL);	
		$clustername = $this->Resulats[0]['clustername'];
		echo "<div class='row'><div class='col-lg-12'><h3 class='page-header'><i class='fa fa-building fa-fw'></i>Liste des hyperviseurs</h3></div></div>";
		echo "<span id='moref' style='display:none'>$moref</span>";				
		echo "<div class='row'>";
		$SQL='SELECT moref,hostname as Hyperviseur,version as Version ,vm_num "Nombre de vm",mem_total as "RAM Total (Mo)",cpu_total as "Puissance CPU (Mhz)" FROM clusterhosts WHERE cluster_moref="'.$moref.'" order by '.$order.' '.$desc;
		$this->Resulats = $this->query($SQL);		
		$this->classtype = "hostlist-stats";
		$this->title = "<i class='fa fa-sitemap fa-fw'></i> Cluster : ".$clustername;
		self::Tableau();
		echo "</div>";	
	}
	
	function VMList($moref,$order="1",$desc="desc") { //D�tail d'un h�te
		$SQL='SELECT clustername FROM  clusters_hosts_vms WHERE cluster_moref="'.$moref.'"';
		$this->Resulats = $this->query($SQL);
		$select_view = $this->Resulats[0]['clustername'];
		
		$SQL='SELECT clustername,hostname FROM  clusters_hosts_vms WHERE cluster_moref="'.$moref.'" OR moref_host="'.$moref.'" order by '.$order.' '.$desc;
		$this->Resulats = $this->query($SQL);
		$clustername = $this->Resulats[0]['clustername'];
		if ($select_view !='') {
				$this->title = "<i class='fa fa-sitemap fa-fw'></i> Cluster : ".$clustername;
				$SQL='SELECT vm_moref,vmname as "Nome",vm_cpu_total as "Nombre de CPU",vm_mem_total as "Memoire total (Mo)",vm_cpu_usage as "Usage CPU (Mhz)",vm_mem_usage as "Usage RAM (Mo)",vm_guest_os as "OS",hostname as "Hyperviseur" FROM  clusters_hosts_vms WHERE cluster_moref="'.$moref.'" OR moref_host="'.$moref.'" order by '.$order.' '.$desc;
		}
		$hostname = $this->Resulats[0]['hostname'];
		if ($select_view =='') {
				$this->title = "<i class='fa fa-building fa-fw'></i> Hyperviseur : ".$hostname;
				$SQL='SELECT vm_moref,vmname as "Nome",vm_cpu_total as "Nombre de CPU",vm_mem_total as "Memoire total (Mo)",vm_cpu_usage as "Usage CPU (Mhz)",vm_mem_usage as "Usage RAM (Mo)",vm_guest_os as "OS",clustername as "Cluster" FROM  clusters_hosts_vms WHERE cluster_moref="'.$moref.'" OR moref_host="'.$moref.'" order by '.$order.' '.$desc;
		}		
		echo "<div class='row'><div class='col-lg-12'><h3 class='page-header'><i class='fa fa-laptop fa-fw'></i>Liste des machines virtuelles</h3></div></div>";
		echo "<span id='moref' style='display:none'>$moref</span>";				
		echo "<div class='row'>";
		$this->Resulats = $this->query($SQL);		
		$this->classtype = "vmlist-stats";
		self::Tableau();
		echo "</div>";	
	}

	function VMDetail($moref,$order="1",$desc="desc") { //D�tail d'un h�te

		echo "<span id='moref' style='display:none'>$moref</span>";
		$SQL='SELECT vmname,vm_guest_os,vm_powerstate,vm_cpu_num,vm_mem_total FROM vms WHERE vm_moref="'.$moref.'"';
		$this->Rslt = $this->query($SQL);	
		$os = $this->Rslt[0]['vm_guest_os'];
		$logo = '<i class="fa fa-desktop fa-fw"></i> '.$os;
		if (preg_match('#windows#i',$os)) {$logo = '<i class="fa fa-windows fa-fw"></i> '.$os;}
		if (preg_match('#linux|ubuntu|debian|centos|bsd|redhat#i',$os)) {$logo = '<i class="fa fa-linux fa-fw"></i> '.$os;}
		if (preg_match('#apple|mac|osx|macos#i',$os)) {$logo = '<i class="fa fa-apple fa-fw"></i> '.$os;}
		echo "<div class='row'>
				<div class='col-lg-1'><h1><i class='fa fa-laptop fa-fw'></i></h1></div>
				<div class='col-lg-10'><h3> ".$this->Rslt[0]['vmname']."</h3><h6 class='page-subtitle'>".$logo." - (".$this->Rslt[0]['vm_cpu_num']." vCPU / ".$this->Rslt[0]['vm_mem_total']."Mo RAM)</h6></div>
				<div class='col-lg-1'>".$this->Rslt[0]['vm_powerstate']."</div>
			</div>";
		echo "<div class='row'>";
		self::Graph('graph-cpu','col-lg-4',200);
		self::Graph('graph-mem','col-lg-4',200);
		self::Graph('graph-disk','col-lg-4',200);
		echo "</div>";	
		echo "<div class='row'>";
		self::Graph('graph-consommation','col-lg-12');
		echo "</div>";
		echo "<div class='row'>";
		$SQL='SELECT moref,hostname as Hyperviseur,vm_cpu_usage as "CPU Usage (Mhz)",vm_mem_usage as "Memoire Usage (Mo)" FROM vmhosts WHERE vm_moref="'.$moref.'" order by '.$order.' '.$desc;
		$this->Resulats = $this->query($SQL);
		$this->classtype = "host-stats";
		self::Tableau();
		echo "</div>";
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
		<div class='cold-lg-12' style='float:left;width:100%;'>
		<div class='panel panel-default panel-stats ".$this->classtype."' style='padding-left: 0px; margin: 9px 16px 0px 18px;'>";

		if (isset($this->title)) {echo "<div class='panel-heading'>".$this->title."</div>";}

		echo "
		<table class='table table-striped tablesorter'>
		<thead>
		<tr>";
		$j=0;
		$thead = array_keys($this->Resulats[0]);
		foreach ($thead as $th) {
			if ($j ==0) {
				if (!$this->link) {
					next($thead);
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
			$tr = array_keys($value);
			foreach ($tr as $index) {
				if ($i ==0) {
					if (!$this->link) {
						$moref=$value[$index];
						next($tr);
						
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