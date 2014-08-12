<?php

class SGBD

{

private 
      $Lien        = '',
      $Debug     = true,
      $NbRequetes  = 0;
	
	function __construct(){
	      $this->Lien=mysql_connect(Settings::$sgbd_server, Settings::$sgbd_user,  Settings::$sgbd_password);
	      if(!$this->Lien && $this->Debug)
		throw new exception('Erreur de connexion au serveur MySql!!!');
	      $Base = mysql_select_db(Settings::$sgbd_database,$this->Lien);
	      if (!$Base && $this->Debug)
		throw new exception('Erreur de connexion � la base de donnees!!!');
	}
	
	/**
	* Retourne le nombre de requ�tes SQL effectu� par l'objet
	*/
	public function RetourneNbRequetes()
	{
		return $this->NbRequetes;
	}
	/**
	* Envoie une requ�te SQL et r�cup�re le r�sult�t dans un tableau pr� format�
	*
	* $Requete = Requ�te SQL
	*/
	public function TabResSQL($Requete)
	{
		$i = 0;
		$Ressource = mysql_query($Requete,$this->Lien);
		$TabResultat=array();
		if (!$Ressource and $this->Debug) throw new exception('Erreur de requ�te SQL!!!');
		while ($Ligne = mysql_fetch_assoc($Ressource))
		{
			foreach ($Ligne as $clef => $valeur) $TabResultat[$i][$clef] = $valeur;
			$i++;
		}
		mysql_free_result($Ressource);
		$this->NbRequetes++;
		return $TabResultat;
	}
	
	/**
	* Envoie une requ�te SQL et r�cup�re le r�sult�t dans un tableau pr� format json
	*
	* $Requete = Requ�te SQL
	*/
	public function ResSQL($Requete)
	{
		$i = 0;
		$Ressource = mysql_query($Requete,$this->Lien);
		//~ print_r(json_encode(mysql_fetch_assoc($Ressource)));
		if (!$Ressource and $this->Debug) throw new exception('Erreur de requ�te SQL!!!');
		while ($Ligne = mysql_fetch_assoc($Ressource))
		{
			$tableau =array();
			foreach ($Ligne as $key=>$valeur) {
				$tableau[] = $valeur;
			}
			 $TabResultat[] = $tableau;
		}
		mysql_free_result($Ressource);
		$this->NbRequetes++;
		return $TabResultat;
	}	
	
	/**
	* Retourne le dernier identifiant g�n�r� par un champ de type AUTO_INCREMENT
	*
	*/
	public function DernierId()
	{
		return mysql_insert_id($this->Lien);
	}
	/**
	* Envoie une requ�te SQL et retourne le nombre de table affect�
	*
	* $Requete = Requ�te SQL
	*/
	public function ExecuteSQL($Requete)
	{
	$Ressource = mysql_query($Requete,$this->Lien);
	if (!$Ressource and $this->Debug) throw new exception('Erreur de requ�te SQL!!!');
	$this->NbRequetes++;
	$NbAffectee = mysql_affected_rows();
	return $NbAffectee;
	}
}

?>