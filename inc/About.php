<?php
/**
 * This file implements the About page.
 * 
 * @author    Cédric Levasseur <cedric.levasseur@ipocus.net>
 * @copyright 2014 Cédric Levasseur
 * @license   http://www.gnu.org/licenses/
 * @link      http://github.com/cyr-ius/Kapaseety
 */
class About {
	function __contruct(){

	}
	
	function toHTML() {
		echo '
			<div id="about" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" style="max-width:601px">
					<div class="modal-content panel panel-info">
					        <div class="modal-header" style="background-color:#428bca;margin:3px;">
						<button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
						<h5 id="myLargeModalLabel" class="modal-title">KapaSeeTy v1.2 License GPL V3 -  C.Levasseur, August 2014</h5>
						</div>
						<div class="modal-body">
						<iframe src="LICENSE" height="300px" width="571px"></iframe> 
						</div>
					</div>
				</div>
			</div>
		
		
'		;
	}
}
?>