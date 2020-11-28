<?php


class EmployerQuotationRequestRevivalManagerEngine  {
    
    
    function getDate()
    {
        return $this->date=$this->date===null?new Day():$this->date;
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new SaleQuotationSettings():$this->settings;
    }
    
    // UPDATE `t_employer_quotation_request` SET revival_iteration=0, revival_at = NULL 
       
    function getRequests()
    {
        if ($this->requests===null)
        {            
            $this->requests=new EmployerQuotationRequestCollection();            
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('limit'=>50,
                                      'date'=>(string)$this->getDate()->getDaySub($this->getSettings()->get('employee_quotation_request_revival_day_schedule',1))->getDate(),
                                      'iteration'=>$this->getSettings()->get('employee_quotation_request_revival_iteration',2),                    
                                      'created_at'=>(string)$this->getDate()->getDayAdd($this->getSettings()->get('employee_quotation_request_revival_day_schedule',1))->getDate()))
                ->setObjects(array('EmployerQuotationRequest'))
                ->setQuery("SELECT {fields} FROM ".EmployerQuotationRequest::getTable().
                          
                           " WHERE revival_iteration <= '{iteration}' ".
                                    " AND (revival_at <= '{date} 00:00:00' OR revival_at IS NULL)".   
                                    " AND quoted_at IS NULL".
                                    " AND ".EmployerQuotationRequest::getTableField('created_at')." <= '{created_at} 00:00:00'".
                           " LIMIT 0,{limit}".
                           ";")               
                ->makeSqlQuery(); 
            //  echo $db->getQuery();
            if (!$db->getNumRows())
                return $this->requests;
            while ($items=$db->fetchObjects())
            { 
                $item= $items->getEmployerQuotationRequest();               
                $this->requests[$item->get('id')]=$item;
            }                
            $this->requests->loaded(); 
        }   
        return $this->requests;
    }
    
    function process()
    {    
        //echo $this->getAdverts()->getKeys()->implode();
        foreach ($this->getRequests() as $advert_i18n)
        {          
            $advert_i18n->set('revival_iteration',$advert_i18n->getRevivalIteration()+1);
            $advert_i18n->set('revival_at',date('Y-m-d'));            
        }   
        $this->getRequests()->save();
        foreach ($this->getRequests() as $request)
        {
            $engine= new EmployerSaleQuotationRequestEmailEngine($request);
            $engine->sendSpoolerEmployerRevival();                        
            $engine->sendSpoolerEmployeeRevival();            
        }    
        EmployerSaleQuotationRequestEmailEngine::getSpooler()->save();
        return $this;
    }
    
    
    function cron()
    {
        $this->process();
        
        return $this;
    }
}

