<?php

$time_start = microtime(true);
require_once dirname(__FILE__)."/../../config/SystemConfiguration.class.php";
mfConfig::set('mf_controller_rewrite',true);
$configuration=SystemConfiguration::getApplicationConfiguration('superadmin');
mfContext::createInstance($configuration)->dispatch();
//echo "<div>URLRewriting SuperAdmin Time=".(microtime(true) - $time_start)." Memory=".memory_get_peak_usage()."</div>";

