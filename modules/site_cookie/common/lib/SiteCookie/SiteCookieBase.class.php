<?php

class SiteCookieBase extends  mfObject3  {

    protected static $fields=array('ip','created_at');
    const table="t_site_cookie";
            
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
            if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
            $this->add($parameters); 
       }  
       else
       {
           if (is_numeric((string)$parameters)) 
                $this->loadById((string)$parameters);             
                  
       } 
    }
    
    protected function getDefaults()
    {
         $this->created_at=date("Y-m-d H:i:s");          
    }
     
    function getCreatedAt()
    {
        return new DateTimeFormatter($this->get('created_at'));
    }
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SiteCookieFormatter($this):$this->formatter;
   }
}


