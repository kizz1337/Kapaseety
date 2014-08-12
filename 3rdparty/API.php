<?php
/**
 * This file implements the class API.
 * 
 * PHP versions 4 and 5
 *
 * LICENSE:
 * 
 * This file is part of PhotoShow.
 *
 * PhotoShow is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * PhotoShow is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with PhotoShow.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @category  Website
 * @package   Photoshow
 * @author    C�dric Levasseur <cedric.levasseur@ipocus.net>
 * @copyright 2011 C�dric Levasseur
 * @license   http://www.gnu.org/licenses/
 * @link      http://github.com/cyr-ius/PhotoShow
 */

/**
 * API Json
 *
 *
 * @category  Website
 * @package   Photoshow
 * @author    C�dric Levasseur <cedric.levasseur@ipocus.net>
 * @copyright 2011 C�dric Levasseur
 * @license   http://www.gnu.org/licenses/
 * @link      http://github.com/cyr-ius/PhotoShow
 */

class API
{
	function __construct(){
		$jsonRpc = new jsonRPCServer();
		$jsonCls[]= new WS_Account();
		$jsonCls[]= new WS_Group();
		$jsonCls[]= new WS_Token();
		$jsonCls[]= new WS_Comment();
		$jsonCls[]= new WS_Textinfo();
		$jsonCls[]= new WS_MgmtFF();
		$jsonCls[]= new WS_Judge();
		$jsonRpc->registerClass($jsonCls);             
		$jsonRlt = $jsonRpc->handle() or die('no request');
	}
}

?>
