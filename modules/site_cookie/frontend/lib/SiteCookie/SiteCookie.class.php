<?php

class SiteCookie extends  SiteCookieBase  {

    
    
    static function create($ip)
    {
        $cookie=new self();
        $cookie->set('ip',$ip)->save();
    }
}


