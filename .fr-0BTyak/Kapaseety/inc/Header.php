<?php
abstract class Header implements HTMLObject
{
	public function header($head_content=NULL){
		echo "<!DOCTYPE html>\n";
		echo "<html lang='fr'>";
		echo "<head>\n";
		echo "<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>\n";
                echo "<meta name='viewport' content='width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;'/>";
		echo "<title>".Settings::$name."</title>\n";
		echo "<link rel='icon' type='image/ico' href='".Settings::$icon_path."'>";
		/// CSS
		echo "<link rel='stylesheet' href='3rdparty/normalize/normalize.css' type='text/css' media='screen' charset='utf-8'>";
		echo "<link rel='stylesheet' href='3rdparty/bootstrap/css/bootstrap.min.css'>";		
		echo "<link rel='stylesheet' href='3rdparty/tablesorter/css/theme.bootstrap.css'>";		
		echo "<link rel='stylesheet' href='css/kapaseety.css'>";
		echo "<noscript><style>.noscript_hidden { display: none; }</style></noscript>";
		echo "</head>";	
	}
}
?>
