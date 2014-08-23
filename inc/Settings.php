<?php

class Settings
{
	static public $sgbd_server;
	static public  $sgbd_user;
	static public  $sgbd_password;
	static public  $sgbd_database;
	static public  $name;
	static public  $logo_path;
	static public $icon_path;
	static public $rp_ratio;
	static public $rp_upper_limit;
	
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

		/// Set TimeZone
		date_default_timezone_set($config->timezone);			
		Settings::$sgbd_server = $config->sgbd_server ;
		Settings::$sgbd_user = $config->sgbd_user ;
		Settings::$sgbd_password = $config->sgbd_password;
		Settings::$sgbd_database = $config->sgbd_database;
		Settings::$name ='KapaSeeTy';
		Settings::$logo_path ='/img/kapaseety.png';
		Settings::$rp_ratio = array("gold" =>4,"silver" =>2,"bronze"=>1);
		Settings::$rp_upper_limit =80000;
		
		
	}
}

?>
