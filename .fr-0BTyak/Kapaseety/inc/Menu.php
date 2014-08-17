<?php

class Menu implements HTMLObject
{

	
	
	function __construct(){
		 $this->MySQL = new SGBD();

	}
	
	function query($sql){
		//~ print_r($sql);
		return $this->MySQL->TabResSQL($sql);
	}
	
	function toHTML() {
		echo '
			<div class="panel-group" id="accordion">
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
				  Les Clusters
				</a>
			      </h4>
			    </div>
			    <div id="collapseOne" class="panel-collapse collapse in datacenter-stats">
			      <div class="panel-body">
			      <ul class="nav nav-pills nav-stacked">';
					$SQL='select distinct clustername,cluster_moref from Clusters';
					$this->Resulats = $this->query($SQL);
					foreach ($this->Resulats as $value)  {
						echo "<li><a href='javascript:void();' data-moref='".$value['cluster_moref']."' data-href='".$value['clustername']."'>".$value['clustername']."</li>";
					}

		echo'     </ul>
			      </div>
			    </div>
			  </div>
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
				  Les Hyperviseurs
				</a>
			      </h4>
			    </div>
			    <div id="collapseTwo" class="panel-collapse collapse cluster-stats">
			      <div class="panel-body">
			      <ul class="nav nav-pills nav-stacked">';
					$SQL='select distinct hostname,moref from Hosts';
					$this->Resulats = $this->query($SQL);
					foreach ($this->Resulats as $value)  {
						echo "<li><a href='javascript:void();' data-moref='".$value['moref']."' data-href='".$value['hostname']."'>".$value['hostname']."</li>";
					}

		echo'     </ul>			      
			      </div>
			    </div>
			  </div>
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
				  Les Datastores
				</a>
			      </h4>
			    </div>
			    <div id="collapseThree" class="panel-collapse collapse">
			      <div class="panel-body">
			      </div>
			    </div>
			  </div>
		</div>
		';
	}
}

?>