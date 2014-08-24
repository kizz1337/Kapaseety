<?php
class Index
{	
	function __construct(){
		
		/// Initialize variables
		Settings::init();
		$menu = (isset($_GET['m'])? $_GET['m'] : null);
		/// Check what to do
		switch ($menu){
			
			case "cluster":		$page = new ClusterDetail($_GET['moref']);
							break;
			case "host":		$page = new HostDetail($_GET['moref']);
							break;							
			case "vm":		$page = new VmDetail($_GET['moref']);
							break;
			case "vms":		$page = new VmList();
							break;
			case "hosts":		$page = new HostList();
							break;
			case "dashboard":	$page = new Dashboard();
							break;
			case "search":		$page = new Search($_GET['search']);
							break;
			default	:		$page = new Dashboard();
							$menu = "dashboard";
							break;							
		}
		//Display page
		if (!isset($_SERVER['HTTP_REFERER'])) {
			$displaypage = new MainPage();
			$displaypage->content = $page;
			$displaypage->toHTML();
			echo "<script>loadchart_".$menu."();</script>";
		} else {
			$page->toHTML();
		}
	}
}

?>
