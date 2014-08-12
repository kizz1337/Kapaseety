<?php
class Footer {
	
	function _construct() {
	}

	function scripts(){
		echo '
		
		<script src="3rdparty/jquery/jquery-1.11.1.min.js"></script>
		<script src="3rdparty/bootstrap/js/bootstrap.min.js"></script>
		<script src="3rdparty/tablesorter/js/jquery.tablesorter.min.js"></script>
		<script src="3rdparty/tablesorter/js/jquery.tablesorter.widgets.js"></script>
		<script src="http://code.highcharts.com/highcharts.js"></script>
		<script src="http://code.highcharts.com/highcharts-more.js"></script>
		<script src="http://code.highcharts.com/modules/solid-gauge.src.js"></script>
		<script src="js/kapaseety.js"></script>';			
	}
	
	function toHTML() {
	}
}
?>
