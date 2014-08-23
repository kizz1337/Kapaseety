-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Sam 23 Août 2014 à 19:14
-- Version du serveur :  5.5.38-0ubuntu0.12.04.1
-- Version de PHP :  5.3.10-1ubuntu3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `kapaseety`
--
CREATE DATABASE IF NOT EXISTS `kapaseety` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `kapaseety`;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `clusterresourcepools`
--
DROP VIEW IF EXISTS `clusterresourcepools`;
CREATE TABLE IF NOT EXISTS `clusterresourcepools` (
`cluster_moref` varchar(50)
,`clustername` varchar(50)
,`cluster_hosts_total` int(10)
,`cluster_vms_total` int(10)
,`cluster_failover_cpu` int(10)
,`cluster_cpu_total` int(10)
,`cluster_cpu_realcapacity` int(10)
,`cluster_cpu_usage` int(10)
,`cluster_failover_mem` int(10)
,`cluster_mem_usage` int(10)
,`cluster_mem_realcapacity` int(10)
,`cluster_mem_total` int(10)
,`cluster_vmcpu_average` int(10)
,`cluster_vmmem_average` int(10)
,`cluster_vmcpu_left` int(10)
,`cluster_vmmem_left` int(10)
,`cluster_vcpu_ratio` int(10)
,`cluster_vmhost_ratio` int(10)
,`cluster_datastore_total` int(10)
,`cluster_datastore_free` int(10)
,`cluster_datastore_used` int(10)
,`cluster_date` date
,`respool_moref` varchar(50)
,`respool_name` varchar(50)
,`respool_moref_cluster` varchar(50)
,`respool_cpu_reservation` int(10)
,`respool_cpu_limit` int(10)
,`respool_cpu_expand` varchar(50)
,`respool_cpu_shares` int(10)
,`respool_mem_reservation` int(10)
,`respool_mem_limit` int(10)
,`respool_mem_expand` varchar(50)
,`respool_mem_shares` int(10)
,`respool_id` int(11)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `clusters`
--
DROP VIEW IF EXISTS `clusters`;
CREATE TABLE IF NOT EXISTS `clusters` (
`cluster_moref` varchar(50)
,`clustername` varchar(50)
,`cluster_hosts_total` int(10)
,`cluster_vms_total` int(10)
,`cluster_failover_cpu` int(10)
,`cluster_cpu_total` int(10)
,`cluster_cpu_realcapacity` int(10)
,`cluster_cpu_usage` int(10)
,`cluster_failover_mem` int(10)
,`cluster_mem_usage` int(10)
,`cluster_mem_realcapacity` int(10)
,`cluster_mem_total` int(10)
,`cluster_vmcpu_average` int(10)
,`cluster_vmmem_average` int(10)
,`cluster_vmcpu_left` int(10)
,`cluster_vmmem_left` int(10)
,`cluster_vcpu_ratio` int(10)
,`cluster_vmhost_ratio` int(10)
,`cluster_datastore_total` int(10)
,`cluster_datastore_free` int(10)
,`cluster_datastore_used` int(10)
,`cluster_date` date
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `ClustersAndHosts`
--
DROP VIEW IF EXISTS `ClustersAndHosts`;
CREATE TABLE IF NOT EXISTS `ClustersAndHosts` (
`cluster_moref` varchar(50)
,`clustername` varchar(50)
,`cluster_hosts_total` int(10)
,`cluster_vms_total` int(10)
,`cluster_failover_cpu` int(10)
,`cluster_cpu_total` int(10)
,`cluster_cpu_realcapacity` int(10)
,`cluster_cpu_usage` int(10)
,`cluster_failover_mem` int(10)
,`cluster_mem_usage` int(10)
,`cluster_mem_realcapacity` int(10)
,`cluster_mem_total` int(10)
,`cluster_vmcpu_average` int(10)
,`cluster_vmmem_average` int(10)
,`cluster_vmcpu_left` int(10)
,`cluster_vmmem_left` int(10)
,`cluster_vcpu_ratio` int(10)
,`cluster_vmhost_ratio` int(10)
,`cluster_datastore_total` int(10)
,`cluster_datastore_free` int(10)
,`cluster_datastore_used` int(10)
,`cluster_date` date
,`cluster_id` int(11)
,`moref` varchar(50)
,`hostname` varchar(50)
,`vm_num` int(10)
,`version` varchar(50)
,`manufacturer` varchar(50)
,`model` varchar(50)
,`mem_total` int(10)
,`cpu_socket_num` int(10)
,`cpu_total` int(10)
,`cpu_numcores` int(10)
,`cpu_num` int(10)
,`datastore_free` int(10)
,`datastore_used` int(10)
,`datastore_total` int(10)
,`cpu_usage` int(10)
,`mem_usage` int(10)
,`date` date
,`host_id` int(11)
,`moref_cluster` varchar(50)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `ClustersAndHostsAndGuests`
--
DROP VIEW IF EXISTS `ClustersAndHostsAndGuests`;
CREATE TABLE IF NOT EXISTS `ClustersAndHostsAndGuests` (
`cluster_moref` varchar(50)
,`clustername` varchar(50)
,`cluster_hosts_total` int(10)
,`cluster_vms_total` int(10)
,`cluster_failover_cpu` int(10)
,`cluster_cpu_total` int(10)
,`cluster_cpu_realcapacity` int(10)
,`cluster_cpu_usage` int(10)
,`cluster_failover_mem` int(10)
,`cluster_mem_usage` int(10)
,`cluster_mem_realcapacity` int(10)
,`cluster_mem_total` int(10)
,`cluster_vmcpu_average` int(10)
,`cluster_vmmem_average` int(10)
,`cluster_vmcpu_left` int(10)
,`cluster_vmmem_left` int(10)
,`cluster_vcpu_ratio` int(10)
,`cluster_vmhost_ratio` int(10)
,`cluster_datastore_total` int(10)
,`cluster_datastore_free` int(10)
,`cluster_datastore_used` int(10)
,`cluster_date` date
,`cluster_id` int(11)
,`moref` varchar(50)
,`hostname` varchar(50)
,`vm_num` int(10)
,`version` varchar(50)
,`manufacturer` varchar(50)
,`model` varchar(50)
,`mem_total` int(10)
,`cpu_socket_num` int(10)
,`cpu_total` int(10)
,`cpu_numcores` int(10)
,`cpu_num` int(10)
,`datastore_free` int(10)
,`datastore_used` int(10)
,`datastore_total` int(10)
,`cpu_usage` int(10)
,`mem_usage` int(10)
,`date` date
,`host_id` int(11)
,`moref_cluster` varchar(50)
,`vm_moref` varchar(50)
,`vmname` varchar(50)
,`moref_host` varchar(50)
,`vm_cpu_total` int(10)
,`vm_cpu_usage` int(10)
,`vm_cpu_num` int(10)
,`vm_mem_total` int(10)
,`vm_mem_usage` int(10)
,`vm_powerstate` int(10)
,`vm_guest_os` varchar(100)
,`vm_date` date
,`vm_id` int(11)
,`vm_moref_resourcepool` varchar(50)
);
-- --------------------------------------------------------

--
-- Structure de la table `data_clusters`
--

DROP TABLE IF EXISTS `data_clusters`;
CREATE TABLE IF NOT EXISTS `data_clusters` (
  `cluster_moref` varchar(50) NOT NULL,
  `clustername` varchar(50) DEFAULT NULL,
  `cluster_hosts_total` int(10) DEFAULT NULL,
  `cluster_vms_total` int(10) DEFAULT NULL,
  `cluster_failover_cpu` int(10) DEFAULT NULL,
  `cluster_cpu_total` int(10) DEFAULT NULL,
  `cluster_cpu_realcapacity` int(10) DEFAULT NULL,
  `cluster_cpu_usage` int(10) DEFAULT NULL,
  `cluster_failover_mem` int(10) DEFAULT NULL,
  `cluster_mem_usage` int(10) DEFAULT NULL,
  `cluster_mem_realcapacity` int(10) DEFAULT NULL,
  `cluster_mem_total` int(10) DEFAULT NULL,
  `cluster_vmcpu_average` int(10) DEFAULT NULL,
  `cluster_vmmem_average` int(10) DEFAULT NULL,
  `cluster_vmcpu_left` int(10) DEFAULT NULL,
  `cluster_vmmem_left` int(10) DEFAULT NULL,
  `cluster_vcpu_ratio` int(10) DEFAULT NULL,
  `cluster_vmhost_ratio` int(10) DEFAULT NULL,
  `cluster_datastore_total` int(10) DEFAULT NULL,
  `cluster_datastore_free` int(10) DEFAULT NULL,
  `cluster_datastore_used` int(10) DEFAULT NULL,
  `cluster_date` date DEFAULT NULL,
`cluster_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `data_hosts`
--

DROP TABLE IF EXISTS `data_hosts`;
CREATE TABLE IF NOT EXISTS `data_hosts` (
  `moref` varchar(50) NOT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `vm_num` int(10) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mem_total` int(10) DEFAULT NULL,
  `cpu_socket_num` int(10) DEFAULT NULL,
  `cpu_total` int(10) DEFAULT NULL,
  `cpu_numcores` int(10) DEFAULT NULL,
  `cpu_num` int(10) DEFAULT NULL,
  `datastore_free` int(10) DEFAULT NULL,
  `datastore_used` int(10) DEFAULT NULL,
  `datastore_total` int(10) DEFAULT NULL,
  `cpu_usage` int(10) DEFAULT NULL,
  `mem_usage` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
`host_id` int(11) NOT NULL,
  `moref_cluster` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=603 ;

-- --------------------------------------------------------

--
-- Structure de la table `data_respools`
--

DROP TABLE IF EXISTS `data_respools`;
CREATE TABLE IF NOT EXISTS `data_respools` (
  `respool_moref` varchar(50) DEFAULT NULL,
  `respool_name` varchar(50) DEFAULT NULL,
  `respool_moref_cluster` varchar(50) DEFAULT NULL,
  `respool_cpu_reservation` int(10) DEFAULT NULL,
  `respool_cpu_limit` int(10) DEFAULT NULL,
  `respool_cpu_expand` varchar(50) DEFAULT NULL,
  `respool_cpu_shares` int(10) DEFAULT NULL,
  `respool_mem_reservation` int(10) DEFAULT NULL,
  `respool_mem_limit` int(10) DEFAULT NULL,
  `respool_mem_expand` varchar(50) DEFAULT NULL,
  `respool_mem_shares` int(10) DEFAULT NULL,
`respool_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=398 ;

-- --------------------------------------------------------

--
-- Structure de la table `data_vms`
--

DROP TABLE IF EXISTS `data_vms`;
CREATE TABLE IF NOT EXISTS `data_vms` (
  `vm_moref` varchar(50) NOT NULL,
  `vmname` varchar(50) DEFAULT NULL,
  `moref_host` varchar(50) NOT NULL,
  `vm_cpu_total` int(10) DEFAULT NULL,
  `vm_cpu_usage` int(10) DEFAULT NULL,
  `vm_cpu_num` int(10) DEFAULT NULL,
  `vm_mem_total` int(10) DEFAULT NULL,
  `vm_mem_usage` int(10) DEFAULT NULL,
  `vm_powerstate` int(10) DEFAULT NULL,
  `vm_guest_os` varchar(100) DEFAULT NULL,
  `vm_date` date DEFAULT NULL,
`vm_id` int(11) NOT NULL,
  `vm_moref_resourcepool` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10728 ;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `GuestsAndHosts`
--
DROP VIEW IF EXISTS `GuestsAndHosts`;
CREATE TABLE IF NOT EXISTS `GuestsAndHosts` (
`moref` varchar(50)
,`hostname` varchar(50)
,`vm_num` int(10)
,`version` varchar(50)
,`manufacturer` varchar(50)
,`model` varchar(50)
,`mem_total` int(10)
,`cpu_socket_num` int(10)
,`cpu_total` int(10)
,`cpu_numcores` int(10)
,`cpu_num` int(10)
,`datastore_free` int(10)
,`datastore_used` int(10)
,`datastore_total` int(10)
,`cpu_usage` int(10)
,`mem_usage` int(10)
,`date` date
,`host_id` int(11)
,`moref_cluster` varchar(50)
,`vm_moref` varchar(50)
,`vmname` varchar(50)
,`moref_host` varchar(50)
,`vm_cpu_total` int(10)
,`vm_cpu_usage` int(10)
,`vm_cpu_num` int(10)
,`vm_mem_total` int(10)
,`vm_mem_usage` int(10)
,`vm_powerstate` int(10)
,`vm_guest_os` varchar(100)
,`vm_date` date
,`vm_id` int(11)
,`vm_moref_resourcepool` varchar(50)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `hosts`
--
DROP VIEW IF EXISTS `hosts`;
CREATE TABLE IF NOT EXISTS `hosts` (
`moref` varchar(50)
,`hostname` varchar(50)
,`vm_num` int(10)
,`version` varchar(50)
,`manufacturer` varchar(50)
,`model` varchar(50)
,`mem_total` int(10)
,`cpu_socket_num` int(10)
,`cpu_total` int(10)
,`cpu_numcores` int(10)
,`cpu_num` int(10)
,`datastore_free` int(10)
,`datastore_used` int(10)
,`datastore_total` int(10)
,`cpu_usage` int(10)
,`mem_usage` int(10)
,`date` date
,`host_id` int(11)
,`moref_cluster` varchar(50)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vmresourcepools`
--
DROP VIEW IF EXISTS `vmresourcepools`;
CREATE TABLE IF NOT EXISTS `vmresourcepools` (
);
-- --------------------------------------------------------

--
-- Structure de la vue `clusterresourcepools`
--
DROP TABLE IF EXISTS `clusterresourcepools`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clusterresourcepools` AS select `clusters`.`cluster_moref` AS `cluster_moref`,`clusters`.`clustername` AS `clustername`,`clusters`.`cluster_hosts_total` AS `cluster_hosts_total`,`clusters`.`cluster_vms_total` AS `cluster_vms_total`,`clusters`.`cluster_failover_cpu` AS `cluster_failover_cpu`,`clusters`.`cluster_cpu_total` AS `cluster_cpu_total`,`clusters`.`cluster_cpu_realcapacity` AS `cluster_cpu_realcapacity`,`clusters`.`cluster_cpu_usage` AS `cluster_cpu_usage`,`clusters`.`cluster_failover_mem` AS `cluster_failover_mem`,`clusters`.`cluster_mem_usage` AS `cluster_mem_usage`,`clusters`.`cluster_mem_realcapacity` AS `cluster_mem_realcapacity`,`clusters`.`cluster_mem_total` AS `cluster_mem_total`,`clusters`.`cluster_vmcpu_average` AS `cluster_vmcpu_average`,`clusters`.`cluster_vmmem_average` AS `cluster_vmmem_average`,`clusters`.`cluster_vmcpu_left` AS `cluster_vmcpu_left`,`clusters`.`cluster_vmmem_left` AS `cluster_vmmem_left`,`clusters`.`cluster_vcpu_ratio` AS `cluster_vcpu_ratio`,`clusters`.`cluster_vmhost_ratio` AS `cluster_vmhost_ratio`,`clusters`.`cluster_datastore_total` AS `cluster_datastore_total`,`clusters`.`cluster_datastore_free` AS `cluster_datastore_free`,`clusters`.`cluster_datastore_used` AS `cluster_datastore_used`,`clusters`.`cluster_date` AS `cluster_date`,`data_respools`.`respool_moref` AS `respool_moref`,`data_respools`.`respool_name` AS `respool_name`,`data_respools`.`respool_moref_cluster` AS `respool_moref_cluster`,`data_respools`.`respool_cpu_reservation` AS `respool_cpu_reservation`,`data_respools`.`respool_cpu_limit` AS `respool_cpu_limit`,`data_respools`.`respool_cpu_expand` AS `respool_cpu_expand`,`data_respools`.`respool_cpu_shares` AS `respool_cpu_shares`,`data_respools`.`respool_mem_reservation` AS `respool_mem_reservation`,`data_respools`.`respool_mem_limit` AS `respool_mem_limit`,`data_respools`.`respool_mem_expand` AS `respool_mem_expand`,`data_respools`.`respool_mem_shares` AS `respool_mem_shares`,`data_respools`.`respool_id` AS `respool_id` from (`clusters` left join `data_respools` on((`clusters`.`cluster_moref` = convert(`data_respools`.`respool_moref_cluster` using utf8))));

-- --------------------------------------------------------

--
-- Structure de la vue `clusters`
--
DROP TABLE IF EXISTS `clusters`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clusters` AS select `data_clusters`.`cluster_moref` AS `cluster_moref`,`data_clusters`.`clustername` AS `clustername`,`data_clusters`.`cluster_hosts_total` AS `cluster_hosts_total`,`data_clusters`.`cluster_vms_total` AS `cluster_vms_total`,`data_clusters`.`cluster_failover_cpu` AS `cluster_failover_cpu`,`data_clusters`.`cluster_cpu_total` AS `cluster_cpu_total`,`data_clusters`.`cluster_cpu_realcapacity` AS `cluster_cpu_realcapacity`,`data_clusters`.`cluster_cpu_usage` AS `cluster_cpu_usage`,`data_clusters`.`cluster_failover_mem` AS `cluster_failover_mem`,`data_clusters`.`cluster_mem_usage` AS `cluster_mem_usage`,`data_clusters`.`cluster_mem_realcapacity` AS `cluster_mem_realcapacity`,`data_clusters`.`cluster_mem_total` AS `cluster_mem_total`,`data_clusters`.`cluster_vmcpu_average` AS `cluster_vmcpu_average`,`data_clusters`.`cluster_vmmem_average` AS `cluster_vmmem_average`,`data_clusters`.`cluster_vmcpu_left` AS `cluster_vmcpu_left`,`data_clusters`.`cluster_vmmem_left` AS `cluster_vmmem_left`,`data_clusters`.`cluster_vcpu_ratio` AS `cluster_vcpu_ratio`,`data_clusters`.`cluster_vmhost_ratio` AS `cluster_vmhost_ratio`,`data_clusters`.`cluster_datastore_total` AS `cluster_datastore_total`,`data_clusters`.`cluster_datastore_free` AS `cluster_datastore_free`,`data_clusters`.`cluster_datastore_used` AS `cluster_datastore_used`,`data_clusters`.`cluster_date` AS `cluster_date` from `data_clusters` where (`data_clusters`.`cluster_date` = (select max(`data_clusters`.`cluster_date`) from `data_clusters`));

-- --------------------------------------------------------

--
-- Structure de la vue `ClustersAndHosts`
--
DROP TABLE IF EXISTS `ClustersAndHosts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ClustersAndHosts` AS select `data_clusters`.`cluster_moref` AS `cluster_moref`,`data_clusters`.`clustername` AS `clustername`,`data_clusters`.`cluster_hosts_total` AS `cluster_hosts_total`,`data_clusters`.`cluster_vms_total` AS `cluster_vms_total`,`data_clusters`.`cluster_failover_cpu` AS `cluster_failover_cpu`,`data_clusters`.`cluster_cpu_total` AS `cluster_cpu_total`,`data_clusters`.`cluster_cpu_realcapacity` AS `cluster_cpu_realcapacity`,`data_clusters`.`cluster_cpu_usage` AS `cluster_cpu_usage`,`data_clusters`.`cluster_failover_mem` AS `cluster_failover_mem`,`data_clusters`.`cluster_mem_usage` AS `cluster_mem_usage`,`data_clusters`.`cluster_mem_realcapacity` AS `cluster_mem_realcapacity`,`data_clusters`.`cluster_mem_total` AS `cluster_mem_total`,`data_clusters`.`cluster_vmcpu_average` AS `cluster_vmcpu_average`,`data_clusters`.`cluster_vmmem_average` AS `cluster_vmmem_average`,`data_clusters`.`cluster_vmcpu_left` AS `cluster_vmcpu_left`,`data_clusters`.`cluster_vmmem_left` AS `cluster_vmmem_left`,`data_clusters`.`cluster_vcpu_ratio` AS `cluster_vcpu_ratio`,`data_clusters`.`cluster_vmhost_ratio` AS `cluster_vmhost_ratio`,`data_clusters`.`cluster_datastore_total` AS `cluster_datastore_total`,`data_clusters`.`cluster_datastore_free` AS `cluster_datastore_free`,`data_clusters`.`cluster_datastore_used` AS `cluster_datastore_used`,`data_clusters`.`cluster_date` AS `cluster_date`,`data_clusters`.`cluster_id` AS `cluster_id`,`data_hosts`.`moref` AS `moref`,`data_hosts`.`hostname` AS `hostname`,`data_hosts`.`vm_num` AS `vm_num`,`data_hosts`.`version` AS `version`,`data_hosts`.`manufacturer` AS `manufacturer`,`data_hosts`.`model` AS `model`,`data_hosts`.`mem_total` AS `mem_total`,`data_hosts`.`cpu_socket_num` AS `cpu_socket_num`,`data_hosts`.`cpu_total` AS `cpu_total`,`data_hosts`.`cpu_numcores` AS `cpu_numcores`,`data_hosts`.`cpu_num` AS `cpu_num`,`data_hosts`.`datastore_free` AS `datastore_free`,`data_hosts`.`datastore_used` AS `datastore_used`,`data_hosts`.`datastore_total` AS `datastore_total`,`data_hosts`.`cpu_usage` AS `cpu_usage`,`data_hosts`.`mem_usage` AS `mem_usage`,`data_hosts`.`date` AS `date`,`data_hosts`.`host_id` AS `host_id`,`data_hosts`.`moref_cluster` AS `moref_cluster` from (`data_clusters` left join `data_hosts` on(((`data_clusters`.`cluster_date` = `data_hosts`.`date`) and (`data_clusters`.`cluster_moref` = `data_hosts`.`moref_cluster`))));

-- --------------------------------------------------------

--
-- Structure de la vue `ClustersAndHostsAndGuests`
--
DROP TABLE IF EXISTS `ClustersAndHostsAndGuests`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ClustersAndHostsAndGuests` AS select `data_clusters`.`cluster_moref` AS `cluster_moref`,`data_clusters`.`clustername` AS `clustername`,`data_clusters`.`cluster_hosts_total` AS `cluster_hosts_total`,`data_clusters`.`cluster_vms_total` AS `cluster_vms_total`,`data_clusters`.`cluster_failover_cpu` AS `cluster_failover_cpu`,`data_clusters`.`cluster_cpu_total` AS `cluster_cpu_total`,`data_clusters`.`cluster_cpu_realcapacity` AS `cluster_cpu_realcapacity`,`data_clusters`.`cluster_cpu_usage` AS `cluster_cpu_usage`,`data_clusters`.`cluster_failover_mem` AS `cluster_failover_mem`,`data_clusters`.`cluster_mem_usage` AS `cluster_mem_usage`,`data_clusters`.`cluster_mem_realcapacity` AS `cluster_mem_realcapacity`,`data_clusters`.`cluster_mem_total` AS `cluster_mem_total`,`data_clusters`.`cluster_vmcpu_average` AS `cluster_vmcpu_average`,`data_clusters`.`cluster_vmmem_average` AS `cluster_vmmem_average`,`data_clusters`.`cluster_vmcpu_left` AS `cluster_vmcpu_left`,`data_clusters`.`cluster_vmmem_left` AS `cluster_vmmem_left`,`data_clusters`.`cluster_vcpu_ratio` AS `cluster_vcpu_ratio`,`data_clusters`.`cluster_vmhost_ratio` AS `cluster_vmhost_ratio`,`data_clusters`.`cluster_datastore_total` AS `cluster_datastore_total`,`data_clusters`.`cluster_datastore_free` AS `cluster_datastore_free`,`data_clusters`.`cluster_datastore_used` AS `cluster_datastore_used`,`data_clusters`.`cluster_date` AS `cluster_date`,`data_clusters`.`cluster_id` AS `cluster_id`,`GuestsAndHosts`.`moref` AS `moref`,`GuestsAndHosts`.`hostname` AS `hostname`,`GuestsAndHosts`.`vm_num` AS `vm_num`,`GuestsAndHosts`.`version` AS `version`,`GuestsAndHosts`.`manufacturer` AS `manufacturer`,`GuestsAndHosts`.`model` AS `model`,`GuestsAndHosts`.`mem_total` AS `mem_total`,`GuestsAndHosts`.`cpu_socket_num` AS `cpu_socket_num`,`GuestsAndHosts`.`cpu_total` AS `cpu_total`,`GuestsAndHosts`.`cpu_numcores` AS `cpu_numcores`,`GuestsAndHosts`.`cpu_num` AS `cpu_num`,`GuestsAndHosts`.`datastore_free` AS `datastore_free`,`GuestsAndHosts`.`datastore_used` AS `datastore_used`,`GuestsAndHosts`.`datastore_total` AS `datastore_total`,`GuestsAndHosts`.`cpu_usage` AS `cpu_usage`,`GuestsAndHosts`.`mem_usage` AS `mem_usage`,`GuestsAndHosts`.`date` AS `date`,`GuestsAndHosts`.`host_id` AS `host_id`,`GuestsAndHosts`.`moref_cluster` AS `moref_cluster`,`GuestsAndHosts`.`vm_moref` AS `vm_moref`,`GuestsAndHosts`.`vmname` AS `vmname`,`GuestsAndHosts`.`moref_host` AS `moref_host`,`GuestsAndHosts`.`vm_cpu_total` AS `vm_cpu_total`,`GuestsAndHosts`.`vm_cpu_usage` AS `vm_cpu_usage`,`GuestsAndHosts`.`vm_cpu_num` AS `vm_cpu_num`,`GuestsAndHosts`.`vm_mem_total` AS `vm_mem_total`,`GuestsAndHosts`.`vm_mem_usage` AS `vm_mem_usage`,`GuestsAndHosts`.`vm_powerstate` AS `vm_powerstate`,`GuestsAndHosts`.`vm_guest_os` AS `vm_guest_os`,`GuestsAndHosts`.`vm_date` AS `vm_date`,`GuestsAndHosts`.`vm_id` AS `vm_id`,`GuestsAndHosts`.`vm_moref_resourcepool` AS `vm_moref_resourcepool` from (`data_clusters` left join `GuestsAndHosts` on(((`data_clusters`.`cluster_date` = `GuestsAndHosts`.`date`) and (`data_clusters`.`cluster_moref` = `GuestsAndHosts`.`moref_cluster`))));

-- --------------------------------------------------------

--
-- Structure de la vue `GuestsAndHosts`
--
DROP TABLE IF EXISTS `GuestsAndHosts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `GuestsAndHosts` AS select `data_hosts`.`moref` AS `moref`,`data_hosts`.`hostname` AS `hostname`,`data_hosts`.`vm_num` AS `vm_num`,`data_hosts`.`version` AS `version`,`data_hosts`.`manufacturer` AS `manufacturer`,`data_hosts`.`model` AS `model`,`data_hosts`.`mem_total` AS `mem_total`,`data_hosts`.`cpu_socket_num` AS `cpu_socket_num`,`data_hosts`.`cpu_total` AS `cpu_total`,`data_hosts`.`cpu_numcores` AS `cpu_numcores`,`data_hosts`.`cpu_num` AS `cpu_num`,`data_hosts`.`datastore_free` AS `datastore_free`,`data_hosts`.`datastore_used` AS `datastore_used`,`data_hosts`.`datastore_total` AS `datastore_total`,`data_hosts`.`cpu_usage` AS `cpu_usage`,`data_hosts`.`mem_usage` AS `mem_usage`,`data_hosts`.`date` AS `date`,`data_hosts`.`host_id` AS `host_id`,`data_hosts`.`moref_cluster` AS `moref_cluster`,`data_vms`.`vm_moref` AS `vm_moref`,`data_vms`.`vmname` AS `vmname`,`data_vms`.`moref_host` AS `moref_host`,`data_vms`.`vm_cpu_total` AS `vm_cpu_total`,`data_vms`.`vm_cpu_usage` AS `vm_cpu_usage`,`data_vms`.`vm_cpu_num` AS `vm_cpu_num`,`data_vms`.`vm_mem_total` AS `vm_mem_total`,`data_vms`.`vm_mem_usage` AS `vm_mem_usage`,`data_vms`.`vm_powerstate` AS `vm_powerstate`,`data_vms`.`vm_guest_os` AS `vm_guest_os`,`data_vms`.`vm_date` AS `vm_date`,`data_vms`.`vm_id` AS `vm_id`,`data_vms`.`vm_moref_resourcepool` AS `vm_moref_resourcepool` from (`data_hosts` left join `data_vms` on(((`data_hosts`.`date` = `data_vms`.`vm_date`) and (`data_hosts`.`moref` = `data_vms`.`moref_host`))));

-- --------------------------------------------------------

--
-- Structure de la vue `hosts`
--
DROP TABLE IF EXISTS `hosts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hosts` AS select `data_hosts`.`moref` AS `moref`,`data_hosts`.`hostname` AS `hostname`,`data_hosts`.`vm_num` AS `vm_num`,`data_hosts`.`version` AS `version`,`data_hosts`.`manufacturer` AS `manufacturer`,`data_hosts`.`model` AS `model`,`data_hosts`.`mem_total` AS `mem_total`,`data_hosts`.`cpu_socket_num` AS `cpu_socket_num`,`data_hosts`.`cpu_total` AS `cpu_total`,`data_hosts`.`cpu_numcores` AS `cpu_numcores`,`data_hosts`.`cpu_num` AS `cpu_num`,`data_hosts`.`datastore_free` AS `datastore_free`,`data_hosts`.`datastore_used` AS `datastore_used`,`data_hosts`.`datastore_total` AS `datastore_total`,`data_hosts`.`cpu_usage` AS `cpu_usage`,`data_hosts`.`mem_usage` AS `mem_usage`,`data_hosts`.`date` AS `date`,`data_hosts`.`host_id` AS `host_id`,`data_hosts`.`moref_cluster` AS `moref_cluster` from `data_hosts` where (`data_hosts`.`date` = (select max(`data_hosts`.`date`) from `data_hosts`));

-- --------------------------------------------------------

--
-- Structure de la vue `vmresourcepools`
--
DROP TABLE IF EXISTS `vmresourcepools`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmresourcepools` AS select `vms`.`vm_moref` AS `vm_moref`,`vms`.`vmname` AS `vmname`,`vms`.`moref_host` AS `moref_host`,`vms`.`vm_cpu_total` AS `vm_cpu_total`,`vms`.`vm_cpu_usage` AS `vm_cpu_usage`,`vms`.`vm_cpu_num` AS `vm_cpu_num`,`vms`.`vm_mem_total` AS `vm_mem_total`,`vms`.`vm_mem_usage` AS `vm_mem_usage`,`vms`.`vm_powerstate` AS `vm_powerstate`,`vms`.`vm_guest_os` AS `vm_guest_os`,`vms`.`vm_date` AS `vm_date`,`vms`.`vm_id` AS `vm_id`,`vms`.`vm_moref_resourcepool` AS `vm_moref_resourcepool`,`data_respools`.`respool_moref` AS `respool_moref`,`data_respools`.`respool_name` AS `respool_name`,`data_respools`.`respool_moref_cluster` AS `respool_moref_cluster`,`data_respools`.`respool_cpu_reservation` AS `respool_cpu_reservation`,`data_respools`.`respool_cpu_limit` AS `respool_cpu_limit`,`data_respools`.`respool_cpu_expand` AS `respool_cpu_expand`,`data_respools`.`respool_cpu_shares` AS `respool_cpu_shares`,`data_respools`.`respool_mem_reservation` AS `respool_mem_reservation`,`data_respools`.`respool_mem_limit` AS `respool_mem_limit`,`data_respools`.`respool_mem_expand` AS `respool_mem_expand`,`data_respools`.`respool_mem_shares` AS `respool_mem_shares`,`data_respools`.`respool_id` AS `respool_id` from (`vms` left join `data_respools` on((`vms`.`vm_moref_resourcepool` = convert(`data_respools`.`respool_moref` using utf8))));

--
-- Index pour les tables exportées
--

--
-- Index pour la table `data_clusters`
--
ALTER TABLE `data_clusters`
 ADD PRIMARY KEY (`cluster_id`), ADD KEY `cluster_moref` (`cluster_moref`);

--
-- Index pour la table `data_hosts`
--
ALTER TABLE `data_hosts`
 ADD PRIMARY KEY (`host_id`), ADD KEY `host_moref` (`moref`), ADD KEY `moref_cluster` (`moref_cluster`);

--
-- Index pour la table `data_respools`
--
ALTER TABLE `data_respools`
 ADD PRIMARY KEY (`respool_id`), ADD KEY `respool_moref` (`respool_moref`), ADD KEY `respool_moref_cluster` (`respool_moref_cluster`);

--
-- Index pour la table `data_vms`
--
ALTER TABLE `data_vms`
 ADD PRIMARY KEY (`vm_id`), ADD KEY `vm_moref` (`vm_moref`), ADD KEY `vm_moref_resourcepool` (`vm_moref_resourcepool`), ADD KEY `moref_host` (`moref_host`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `data_clusters`
--
ALTER TABLE `data_clusters`
MODIFY `cluster_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `data_hosts`
--
ALTER TABLE `data_hosts`
MODIFY `host_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=603;
--
-- AUTO_INCREMENT pour la table `data_respools`
--
ALTER TABLE `data_respools`
MODIFY `respool_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=398;
--
-- AUTO_INCREMENT pour la table `data_vms`
--
ALTER TABLE `data_vms`
MODIFY `vm_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10728;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
