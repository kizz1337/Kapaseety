<?php
class WS_Stats
{
	private $MySQL;

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
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_clusters where cluster_date="'.$_SESSION['madate'].'" and cluster_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	
	public function host_hist($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_hosts where moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	public function host_serie($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_hosts where date="'.$_SESSION['madate'].'" and moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	

	public function vm_hist($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_vms where vm_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	public function vm_serie($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_vms where vm_date="'.$_SESSION['madate'].'" and vm_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	public function vms_total($variables){
		try {
		 return $this->MySQL->ResSQL('select count(vmname) from data_vms where vm_date="'.$_SESSION['madate'].'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	
	public function hosts_total($variables){
		try {
		 return $this->MySQL->ResSQL('select count(hostname) from data_hosts where date="'.$_SESSION['madate'].'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	
	public function clusters_hosts_vms($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from ClustersAndHostsAndGuests where cluster_date="'.$_SESSION['madate'].'" and  cluster_moref="'.mysql_real_escape_string($variables['moref']).'" or moref="'.mysql_real_escape_string($variables['moref']).'" or vm_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	
	public function clusters_hosts($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from ClustersAndHosts where cluster_date="'.$_SESSION['madate'].'" and cluster_moref="'.mysql_real_escape_string($variables['moref']).'" or moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
}
?>