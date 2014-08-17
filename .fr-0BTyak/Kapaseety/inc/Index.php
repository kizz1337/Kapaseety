<?php

class Index
{
	static public $MySQL;
	
	function __construct(){
		/// Initialize variables
		Settings::init();
		$MySQL = new SGBD();
		
		/// Check what to do
		switch ($_GET['m']){
			
			case "datacenter":	$page = new Stats();
							$page->DataCentDetail($_GET['name'],$_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							break;
			case "cluster":		$page = new Stats();
							$page->ClusDetail($_GET['name'],$_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							break;
			case "host":		$page = new Stats();
							$page->HostDetail($_GET['name'],$_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							break;							
			case "vm":			$page = new Stats();
							$page->VMDetail($_GET['name'],$_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							break;
			case "vms":		$page = new Stats();
							$page->VMList($_GET['name'],$_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							break;
			case "hosts":		$page = new Stats();
							$page->HostList($_GET['name'],$_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							break;
			case "clusters" :		$page = new Stats();
							$page->ClusterList('Les clusters');
							break;
			default	:		$page = new MainPage();
							$page->toHTML();
							break;							
		}

	}
}

?>
