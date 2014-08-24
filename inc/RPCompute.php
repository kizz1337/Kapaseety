<?php
class RPCompute
{

private $MySQL;
public $Moref;
private $RatioRP;
private $Cluster_Stat;
private $UpperLimit;


	function __construct(){
		$this->MySQL = new SGBD();
		$this->RatioRP = Settings::$rp_ratio;
		$this->UpperLimit = Settings::$rp_upper_limit;
	}
	
	function compute($moref) {
		$MinPoolCPUshares = Settings::$MinPoolCPUshares;
		$MinPoolMemshares = Settings::$MinPoolMemshares;
	
		$arrayindex = 0;
		foreach ($this->RatioRP as $key=>$ratio) {
			$SQL='SELECT respool_name as rpname, count(vmname) as vms_num,sum(vm_mem_total) as mem_total, sum(vm_cpu_num) as vcpu_total 
				FROM vmresourcepools WHERE vm_date="'.Settings::$timestamp.'" and respool_moref_cluster="'.$moref.'" and respool_name="'.$key.'" group by respool_name';
				//~ echo $SQL;
			$Cluster_Stat = $this->MySQL->TabResSQL($SQL);
			$name =  strtolower($key);
			$vm_num =0;
			$cpu = 0;
			$mem = 0;
			if (count($Cluster_Stat)) {
				$vm_num = strtolower($Cluster_Stat[0]['vms_num']);
				$cpu = strtolower($Cluster_Stat[0]['vcpu_total']);
				$mem = strtolower($Cluster_Stat[0]['mem_total']);
			}
			
			$ResourcePools[$arrayindex] = $name;
			$PoolCPUShares[$arrayindex] =$ratio*$cpu;
			$PoolMemShares[$arrayindex] =$ratio*$mem;
			$arrayindex += 1;
		}
				
		$MaxMemShares = $PoolMemShares[0];
		for ($i = 0; $i < count($PoolMemShares); $i++) {
			if ($PoolMemShares[$i] > $MaxMemShares){
				$MaxMemShares = $PoolMemShares[$i];
			}
		}

		$MaxCPUShares  = $PoolCPUShares[0];
		for ($i = 0; $i < count($PoolCPUShares); $i++) {
			if ($PoolCPUShares[$i] > $MaxCPUShares){
				$MaxCPUShares = $PoolCPUShares[$i];
			}
		}		

		If ($MaxCPUShares > 0) {
			#Set the highest share to a maximum of $SharesUpperLimit. All other shares will be a proprtional value of $SharesUpperLimit
			$CPUShareMultiplier = $this->UpperLimit  / $MaxCPUShares;
			for ($i=0; $i < count($PoolCPUShares); $i++)
			{
				$PoolCPUShares[$i] = $PoolCPUShares[$i] * $CPUShareMultiplier;
				#If we're below the minimum, readjust
				if ($PoolCPUShares[$i] < $MinPoolCPUshares)  { $PoolCPUShares[$i] = $MinPoolCPUshares;}
			}

		} else {
			#Set it to the minimum specified by the user
			for ($i=0; $i < count($PoolCPUShares); $i++)
			{
				$PoolCPUShares[$i] = $MinPoolCPUshares;
			}
		}	

		If ($MaxMemShares > 0) {
			#Set the highest share to a maximum of $SharesUpperLimit. All other shares will be a proprtional value of $SharesUpperLimit
			$MemShareMultiplier  = $this->UpperLimit  / $MaxMemShares;
			for ($i=0; $i < count($PoolMemShares); $i++)
			{
				$PoolMemShares[$i] = $PoolMemShares[$i] * $MemShareMultiplier;
				#If we're below the minimum, readjust
				if ($PoolMemShares[$i] < $MinPoolMemshares)  { $PoolMemShares[$i] = $MinPoolMemshares;}
			}

		} else {
			#Set it to the minimum specified by the user
			for ($i=0; $i < count($PoolMemShares); $i++)
			{
				$PoolMemShares[$i] = $MinPoolMemshares;
			}
		}
		
		$rps = array();
		for ($i=0; $i < count($ResourcePools); $i++)
			{
				$line = array();
				$line['Name'] = $ResourcePools[$i];
				$line['CPU Share'] = round($PoolCPUShares[$i]);
				$line['MEM Share'] = round($PoolMemShares[$i]);
				$rps[] = $line;
			}
		
		return $rps;
	}
}
?>