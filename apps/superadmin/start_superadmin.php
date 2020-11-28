<?php
$time_start = microtime(true);
require_once dirname(__FILE__)."/../../config/SystemConfiguration.class.php";
$configuration=SystemConfiguration::getApplicationConfiguration('superadmin');
mfContext::createInstance($configuration)->dispatch();
echo "<!-- SuperAdmin Application Time=".(microtime(true) - $time_start)." Memory=".memory_get_peak_usage()."-->";

