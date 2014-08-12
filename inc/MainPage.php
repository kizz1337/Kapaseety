<?php

class MainPage  extends Header
{
	private $menu;
	private $menubar;
	private $general;
	
	
	function __construct(){
		/// Menu
		$this->menu			=	new Menu();
		/// MenuBar
		$this->menubar 		= 	new Menubar();
		/// Footer
		$this->footer		= new Footer();
		
	}
	
	function toHTML() {
		$this->header();
		
		echo '<body>';
		$this->menubar->toHTML();
		echo '<div class="container-fluid">';
			echo '<div class="row">';
				echo '<div class="col-md-2">';
					$this->menu->toHTML();
				echo '</div>';
				echo '<div id="content" class="col-md-10">';
					$this->stats	= new Stats();
					$this->stats->DataCentDetail('Les clusters');
					//~ $this->stats->ClusDetail('PRODUCTION_01');
					//~ $this->stats->HostDetail('zlv7300i');
					//~ $this->form	= new Form();
					//~ $this->form->toHTML();			
				echo '</div>';		
			echo '</div>';
		echo '</div>';
		$this->footer->scripts();
		echo'</body>';
	}
}

?>