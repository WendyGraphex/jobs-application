<?php

$time_start = microtime(true);
require_once dirname(__FILE__)."/../../config/SystemConfiguration.class.php";
$configuration=SystemConfiguration::getApplicationConfiguration('admin');
mfContext::createInstance($configuration)->dispatch();
echo "<!-- Admin Application Time=".(microtime(true) - $time_start)." Memory=".memory_get_peak_usage()."-->";