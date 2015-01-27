<?php

class Settings
{
	static public $sgbd_server;
	static public  $sgbd_user;
	static public  $sgbd_password;
	static public  $sgbd_database;
	static public  $name = "KapaSeeTy";
	static public  $logo_path="img/kapaseety.png";
	static public $icon_path;
	static public $rp_ratio;
	static public $rp_upper_limit =80000;
	static public $timestamp;
	static public $MinPoolCPUshares = 100;
	static public $MinPoolMemshares = 100;
	
	function __construct(){
	}
	
	static public function init($config_file=NULL) {
		/// Load config.php file 
		if (!isset($config_file)){
		    $config_file		=	realpath(dirname(__FILE__)."/../config.php");
		}

		if (!include($config_file)){
		
			throw new Exception("You need to create a configuration file.");
		}
		/// Check Timestamp for all pages
		if (isset($_GET['madate'])) { 
			Settings::$timestamp = $_GET['madate'];
			setcookie("timestamp",$_GET['madate']);
		} elseif (isset($_COOKIE['timestamp'])) {
			Settings::$timestamp = $_COOKIE['timestamp'];
		}
		/// Set TimeZone
		date_default_timezone_set($config->timezone);			
		Settings::$sgbd_server = $config->sgbd_server ;
		Settings::$sgbd_user = $config->sgbd_user ;
		Settings::$sgbd_password = $config->sgbd_password;
		Settings::$sgbd_database = $config->sgbd_database;
		//~ Settings::$name ='KapaSeeTy';
		//~ Settings::$logo_path ='/img/kapaseety.png';
		Settings::$rp_ratio = array("gold" =>4,"silver" =>2,"bronze"=>1);
		//~ Settings::$rp_upper_limit =80000;
	}
	
	function toHTML() {
		echo '<div class="row">
		<form role="form">
		  <div class="form-group">
		    <label for="name">Site Name</label>
		    <input type="text" class="form-control" id="name" placeholder="Enter site name" value="'.Settings::$name.'"/>
		  </div>
		  <div class="form-group">
		    <label for="logo_path">Path of logo</label>
		    <input type="text" class="form-control" id="logo_path" placeholder="Enter logo path" value="'.Settings::$logo_path.'"/>
		  </div>
		  <div class="form-group">
		    <label for="rp_upper_limit">Resource Pool Max</label>
		    <input type="text" class="form-control" id="rp_upper_limit" placeholder="Upper  maximum limit" value="'.Settings::$rp_upper_limit.'"/>
		  </div>		  
		  <button type="submit" class="btn btn-default">Submit</button>
		</form>
			</div>';
	}
}

?>
