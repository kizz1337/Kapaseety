<?php
class Footer {
	
	function _construct() {
	}

	function scripts(){
		echo '
		<script src="3rdparty/jquery/jquery-1.11.1.min.js"></script>
		<script src="3rdparty/bootstrap/js/bootstrap.min.js"></script>
		<!-- Metis Menu Plugin JavaScript -->
		<script src="3rdparty/metismenu/js/jquery.metisMenu.min.js"></script>
		<script src="3rdparty/tablesorter/js/jquery.tablesorter.min.js"></script>
		<script src="3rdparty/tablesorter/js/jquery.tablesorter.widgets.js"></script>
		<script src="3rdparty/highcharts/js/highcharts.js"></script>
		<script src="3rdparty/highcharts/js/highcharts-more.js"></script>
		<script src="3rdparty/highcharts/js/modules/solid-gauge.src.js"></script>
		<script src="3rdparty/dataTables/js/dataTables.bootstrap.js"></script>
		<script src="3rdparty/dataTables/js/jquery.dataTables.js"></script>
		<script src="js/kapaseety.js"></script>';			
	}
	
	function toHTML() {
	}
}
?>
