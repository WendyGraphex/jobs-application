<?php

class SiteEventUserSession extends UserGuardSessionBase  {
        
    const table="t_site_event_user_session"; 
    protected static $foreignKeys=array('user_id'=>'SiteEventUser');          
    
    function getUser()
    {
        return $this->_user_id=$this->_user_id===null?new SiteEventUser($this->get('user_id')):$this->_user_id;
    }
}
