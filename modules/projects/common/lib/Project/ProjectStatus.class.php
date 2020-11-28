<?php

class ProjectStatus extends mfEnumerationObject {
    
    const ACTIVE='ACTIVE',DELETE= 'DELETE', CLOSE='CLOSE', FINISH='FINISH';
         
    
    function close()
    {
        $this->set(self::CLOSE);             
        return $this->save();                
    }  
    
    function finish()
    {
        $this->set(self::FINISH);   
        $this->getItem()->set('end_at',date("Y-m-d H:i:s"));
        return $this->save();          
    }
}
