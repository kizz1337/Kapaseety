<?php

class Settings
{
	static public $sgbd_server;
	static public  $sgbd_user;
	static public  $sgbd_password;
	static public  $sgbd_database;
	static public  $name;
	static public  $icon_path;
	static public $debug = true;
	
	
	function __construct(){

	}
	
	function init() {
		Settings::$sgbd_server = 'localhost';
		Settings::$sgbd_user = 'kapaseety';
		Settings::$sgbd_password = 'kapaseety';
		Settings::$sgbd_database = 'kapaseety';
		Settings::$name ='KapaSeeTy';
		Settings::$icon_path ='icon.ico';
	}
}

?>
