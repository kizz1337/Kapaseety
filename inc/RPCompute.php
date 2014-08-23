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
		$MinPoolCPUshares = 100;
		$MinPoolMemShare = 100;
	
		$arrayindex = 0;
		foreach ($this->RatioRP as $key=>$ratio) {
		$SQL='SELECT respool_name as rpname, count(vmname) as vms_num,sum(vm_mem_total) as mem_total, sum(vm_cpu_num) as vcpu_total 
			FROM vmresourcepools 	WHERE respool_moref_cluster="'.$moref.'" and respool_name="'.$key.'" group by respool_name';
		$Cluster_Stat = $this->MySQL->TabResSQL($SQL);
				
		$name =  strtolower($Cluster_Stat[0]['rpname']);
		$vm_num = strtolower($Cluster_Stat[0]['vms_num']);
		$cpu = strtolower($Cluster_Stat[0]['vcpu_total']);
		$mem = strtolower($Cluster_Stat[0]['mem_total']);
		//~ echo $name.'-'.$vm_num.'-'.$ratio*$cpu.'-'.$ratio*$mem.'<br/>';
		$ResourcePools[$arrayindex] = $name;
		$PoolCPUShares[$arrayindex] =$ratio*$cpu;
		$PoolMemShares[$arrayindex] =$ratio*$mem;
		
		//~ echo "Discovered ".$cpu." running vCPUs in resource pool ".$key.'<br/>';
		//~ echo "Discovered ".$vm_num." running virtual machines in resource pool ".$key.'<br/>';
		//~ echo $mem." MB of memory allocated in resource pool".'<br/>';
		//~ echo $ratio." shares of memory allocated in resource pool".'<br/>';
		//~ echo $PoolCPUShares[$arrayindex] ."-".$PoolMemShares[$arrayindex].'<br/>';
		$arrayindex += 1;
		
		}
		
		//~ var_dump($PoolCPUShares);
		//~ var_dump($PoolMemShares);
		//~ var_dump($ResourcePools);
		$MaxMemShares = $PoolMemShares[0];
		for ($i = 0; $i < count($PoolMemShares); $i++) {
			if ($PoolMemShares[$i] > $MaxMemShares){
				$MaxMemShares = $PoolMemShares[$i];
			}
		}
		//~ var_dump($MaxMemShares);

		$MaxCPUShares  = $PoolCPUShares[0];
		for ($i = 0; $i < count($PoolCPUShares); $i++) {
			if ($PoolCPUShares[$i] > $MaxCPUShares){
				$MaxCPUShares = $PoolCPUShares[$i];
			}
		}		
		//~ var_dump($MaxCPUShares);
		If ($MaxCPUShares > 0) {
			#Set the highest share to a maximum of $SharesUpperLimit. All other shares will be a proprtional value of $SharesUpperLimit
			$CPUShareMultiplier = $this->UpperLimit  / $MaxCPUShares;
			//~ echo $CPUShareMultiplier;
			for ($i=0; $i < count($PoolCPUShares); $i++)
			{
				$PoolCPUShares[$i] = $PoolCPUShares[$i] * $CPUShareMultiplier;
				#If we're below the minimum, readjust
				if ($PoolCPUShares[$i] < $MinPoolCPUshares)  { $PoolCPUShares[$i] = $MinPoolCPUshares;}
				//~ echo "Resource Pool ".$ResourcePools[$i]." : ".$PoolCPUShares[$i]." CPU shares<br/>";
			}

		} else {
			//~ echo "Warning: No running VMs found within cluster or CPU shares have been defined as 0 (zero)";
			#Set it to the minimum specified by the user
			for ($i=0; $i < count($PoolCPUShares); $i++)
			{
				$PoolCPUShares[$i] = $MinPoolCPUshares;
				//~ echo "Resource Pool ".$ResourcePools[$i]." : ".$PoolCPUShares[$i]." CPU shares<br/>";
			}
		}	

		If ($MaxMemShares > 0) {
			#Set the highest share to a maximum of $SharesUpperLimit. All other shares will be a proprtional value of $SharesUpperLimit
			$MemShareMultiplier  = $this->UpperLimit  / $MaxMemShares;
			//~ echo $MemShareMultiplier;
			for ($i=0; $i < count($PoolMemShares); $i++)
			{
				$PoolMemShares[$i] = $PoolMemShares[$i] * $MemShareMultiplier;
				#If we're below the minimum, readjust
				if ($PoolMemShares[$i] < $MinPoolMemshares)  { $PoolMemShares[$i] = $MinPoolMemshares;}
				//~ echo "Resource Pool ".$ResourcePools[$i]." : ".$PoolMemShares[$i]." MEM shares<br/>";
			}

		} else {
			//~ echo "Warning: No running VMs found within cluster or MEM shares have been defined as 0 (zero)";
			#Set it to the minimum specified by the user
			for ($i=0; $i < count($PoolMemShares); $i++)
			{
				$PoolMemShares[$i] = $MinPoolMemshares;
				//~ echo "Resource Pool ".$ResourcePools[$i]." : ".$PoolMemShares[$i]." MEM shares<br/>";
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