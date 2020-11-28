<?php


class paymentsEvents {
   

    static function getRobots(mfEvent $event)
    {
        $seo_robots=$event->getSubject();
        foreach (array("payments_cart"=>array(),                       
                ) as $route=>$parameters)
        {    
            $seo_robots[]=new SEORobotUrl(array(
                    "url"=>link_to($route,$parameters),                               
            ));    
        }         
        $seo_robots[]=new SEORobotUrl(array(
                    "url"=>"/payment/*",                     
        ));
    }
    
}
