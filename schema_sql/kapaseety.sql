-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: kapaseety
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `Clusters`
--

DROP TABLE IF EXISTS `Clusters`;
/*!50001 DROP VIEW IF EXISTS `Clusters`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Clusters` (
  `cluster_moref` tinyint NOT NULL,
  `clustername` tinyint NOT NULL,
  `cluster_hosts_total` tinyint NOT NULL,
  `cluster_vms_total` tinyint NOT NULL,
  `cluster_failover_cpu` tinyint NOT NULL,
  `cluster_cpu_total` tinyint NOT NULL,
  `cluster_cpu_realcapacity` tinyint NOT NULL,
  `cluster_cpu_usage` tinyint NOT NULL,
  `cluster_failover_mem` tinyint NOT NULL,
  `cluster_mem_usage` tinyint NOT NULL,
  `cluster_mem_realcapacity` tinyint NOT NULL,
  `cluster_mem_total` tinyint NOT NULL,
  `cluster_vmcpu_average` tinyint NOT NULL,
  `cluster_vmmem_average` tinyint NOT NULL,
  `cluster_vmcpu_left` tinyint NOT NULL,
  `cluster_vmmem_left` tinyint NOT NULL,
  `cluster_vcpu_ratio` tinyint NOT NULL,
  `cluster_vmhost_ratio` tinyint NOT NULL,
  `cluster_datastore_total` tinyint NOT NULL,
  `cluster_datastore_free` tinyint NOT NULL,
  `cluster_datastore_used` tinyint NOT NULL,
  `cluster_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Hosts`
--

DROP TABLE IF EXISTS `Hosts`;
/*!50001 DROP VIEW IF EXISTS `Hosts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Hosts` (
  `moref` tinyint NOT NULL,
  `hostname` tinyint NOT NULL,
  `cluster` tinyint NOT NULL,
  `vm_num` tinyint NOT NULL,
  `version` tinyint NOT NULL,
  `manufacturer` tinyint NOT NULL,
  `model` tinyint NOT NULL,
  `mem_total` tinyint NOT NULL,
  `cpu_socket_num` tinyint NOT NULL,
  `cpu_total` tinyint NOT NULL,
  `cpu_numcores` tinyint NOT NULL,
  `cpu_num` tinyint NOT NULL,
  `datastore_free` tinyint NOT NULL,
  `datastore_used` tinyint NOT NULL,
  `datastore_total` tinyint NOT NULL,
  `cpu_usage` tinyint NOT NULL,
  `mem_usage` tinyint NOT NULL,
  `date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VmHosts`
--

DROP TABLE IF EXISTS `VmHosts`;
/*!50001 DROP VIEW IF EXISTS `VmHosts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VmHosts` (
  `vm_moref` tinyint NOT NULL,
  `vmname` tinyint NOT NULL,
  `moref_host` tinyint NOT NULL,
  `vm_cpu_total` tinyint NOT NULL,
  `vm_cpu_usage` tinyint NOT NULL,
  `vm_cpu_num` tinyint NOT NULL,
  `vm_mem_total` tinyint NOT NULL,
  `vm_mem_usage` tinyint NOT NULL,
  `vm_powerstate` tinyint NOT NULL,
  `vm_guest_os` tinyint NOT NULL,
  `vm_date` tinyint NOT NULL,
  `moref` tinyint NOT NULL,
  `hostname` tinyint NOT NULL,
  `cluster` tinyint NOT NULL,
  `vm_num` tinyint NOT NULL,
  `version` tinyint NOT NULL,
  `manufacturer` tinyint NOT NULL,
  `model` tinyint NOT NULL,
  `mem_total` tinyint NOT NULL,
  `cpu_socket_num` tinyint NOT NULL,
  `cpu_total` tinyint NOT NULL,
  `cpu_numcores` tinyint NOT NULL,
  `cpu_num` tinyint NOT NULL,
  `datastore_free` tinyint NOT NULL,
  `datastore_used` tinyint NOT NULL,
  `datastore_total` tinyint NOT NULL,
  `cpu_usage` tinyint NOT NULL,
  `mem_usage` tinyint NOT NULL,
  `date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Vms`
--

DROP TABLE IF EXISTS `Vms`;
/*!50001 DROP VIEW IF EXISTS `Vms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Vms` (
  `vm_moref` tinyint NOT NULL,
  `vmname` tinyint NOT NULL,
  `moref_host` tinyint NOT NULL,
  `vm_cpu_total` tinyint NOT NULL,
  `vm_cpu_usage` tinyint NOT NULL,
  `vm_cpu_num` tinyint NOT NULL,
  `vm_mem_total` tinyint NOT NULL,
  `vm_mem_usage` tinyint NOT NULL,
  `vm_powerstate` tinyint NOT NULL,
  `vm_guest_os` tinyint NOT NULL,
  `vm_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `data_clusters`
--

DROP TABLE IF EXISTS `data_clusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_clusters` (
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
  KEY `cluster_moref` (`cluster_moref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_hosts`
--

DROP TABLE IF EXISTS `data_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_hosts` (
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
  KEY `host_moref` (`moref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_vms`
--

DROP TABLE IF EXISTS `data_vms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_vms` (
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
  KEY `vm_moref` (`vm_moref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `Clusters`
--

/*!50001 DROP TABLE IF EXISTS `Clusters`*/;
/*!50001 DROP VIEW IF EXISTS `Clusters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Clusters` AS select `data_clusters`.`cluster_moref` AS `cluster_moref`,`data_clusters`.`clustername` AS `clustername`,`data_clusters`.`cluster_hosts_total` AS `cluster_hosts_total`,`data_clusters`.`cluster_vms_total` AS `cluster_vms_total`,`data_clusters`.`cluster_failover_cpu` AS `cluster_failover_cpu`,`data_clusters`.`cluster_cpu_total` AS `cluster_cpu_total`,`data_clusters`.`cluster_cpu_realcapacity` AS `cluster_cpu_realcapacity`,`data_clusters`.`cluster_cpu_usage` AS `cluster_cpu_usage`,`data_clusters`.`cluster_failover_mem` AS `cluster_failover_mem`,`data_clusters`.`cluster_mem_usage` AS `cluster_mem_usage`,`data_clusters`.`cluster_mem_realcapacity` AS `cluster_mem_realcapacity`,`data_clusters`.`cluster_mem_total` AS `cluster_mem_total`,`data_clusters`.`cluster_vmcpu_average` AS `cluster_vmcpu_average`,`data_clusters`.`cluster_vmmem_average` AS `cluster_vmmem_average`,`data_clusters`.`cluster_vmcpu_left` AS `cluster_vmcpu_left`,`data_clusters`.`cluster_vmmem_left` AS `cluster_vmmem_left`,`data_clusters`.`cluster_vcpu_ratio` AS `cluster_vcpu_ratio`,`data_clusters`.`cluster_vmhost_ratio` AS `cluster_vmhost_ratio`,`data_clusters`.`cluster_datastore_total` AS `cluster_datastore_total`,`data_clusters`.`cluster_datastore_free` AS `cluster_datastore_free`,`data_clusters`.`cluster_datastore_used` AS `cluster_datastore_used`,`data_clusters`.`cluster_date` AS `cluster_date` from `data_clusters` where (`data_clusters`.`cluster_date` = (curdate() - interval 1 day)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Hosts`
--

/*!50001 DROP TABLE IF EXISTS `Hosts`*/;
/*!50001 DROP VIEW IF EXISTS `Hosts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Hosts` AS select `data_hosts`.`moref` AS `moref`,`data_hosts`.`hostname` AS `hostname`,`data_hosts`.`cluster` AS `cluster`,`data_hosts`.`vm_num` AS `vm_num`,`data_hosts`.`version` AS `version`,`data_hosts`.`manufacturer` AS `manufacturer`,`data_hosts`.`model` AS `model`,`data_hosts`.`mem_total` AS `mem_total`,`data_hosts`.`cpu_socket_num` AS `cpu_socket_num`,`data_hosts`.`cpu_total` AS `cpu_total`,`data_hosts`.`cpu_numcores` AS `cpu_numcores`,`data_hosts`.`cpu_num` AS `cpu_num`,`data_hosts`.`datastore_free` AS `datastore_free`,`data_hosts`.`datastore_used` AS `datastore_used`,`data_hosts`.`datastore_total` AS `datastore_total`,`data_hosts`.`cpu_usage` AS `cpu_usage`,`data_hosts`.`mem_usage` AS `mem_usage`,`data_hosts`.`date` AS `date` from `data_hosts` where (`data_hosts`.`date` = (curdate() - interval 1 day)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VmHosts`
--

/*!50001 DROP TABLE IF EXISTS `VmHosts`*/;
/*!50001 DROP VIEW IF EXISTS `VmHosts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VmHosts` AS select `data_vms`.`vm_moref` AS `vm_moref`,`data_vms`.`vmname` AS `vmname`,`data_vms`.`moref_host` AS `moref_host`,`data_vms`.`vm_cpu_total` AS `vm_cpu_total`,`data_vms`.`vm_cpu_usage` AS `vm_cpu_usage`,`data_vms`.`vm_cpu_num` AS `vm_cpu_num`,`data_vms`.`vm_mem_total` AS `vm_mem_total`,`data_vms`.`vm_mem_usage` AS `vm_mem_usage`,`data_vms`.`vm_powerstate` AS `vm_powerstate`,`data_vms`.`vm_guest_os` AS `vm_guest_os`,`data_vms`.`vm_date` AS `vm_date`,`data_hosts`.`moref` AS `moref`,`data_hosts`.`hostname` AS `hostname`,`data_hosts`.`cluster` AS `cluster`,`data_hosts`.`vm_num` AS `vm_num`,`data_hosts`.`version` AS `version`,`data_hosts`.`manufacturer` AS `manufacturer`,`data_hosts`.`model` AS `model`,`data_hosts`.`mem_total` AS `mem_total`,`data_hosts`.`cpu_socket_num` AS `cpu_socket_num`,`data_hosts`.`cpu_total` AS `cpu_total`,`data_hosts`.`cpu_numcores` AS `cpu_numcores`,`data_hosts`.`cpu_num` AS `cpu_num`,`data_hosts`.`datastore_free` AS `datastore_free`,`data_hosts`.`datastore_used` AS `datastore_used`,`data_hosts`.`datastore_total` AS `datastore_total`,`data_hosts`.`cpu_usage` AS `cpu_usage`,`data_hosts`.`mem_usage` AS `mem_usage`,`data_hosts`.`date` AS `date` from (`data_vms` join `data_hosts`) where ((`data_vms`.`moref_host` = `data_hosts`.`moref`) and (`data_hosts`.`date` = (curdate() - interval 1 day))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vms`
--

/*!50001 DROP TABLE IF EXISTS `Vms`*/;
/*!50001 DROP VIEW IF EXISTS `Vms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Vms` AS select `data_vms`.`vm_moref` AS `vm_moref`,`data_vms`.`vmname` AS `vmname`,`data_vms`.`moref_host` AS `moref_host`,`data_vms`.`vm_cpu_total` AS `vm_cpu_total`,`data_vms`.`vm_cpu_usage` AS `vm_cpu_usage`,`data_vms`.`vm_cpu_num` AS `vm_cpu_num`,`data_vms`.`vm_mem_total` AS `vm_mem_total`,`data_vms`.`vm_mem_usage` AS `vm_mem_usage`,`data_vms`.`vm_powerstate` AS `vm_powerstate`,`data_vms`.`vm_guest_os` AS `vm_guest_os`,`data_vms`.`vm_date` AS `vm_date` from `data_vms` where (`data_vms`.`vm_date` = (curdate() - interval 1 day)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-13 10:58:16
