<?php

class Form
{


	
	function __construct(){
	}
	
	function toHTML() {
	echo '
		<form method="post" action="">
		<input type="text" name="nom"/>
		<input type="submit" name="MonSubmit" value="OK"/>
		</form>
	';
	}
}

?>