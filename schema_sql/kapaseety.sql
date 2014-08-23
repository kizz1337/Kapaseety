-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2014 at 11:48 AM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kapaseety`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `clusterhosts`
--
DROP VIEW IF EXISTS `clusterhosts`;
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
,`moref_cluster` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `clusterresourcepools`
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
-- Stand-in structure for view `clusters`
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
-- Stand-in structure for view `clusters_hosts_vms`
--
DROP VIEW IF EXISTS `clusters_hosts_vms`;
CREATE TABLE IF NOT EXISTS `clusters_hosts_vms` (
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
);
-- --------------------------------------------------------

--
-- Table structure for table `data_clusters`
--

DROP TABLE IF EXISTS `data_clusters`;
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
  `cluster_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cluster_id`),
  KEY `cluster_moref` (`cluster_moref`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_hosts`
--

DROP TABLE IF EXISTS `data_hosts`;
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
  `host_id` int(11) NOT NULL AUTO_INCREMENT,
  `moref_cluster` varchar(50) NOT NULL,
  PRIMARY KEY (`host_id`),
  KEY `host_moref` (`moref`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=598 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_respools`
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
  `respool_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`respool_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=395 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_vms`
--

DROP TABLE IF EXISTS `data_vms`;
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
  `vm_id` int(11) NOT NULL AUTO_INCREMENT,
  `vm_moref_resourcepool` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vm_id`),
  KEY `vm_moref` (`vm_moref`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10723 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `hosts`
--
DROP VIEW IF EXISTS `hosts`;
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
,`host_id` int(11)
,`moref_cluster` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vmhosts`
--
DROP VIEW IF EXISTS `vmhosts`;
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
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vmresourcepools`
--
DROP VIEW IF EXISTS `vmresourcepools`;
CREATE TABLE IF NOT EXISTS `vmresourcepools` (
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
,`vm_id` int(11)
,`vm_moref_resourcepool` varchar(50)
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
-- Stand-in structure for view `vms`
--
DROP VIEW IF EXISTS `vms`;
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
,`vm_id` int(11)
,`vm_moref_resourcepool` varchar(50)
);
-- --------------------------------------------------------

--
-- Structure for view `clusterhosts`
--
DROP TABLE IF EXISTS `clusterhosts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clusterhosts` AS select `clusters`.`cluster_moref` AS `cluster_moref`,`clusters`.`clustername` AS `clustername`,`clusters`.`cluster_hosts_total` AS `cluster_hosts_total`,`clusters`.`cluster_vms_total` AS `cluster_vms_total`,`clusters`.`cluster_failover_cpu` AS `cluster_failover_cpu`,`clusters`.`cluster_cpu_total` AS `cluster_cpu_total`,`clusters`.`cluster_cpu_realcapacity` AS `cluster_cpu_realcapacity`,`clusters`.`cluster_cpu_usage` AS `cluster_cpu_usage`,`clusters`.`cluster_failover_mem` AS `cluster_failover_mem`,`clusters`.`cluster_mem_usage` AS `cluster_mem_usage`,`clusters`.`cluster_mem_realcapacity` AS `cluster_mem_realcapacity`,`clusters`.`cluster_mem_total` AS `cluster_mem_total`,`clusters`.`cluster_vmcpu_average` AS `cluster_vmcpu_average`,`clusters`.`cluster_vmmem_average` AS `cluster_vmmem_average`,`clusters`.`cluster_vmcpu_left` AS `cluster_vmcpu_left`,`clusters`.`cluster_vmmem_left` AS `cluster_vmmem_left`,`clusters`.`cluster_vcpu_ratio` AS `cluster_vcpu_ratio`,`clusters`.`cluster_vmhost_ratio` AS `cluster_vmhost_ratio`,`clusters`.`cluster_datastore_total` AS `cluster_datastore_total`,`clusters`.`cluster_datastore_free` AS `cluster_datastore_free`,`clusters`.`cluster_datastore_used` AS `cluster_datastore_used`,`clusters`.`cluster_date` AS `cluster_date`,`hosts`.`moref` AS `moref`,`hosts`.`hostname` AS `hostname`,`hosts`.`cluster` AS `cluster`,`hosts`.`vm_num` AS `vm_num`,`hosts`.`version` AS `version`,`hosts`.`manufacturer` AS `manufacturer`,`hosts`.`model` AS `model`,`hosts`.`mem_total` AS `mem_total`,`hosts`.`cpu_socket_num` AS `cpu_socket_num`,`hosts`.`cpu_total` AS `cpu_total`,`hosts`.`cpu_numcores` AS `cpu_numcores`,`hosts`.`cpu_num` AS `cpu_num`,`hosts`.`datastore_free` AS `datastore_free`,`hosts`.`datastore_used` AS `datastore_used`,`hosts`.`datastore_total` AS `datastore_total`,`hosts`.`cpu_usage` AS `cpu_usage`,`hosts`.`mem_usage` AS `mem_usage`,`hosts`.`date` AS `date`,`hosts`.`host_id` AS `host_id`,`hosts`.`moref_cluster` AS `moref_cluster` from (`clusters` left join `hosts` on((`clusters`.`clustername` = `hosts`.`cluster`)));

-- --------------------------------------------------------

--
-- Structure for view `clusterresourcepools`
--
DROP TABLE IF EXISTS `clusterresourcepools`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clusterresourcepools` AS select `clusters`.`cluster_moref` AS `cluster_moref`,`clusters`.`clustername` AS `clustername`,`clusters`.`cluster_hosts_total` AS `cluster_hosts_total`,`clusters`.`cluster_vms_total` AS `cluster_vms_total`,`clusters`.`cluster_failover_cpu` AS `cluster_failover_cpu`,`clusters`.`cluster_cpu_total` AS `cluster_cpu_total`,`clusters`.`cluster_cpu_realcapacity` AS `cluster_cpu_realcapacity`,`clusters`.`cluster_cpu_usage` AS `cluster_cpu_usage`,`clusters`.`cluster_failover_mem` AS `cluster_failover_mem`,`clusters`.`cluster_mem_usage` AS `cluster_mem_usage`,`clusters`.`cluster_mem_realcapacity` AS `cluster_mem_realcapacity`,`clusters`.`cluster_mem_total` AS `cluster_mem_total`,`clusters`.`cluster_vmcpu_average` AS `cluster_vmcpu_average`,`clusters`.`cluster_vmmem_average` AS `cluster_vmmem_average`,`clusters`.`cluster_vmcpu_left` AS `cluster_vmcpu_left`,`clusters`.`cluster_vmmem_left` AS `cluster_vmmem_left`,`clusters`.`cluster_vcpu_ratio` AS `cluster_vcpu_ratio`,`clusters`.`cluster_vmhost_ratio` AS `cluster_vmhost_ratio`,`clusters`.`cluster_datastore_total` AS `cluster_datastore_total`,`clusters`.`cluster_datastore_free` AS `cluster_datastore_free`,`clusters`.`cluster_datastore_used` AS `cluster_datastore_used`,`clusters`.`cluster_date` AS `cluster_date`,`data_respools`.`respool_moref` AS `respool_moref`,`data_respools`.`respool_name` AS `respool_name`,`data_respools`.`respool_moref_cluster` AS `respool_moref_cluster`,`data_respools`.`respool_cpu_reservation` AS `respool_cpu_reservation`,`data_respools`.`respool_cpu_limit` AS `respool_cpu_limit`,`data_respools`.`respool_cpu_expand` AS `respool_cpu_expand`,`data_respools`.`respool_cpu_shares` AS `respool_cpu_shares`,`data_respools`.`respool_mem_reservation` AS `respool_mem_reservation`,`data_respools`.`respool_mem_limit` AS `respool_mem_limit`,`data_respools`.`respool_mem_expand` AS `respool_mem_expand`,`data_respools`.`respool_mem_shares` AS `respool_mem_shares`,`data_respools`.`respool_id` AS `respool_id` from (`clusters` left join `data_respools` on((`clusters`.`cluster_moref` = convert(`data_respools`.`respool_moref_cluster` using utf8))));

-- --------------------------------------------------------

--
-- Structure for view `clusters`
--
DROP TABLE IF EXISTS `clusters`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clusters` AS select `data_clusters`.`cluster_moref` AS `cluster_moref`,`data_clusters`.`clustername` AS `clustername`,`data_clusters`.`cluster_hosts_total` AS `cluster_hosts_total`,`data_clusters`.`cluster_vms_total` AS `cluster_vms_total`,`data_clusters`.`cluster_failover_cpu` AS `cluster_failover_cpu`,`data_clusters`.`cluster_cpu_total` AS `cluster_cpu_total`,`data_clusters`.`cluster_cpu_realcapacity` AS `cluster_cpu_realcapacity`,`data_clusters`.`cluster_cpu_usage` AS `cluster_cpu_usage`,`data_clusters`.`cluster_failover_mem` AS `cluster_failover_mem`,`data_clusters`.`cluster_mem_usage` AS `cluster_mem_usage`,`data_clusters`.`cluster_mem_realcapacity` AS `cluster_mem_realcapacity`,`data_clusters`.`cluster_mem_total` AS `cluster_mem_total`,`data_clusters`.`cluster_vmcpu_average` AS `cluster_vmcpu_average`,`data_clusters`.`cluster_vmmem_average` AS `cluster_vmmem_average`,`data_clusters`.`cluster_vmcpu_left` AS `cluster_vmcpu_left`,`data_clusters`.`cluster_vmmem_left` AS `cluster_vmmem_left`,`data_clusters`.`cluster_vcpu_ratio` AS `cluster_vcpu_ratio`,`data_clusters`.`cluster_vmhost_ratio` AS `cluster_vmhost_ratio`,`data_clusters`.`cluster_datastore_total` AS `cluster_datastore_total`,`data_clusters`.`cluster_datastore_free` AS `cluster_datastore_free`,`data_clusters`.`cluster_datastore_used` AS `cluster_datastore_used`,`data_clusters`.`cluster_date` AS `cluster_date` from `data_clusters` where (`data_clusters`.`cluster_date` = (select max(`data_clusters`.`cluster_date`) from `data_clusters`));

-- --------------------------------------------------------

--
-- Structure for view `clusters_hosts_vms`
--
DROP TABLE IF EXISTS `clusters_hosts_vms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clusters_hosts_vms` AS select `clusterhosts`.`cluster_moref` AS `cluster_moref`,`clusterhosts`.`clustername` AS `clustername`,`clusterhosts`.`cluster_hosts_total` AS `cluster_hosts_total`,`clusterhosts`.`cluster_vms_total` AS `cluster_vms_total`,`clusterhosts`.`cluster_failover_cpu` AS `cluster_failover_cpu`,`clusterhosts`.`cluster_cpu_total` AS `cluster_cpu_total`,`clusterhosts`.`cluster_cpu_realcapacity` AS `cluster_cpu_realcapacity`,`clusterhosts`.`cluster_cpu_usage` AS `cluster_cpu_usage`,`clusterhosts`.`cluster_failover_mem` AS `cluster_failover_mem`,`clusterhosts`.`cluster_mem_usage` AS `cluster_mem_usage`,`clusterhosts`.`cluster_mem_realcapacity` AS `cluster_mem_realcapacity`,`clusterhosts`.`cluster_mem_total` AS `cluster_mem_total`,`clusterhosts`.`cluster_vmcpu_average` AS `cluster_vmcpu_average`,`clusterhosts`.`cluster_vmmem_average` AS `cluster_vmmem_average`,`clusterhosts`.`cluster_vmcpu_left` AS `cluster_vmcpu_left`,`clusterhosts`.`cluster_vmmem_left` AS `cluster_vmmem_left`,`clusterhosts`.`cluster_vcpu_ratio` AS `cluster_vcpu_ratio`,`clusterhosts`.`cluster_vmhost_ratio` AS `cluster_vmhost_ratio`,`clusterhosts`.`cluster_datastore_total` AS `cluster_datastore_total`,`clusterhosts`.`cluster_datastore_free` AS `cluster_datastore_free`,`clusterhosts`.`cluster_datastore_used` AS `cluster_datastore_used`,`clusterhosts`.`cluster_date` AS `cluster_date`,`clusterhosts`.`moref` AS `moref`,`clusterhosts`.`hostname` AS `hostname`,`clusterhosts`.`cluster` AS `cluster`,`clusterhosts`.`vm_num` AS `vm_num`,`clusterhosts`.`version` AS `version`,`clusterhosts`.`manufacturer` AS `manufacturer`,`clusterhosts`.`model` AS `model`,`clusterhosts`.`mem_total` AS `mem_total`,`clusterhosts`.`cpu_socket_num` AS `cpu_socket_num`,`clusterhosts`.`cpu_total` AS `cpu_total`,`clusterhosts`.`cpu_numcores` AS `cpu_numcores`,`clusterhosts`.`cpu_num` AS `cpu_num`,`clusterhosts`.`datastore_free` AS `datastore_free`,`clusterhosts`.`datastore_used` AS `datastore_used`,`clusterhosts`.`datastore_total` AS `datastore_total`,`clusterhosts`.`cpu_usage` AS `cpu_usage`,`clusterhosts`.`mem_usage` AS `mem_usage`,`clusterhosts`.`date` AS `date`,`clusterhosts`.`host_id` AS `host_id`,`clusterhosts`.`moref_cluster` AS `moref_cluster`,`vms`.`vm_moref` AS `vm_moref`,`vms`.`vmname` AS `vmname`,`vms`.`moref_host` AS `moref_host`,`vms`.`vm_cpu_total` AS `vm_cpu_total`,`vms`.`vm_cpu_usage` AS `vm_cpu_usage`,`vms`.`vm_cpu_num` AS `vm_cpu_num`,`vms`.`vm_mem_total` AS `vm_mem_total`,`vms`.`vm_mem_usage` AS `vm_mem_usage`,`vms`.`vm_powerstate` AS `vm_powerstate`,`vms`.`vm_guest_os` AS `vm_guest_os`,`vms`.`vm_date` AS `vm_date` from (`clusterhosts` left join `vms` on((`clusterhosts`.`moref` = `vms`.`moref_host`)));

-- --------------------------------------------------------

--
-- Structure for view `hosts`
--
DROP TABLE IF EXISTS `hosts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hosts` AS select `data_hosts`.`moref` AS `moref`,`data_hosts`.`hostname` AS `hostname`,`data_hosts`.`cluster` AS `cluster`,`data_hosts`.`vm_num` AS `vm_num`,`data_hosts`.`version` AS `version`,`data_hosts`.`manufacturer` AS `manufacturer`,`data_hosts`.`model` AS `model`,`data_hosts`.`mem_total` AS `mem_total`,`data_hosts`.`cpu_socket_num` AS `cpu_socket_num`,`data_hosts`.`cpu_total` AS `cpu_total`,`data_hosts`.`cpu_numcores` AS `cpu_numcores`,`data_hosts`.`cpu_num` AS `cpu_num`,`data_hosts`.`datastore_free` AS `datastore_free`,`data_hosts`.`datastore_used` AS `datastore_used`,`data_hosts`.`datastore_total` AS `datastore_total`,`data_hosts`.`cpu_usage` AS `cpu_usage`,`data_hosts`.`mem_usage` AS `mem_usage`,`data_hosts`.`date` AS `date`,`data_hosts`.`host_id` AS `host_id`,`data_hosts`.`moref_cluster` AS `moref_cluster` from `data_hosts` where (`data_hosts`.`date` = (select max(`data_hosts`.`date`) from `data_hosts`));

-- --------------------------------------------------------

--
-- Structure for view `vmhosts`
--
DROP TABLE IF EXISTS `vmhosts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmhosts` AS select `hosts`.`moref` AS `moref`,`hosts`.`hostname` AS `hostname`,`hosts`.`cluster` AS `cluster`,`hosts`.`vm_num` AS `vm_num`,`hosts`.`version` AS `version`,`hosts`.`manufacturer` AS `manufacturer`,`hosts`.`model` AS `model`,`hosts`.`mem_total` AS `mem_total`,`hosts`.`cpu_socket_num` AS `cpu_socket_num`,`hosts`.`cpu_total` AS `cpu_total`,`hosts`.`cpu_numcores` AS `cpu_numcores`,`hosts`.`cpu_num` AS `cpu_num`,`hosts`.`datastore_free` AS `datastore_free`,`hosts`.`datastore_used` AS `datastore_used`,`hosts`.`datastore_total` AS `datastore_total`,`hosts`.`cpu_usage` AS `cpu_usage`,`hosts`.`mem_usage` AS `mem_usage`,`hosts`.`date` AS `date`,`hosts`.`host_id` AS `host_id`,`hosts`.`moref_cluster` AS `moref_cluster`,`data_vms`.`vm_moref` AS `vm_moref`,`data_vms`.`vmname` AS `vmname`,`data_vms`.`moref_host` AS `moref_host`,`data_vms`.`vm_cpu_total` AS `vm_cpu_total`,`data_vms`.`vm_cpu_usage` AS `vm_cpu_usage`,`data_vms`.`vm_cpu_num` AS `vm_cpu_num`,`data_vms`.`vm_mem_total` AS `vm_mem_total`,`data_vms`.`vm_mem_usage` AS `vm_mem_usage`,`data_vms`.`vm_powerstate` AS `vm_powerstate`,`data_vms`.`vm_guest_os` AS `vm_guest_os`,`data_vms`.`vm_date` AS `vm_date`,`data_vms`.`vm_id` AS `vm_id` from (`hosts` left join `data_vms` on((`hosts`.`moref` = `data_vms`.`moref_host`))) where (`data_vms`.`vm_date` = (select max(`data_vms`.`vm_date`) from `data_vms`));

-- --------------------------------------------------------

--
-- Structure for view `vmresourcepools`
--
DROP TABLE IF EXISTS `vmresourcepools`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmresourcepools` AS select `vms`.`vm_moref` AS `vm_moref`,`vms`.`vmname` AS `vmname`,`vms`.`moref_host` AS `moref_host`,`vms`.`vm_cpu_total` AS `vm_cpu_total`,`vms`.`vm_cpu_usage` AS `vm_cpu_usage`,`vms`.`vm_cpu_num` AS `vm_cpu_num`,`vms`.`vm_mem_total` AS `vm_mem_total`,`vms`.`vm_mem_usage` AS `vm_mem_usage`,`vms`.`vm_powerstate` AS `vm_powerstate`,`vms`.`vm_guest_os` AS `vm_guest_os`,`vms`.`vm_date` AS `vm_date`,`vms`.`vm_id` AS `vm_id`,`vms`.`vm_moref_resourcepool` AS `vm_moref_resourcepool`,`data_respools`.`respool_moref` AS `respool_moref`,`data_respools`.`respool_name` AS `respool_name`,`data_respools`.`respool_moref_cluster` AS `respool_moref_cluster`,`data_respools`.`respool_cpu_reservation` AS `respool_cpu_reservation`,`data_respools`.`respool_cpu_limit` AS `respool_cpu_limit`,`data_respools`.`respool_cpu_expand` AS `respool_cpu_expand`,`data_respools`.`respool_cpu_shares` AS `respool_cpu_shares`,`data_respools`.`respool_mem_reservation` AS `respool_mem_reservation`,`data_respools`.`respool_mem_limit` AS `respool_mem_limit`,`data_respools`.`respool_mem_expand` AS `respool_mem_expand`,`data_respools`.`respool_mem_shares` AS `respool_mem_shares`,`data_respools`.`respool_id` AS `respool_id` from (`vms` left join `data_respools` on((`vms`.`vm_moref_resourcepool` = convert(`data_respools`.`respool_moref` using utf8))));

-- --------------------------------------------------------

--
-- Structure for view `vms`
--
DROP TABLE IF EXISTS `vms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vms` AS select `data_vms`.`vm_moref` AS `vm_moref`,`data_vms`.`vmname` AS `vmname`,`data_vms`.`moref_host` AS `moref_host`,`data_vms`.`vm_cpu_total` AS `vm_cpu_total`,`data_vms`.`vm_cpu_usage` AS `vm_cpu_usage`,`data_vms`.`vm_cpu_num` AS `vm_cpu_num`,`data_vms`.`vm_mem_total` AS `vm_mem_total`,`data_vms`.`vm_mem_usage` AS `vm_mem_usage`,`data_vms`.`vm_powerstate` AS `vm_powerstate`,`data_vms`.`vm_guest_os` AS `vm_guest_os`,`data_vms`.`vm_date` AS `vm_date`,`data_vms`.`vm_id` AS `vm_id`,`data_vms`.`vm_moref_resourcepool` AS `vm_moref_resourcepool` from `data_vms` where (`data_vms`.`vm_date` = (select max(`data_vms`.`vm_date`) from `data_vms`));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
