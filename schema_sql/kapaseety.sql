-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 18 Août 2014 à 20:33
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

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `clusterhosts`
--
CREATE TABLE IF NOT EXISTS `clusterhosts` (
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
,`cluster` varchar(50)
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
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `clusters`
--
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
-- Doublure de structure pour la vue `clusters_hosts_vms`
--
CREATE TABLE IF NOT EXISTS `clusters_hosts_vms` (
`moref` varchar(50)
,`hostname` varchar(50)
,`cluster` varchar(50)
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
,`cluster_moref` varchar(50)
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
);
-- --------------------------------------------------------

--
-- Structure de la table `data_clusters`
--

CREATE TABLE IF NOT EXISTS `data_clusters` (
  `cluster_moref` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- Structure de la table `data_hosts`
--

CREATE TABLE IF NOT EXISTS `data_hosts` (
  `moref` varchar(50) DEFAULT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `cluster` varchar(50) DEFAULT NULL,
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
`host_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=307 ;

-- --------------------------------------------------------

--
-- Structure de la table `data_vms`
--

CREATE TABLE IF NOT EXISTS `data_vms` (
  `vm_moref` varchar(50) DEFAULT NULL,
  `vmname` varchar(50) DEFAULT NULL,
  `moref_host` varchar(50) DEFAULT NULL,
  `vm_cpu_total` int(10) DEFAULT NULL,
  `vm_cpu_usage` int(10) DEFAULT NULL,
  `vm_cpu_num` int(10) DEFAULT NULL,
  `vm_mem_total` int(10) DEFAULT NULL,
  `vm_mem_usage` int(10) DEFAULT NULL,
  `vm_powerstate` int(10) DEFAULT NULL,
  `vm_guest_os` varchar(100) DEFAULT NULL,
  `vm_date` date DEFAULT NULL,
`vm_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4572 ;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `hosts`
--
CREATE TABLE IF NOT EXISTS `hosts` (
`moref` varchar(50)
,`hostname` varchar(50)
,`cluster` varchar(50)
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
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vmhosts`
--
CREATE TABLE IF NOT EXISTS `vmhosts` (
`moref` varchar(50)
,`hostname` varchar(50)
,`cluster` varchar(50)
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
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vms`
--
CREATE TABLE IF NOT EXISTS `vms` (
`vm_moref` varchar(50)
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
);
-- --------------------------------------------------------

--
-- Structure de la vue `clusterhosts`
--
DROP TABLE IF EXISTS `clusterhosts`;
-- utilisé(#1142 - SHOW VIEW command denied to user 'kapaseety'@'localhost' for table 'clusterhosts')

-- --------------------------------------------------------

--
-- Structure de la vue `clusters`
--
DROP TABLE IF EXISTS `clusters`;
-- utilisé(#1142 - SHOW VIEW command denied to user 'kapaseety'@'localhost' for table 'clusters')

-- --------------------------------------------------------

--
-- Structure de la vue `clusters_hosts_vms`
--
DROP TABLE IF EXISTS `clusters_hosts_vms`;
-- utilisé(#1142 - SHOW VIEW command denied to user 'kapaseety'@'localhost' for table 'clusters_hosts_vms')

-- --------------------------------------------------------

--
-- Structure de la vue `hosts`
--
DROP TABLE IF EXISTS `hosts`;
-- utilisé(#1142 - SHOW VIEW command denied to user 'kapaseety'@'localhost' for table 'hosts')

-- --------------------------------------------------------

--
-- Structure de la vue `vmhosts`
--
DROP TABLE IF EXISTS `vmhosts`;
-- utilisé(#1142 - SHOW VIEW command denied to user 'kapaseety'@'localhost' for table 'vmhosts')

-- --------------------------------------------------------

--
-- Structure de la vue `vms`
--
DROP TABLE IF EXISTS `vms`;
-- utilisé(#1142 - SHOW VIEW command denied to user 'kapaseety'@'localhost' for table 'vms')

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
 ADD PRIMARY KEY (`host_id`), ADD KEY `host_moref` (`moref`);

--
-- Index pour la table `data_vms`
--
ALTER TABLE `data_vms`
 ADD PRIMARY KEY (`vm_id`), ADD KEY `vm_moref` (`vm_moref`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `data_clusters`
--
ALTER TABLE `data_clusters`
MODIFY `cluster_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT pour la table `data_hosts`
--
ALTER TABLE `data_hosts`
MODIFY `host_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=307;
--
-- AUTO_INCREMENT pour la table `data_vms`
--
ALTER TABLE `data_vms`
MODIFY `vm_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4572;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;