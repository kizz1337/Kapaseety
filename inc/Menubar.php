<?php

class Menubar implements HTMLObject
{

	private $menu;
	private $MySQL;
	
	function __construct(){
		$this->menu = new Menu();
                $this->MySQL = new SGBD();
	}
	
	function toHTML() {
        
	echo '
        <nav  id="topmenu" class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               <a class="navbar-brand" data-toggle="modal" data-target="#about" href="#"><img src="'.Settings::$logo_path.'" height="40px" width="120px" style="margin-top:-10px"> '.Settings::$name.'</a>
            </div>
            <!-- /.navbar-header -->

            <form class="navbar-form navbar-right" role="datalist">
                <div class="form-group">
                    <select id="madate" class="form-control">';
                        $SQL = "select distinct cluster_date as madate from data_clusters order by cluster_date desc";
			$DateRslt = $this->MySQL->TabResSQL($SQL);
                        Settings::$timestamp = $DateRslt[0]['madate'];
                       setcookie("timestamp", $DateRslt[0]['madate']);
                        foreach ($DateRslt as $key=>$value) {
                            echo "<option>".$value['madate']."</option>";
                        }
                echo '</select>
                </div>
            </form>
            <ul class="nav navbar-top-links navbar-right">';
                $SQL = "select DISTINCT LEAST(cluster_vmcpu_left,cluster_vmmem_left) as vm_left,clustername,cluster_moref from data_clusters where  cluster_date='".Settings::$timestamp." and (cluster_vmmem_left < 10 or cluster_vmcpu_left <10)' order by cluster_date desc";
		$AlertRslt = $this->MySQL->TabResSQL($SQL);
                if  (count($AlertRslt) > 0) {
    echo '
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">';
                        foreach ($AlertRslt as $key=>$value) {
                              echo'  <li>
                                    <a class="item" href="#" data-href="cluster" data-moref="'.$value['cluster_moref'].'">
                                        <div>
                                            <i class="fa fa-comment fa-fw"></i> '.$value['clustername'].'
                                            <span class="pull-right text-muted small">Cluster is full , left '.$value['vm_left'].' vm</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>';
                        }
                    echo '
                        <li>
                            <a class="text-center item" href="#" data-href="dashboard">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>';
                }
    echo '
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a class="item" href="#" data-href="settings"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
	';
	$this->menu->toHTML();
  echo "</nav>";
	}
}

?>