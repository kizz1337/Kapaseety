<?php
class Index
{
	
	function __construct(){
		/// Initialize variables
		Settings::init();
		/// Init date
		if (isset($_GET['madate'])) {
			$_SESSION['madate'] = $_GET['madate'];
		}

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
			case "vms":		$page = new VmList($_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							$page->toHTML();
							break;
			case "hosts":		$page = new HostList($_GET['moref'],( isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							$page->toHTML();
							break;
			case "dashboard":	$page = new Dashboard((isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							$page->toHTML();
							break;
			case "search":		$page = new Search($_GET['search'],(isset($_GET['order']) ? $_GET['order']:1),(isset($_GET['desc']) ? $_GET['desc']:'asc'));
							$page->toHTML();
							break;
			case "c"	:		$page = new RPCompute();
							$page->compute('domain-c138131');
							break;
							
			default	:		$page = new MainPage();
							$page->toHTML();
							break;							
		}

	}
}

?>
