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
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from clusters where cluster_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	
	public function host_hist($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_hosts where moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	public function host_serie($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from hosts where moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	

	public function vm_hist($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from data_vms where vm_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	public function vm_serie($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from vms where vm_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	public function vms_total($variables){
		try {
		 return $this->MySQL->ResSQL('select count(vmname) from vms');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
	
	public function hosts_total($variables){
		try {
		 return $this->MySQL->ResSQL('select count(hostname) from hosts');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	
	public function clusters_hosts_vms($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from clusters_hosts_vms where cluster_moref="'.mysql_real_escape_string($variables['moref']).'" or moref="'.mysql_real_escape_string($variables['moref']).'" or vm_moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}	
	public function clusters_hosts($variables){
		try {
		 return $this->MySQL->ResSQL('select '. mysql_real_escape_string($variables['select']).' from clusterhosts where cluster_moref="'.mysql_real_escape_string($variables['moref']).'" or moref="'.mysql_real_escape_string($variables['moref']).'"');
		 } catch (Exception $e) { throw new jsonRPCException($e);}
	}
}
?>