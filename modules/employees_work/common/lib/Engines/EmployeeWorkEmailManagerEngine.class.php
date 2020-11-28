<?php

class EmployeeWorkEmailManagerEngine extends ServerCronManagerEngineCore {
    
    
     
     
     function getRequests()
    {
        if ($this->requests===null)
        {            
            $this->requests=new EmployeeWorkPaymentRequestCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('limit'=>10))
                ->setQuery("SELECT * FROM ".EmployeeWorkPaymentRequest::getTable().                        
                          " WHERE status ='ACTIVE' AND is_active_email_send='NO'".  
                          " LIMIT 0,{limit}".
                          ";")
                ->makeSqlQuery(); 
            if (!$db->getNumRows())   
                  return $this->requests;
            while ($item=$db->fetchObject('EmployeeWorkPaymentRequest'))
            {
               $this->requests[$item->get('id')]=$item->loaded();
            }   
            $this->requests->loaded();
        }   
        return $this->requests;
    }
    
    function process()
    {         
        foreach ($this->getRequests() as $request)
        {           
            $engine=new EmployeeWorkPaymentRequestEmailEngine($request);
            $engine->sendActiveRequest();
            $request->set('is_active_email_send','NO');
        }                       
        $this->getRequests()->save();
        EmployeeWorkPaymentRequestEmailEngine::getSpooler()->save();
        return $this;
    }
    
   
    
    function cron()
    {
     
       return $this->process();
    }
    
}
