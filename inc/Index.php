<?php

class Index
{

	
	function __construct(){
		/// Initialize variables
		Settings::init();
		
		/// Check what to do
		switch ($_GET['m']){
			
			case "datacenter":	$page = new Stats();
							$page->DataCentDetail($_GET['name'],$_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							break;
			case "cluster":		$page = new ClusterDetail($_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							$page->toHTML();
							break;
			case "host":		$page = new HostDetail($_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							$page->toHTML();
							break;							
			case "vm":		$page = new VmDetail($_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							$page->toHTML();
							break;
			case "vms":		$page = new Stats();
							$page->VMList($_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							break;
			case "hosts":		$page = new Stats();
							$page->HostList($_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							break;
			case "dashboard":	$page = new Dashboard((isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							$page->toHTML();
							break;							
			default	:		$page = new MainPage();
							$page->toHTML();
							break;							
		}

	}
}

?>
