<?php
class WS_Stats
{
	function __construct(){
		Settings::init();
		 $this->MySQL = new SGBD();
	}
	
	public function cluster_hist($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_clusters where cluster_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	public function cluster_serie($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from Clusters where cluster_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	
	public function host_hist($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_hosts where moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	public function host_serie($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from Hosts where moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	

	public function vm_hist($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_vms where vm_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	public function vm_serie($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from Vms where vm_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}

}
?>