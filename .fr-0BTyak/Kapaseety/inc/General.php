<?php

class General
{

	private $Resulats;
	
	function __construct($clustername){
		$MySQL = new SGBD();
		$this->clustername = $clustername;
		$this->Resulats = $MySQL->TabResSQL('SELECT *,(T1.cpu-T1.cpu_used) as cpu_available,(T1.memory-T1.memory_used)/1024 as memory_available,(T1.memory/1024/1024) as memory_go FROM host as T1 , cluster_to_hosts as T2 , cluster as T3 WHERE T1.id = T2.id_host AND T3.id=T2.id_cluster AND T3.clustername="'.$clustername.'"  ');
	}
	
	function toHTML() {
		//~ print_r($this->Resulats);
		
		
				echo '
			<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">'.$this->clustername.'</div>		
			<!-- Table -->
			<table class="table">
			<thead>
			<tr>
			<th>Hostname</th>
			<th>Cpu Total (Coeurs)</th>
			<th>Cpu Disponible (Coeurs)</th>
			<th>Mémoire Totale (Mo)</th>
			<th>Mémoire disponible (Mo)</th>
			</tr>
			</thead>
			<tbody>';
		
		
		foreach ($this->Resulats as $value) {
			echo '<tr>';
			echo '<td>'.$value['hostname'].'</td>';
			echo '<td>'.$value['cpu'].'</td>';
			echo '<td>'.$value['cpu_available'].'</td>';
			echo '<td>'.$value['memory_go'].'</td>';			
			echo '<td>'.$value['memory_available'].'</td>';			
			echo '</tr>';
		}
		
		echo '
			</tbody>
			</table>
			</div>
		';
	}
}

?>