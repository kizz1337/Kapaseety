<?php

class SGBD {

private 
      $Lien        = '',
      $NbRequetes  = 0;
	
	function __construct(){
	      $this->Lien=mysql_connect(Settings::$sgbd_server, Settings::$sgbd_user,  Settings::$sgbd_password);
	      if(!$this->Lien)
		throw new exception('Erreur de connexion au serveur MySql!!!');
	      $Base = mysql_select_db(Settings::$sgbd_database,$this->Lien);
	      if (!$Base)
		throw new exception('Erreur de connexion à la base de donnees!!!');
	}
	
	/**
	* Retourne le nombre de requêtes SQL effectué par l'objet
	*/
	public function RetourneNbRequetes()
	{
		return $this->NbRequetes;
	}
	/**
	* Envoie une requête SQL et récupère le résultât dans un tableau pré formaté
	*
	* $Requete = Requête SQL
	*/
	public function TabResSQL($Requete)
	{
		$i = 0;
		$Ressource = mysql_query($Requete,$this->Lien);
		$TabResultat=array();
		//~ print_r($Requete);
		if (!$Ressource) throw new exception('Erreur de requête SQL!!!');
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
	* Envoie une requête SQL et récupère le résultât dans un tableau pré format json
	*
	* $Requete = Requête SQL
	*/
	public function ResSQL($Requete)
	{
		$i = 0;
		$Ressource = mysql_query($Requete,$this->Lien);
		$num_rows = mysql_num_rows($Ressource);
		if (!$Ressource) throw new exception('Erreur de requête SQL!!!');
		while ($Ligne = mysql_fetch_assoc($Ressource))
		{
			if ($num_rows >1) {
				$tableau =array();
				foreach ($Ligne as $key=>$valeur) {
					$tableau[] = $valeur;
				}
				$TabResultat[] = $tableau;
			} else {
				foreach ($Ligne as $key=>$valeur) {
					$TabResultat[] = $valeur;
				}
			}

		}
		mysql_free_result($Ressource);
		$this->NbRequetes++;
		return $TabResultat;
	}	
	
	/**
	* Retourne le dernier identifiant généré par un champ de type AUTO_INCREMENT
	*
	*/
	public function DernierId()
	{
		return mysql_insert_id($this->Lien);
	}
	/**
	* Envoie une requête SQL et retourne le nombre de table affecté
	*
	* $Requete = Requête SQL
	*/
	public function ExecuteSQL($Requete)
	{
	$Ressource = mysql_query($Requete,$this->Lien);
	if (!$Ressource) throw new exception('Erreur de requête SQL!!!');
	$this->NbRequetes++;
	$NbAffectee = mysql_affected_rows();
	return $NbAffectee;
	}
}

?>
