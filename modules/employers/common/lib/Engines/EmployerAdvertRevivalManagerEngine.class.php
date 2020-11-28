<?php


class EmployerAdvertRevivalManagerEngine  {
    
    
    function getDate()
    {
        return $this->date=$this->date===null?new Day():$this->date;
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployerSettings():$this->settings;
    }
    
    // UPDATE `t_employer_advert_i18n` SET revival_iteration=0, revival_at = NULL 
    
    function getAdverts()
    {
        if ($this->adverts===null)
        {            
            $this->adverts=new EmployerAdvertI18nCollection();            
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('limit'=>50,
                                      'date'=>(string)$this->getDate()->getDaySub($this->getSettings()->get('employer_advert_revival_day_schedule',2))->getDate(),
                                      'iteration'=>$this->getSettings()->get('employer_advert_revival_iteration',3),                    
                                      'created_at'=>(string)$this->getDate()->getDayAdd($this->getSettings()->get('employer_advert_revival_day_schedule',2))->getDate()))
                ->setObjects(array('EmployerAdvertI18n','EmployerAdvert'))
                ->setQuery("SELECT {fields} FROM ".EmployerAdvertI18n::getTable().
                           " INNER JOIN ".EmployerAdvertI18n::getOuterForJoin('advert_id').
                           " WHERE revival_iteration <= '{iteration}' ".
                                    " AND (revival_at <= '{date} 00:00:00' OR revival_at IS NULL)".
                                    " AND ".EmployerAdvert::getTableField('state')."='DRAFT'".
                                    " AND ".EmployerAdvert::getTableField('created_at')." <= '{created_at} 00:00:00'".
                           " LIMIT 0,{limit}".
                           ";")               
                ->makeSqlQuery(); 
          //   echo $db->getQuery();
            if (!$db->getNumRows())
                return $this->adverts;
            while ($items=$db->fetchObjects())
            { 
                $item= $items->getEmployerAdvertI18n();
                $item->set('advert_id',$items->getEmployerAdvert());
                $this->adverts[$item->get('id')]=$item;
            }                
            $this->adverts->loaded();
        }   
        return $this->adverts;
    }
    
    function process()
    {    
        //echo $this->getAdverts()->getKeys()->implode();
        foreach ($this->getAdverts() as $advert_i18n)
        {          
            $advert_i18n->set('revival_iteration',$advert_i18n->getRevivalIteration()+1);
            $advert_i18n->set('revival_at',date('Y-m-d'));            
        }   
        $this->getAdverts()->save();
        foreach ($this->getAdverts() as $advert_i18n)
        {
            $engine= new EmployerAdvertI18nEmailEngine($advert_i18n);
            $engine->sendRevival();
        }    
        EmployerAdvertI18nEmailEngine::getSpooler()->save();
        return $this;
    }
    
    
    function cron()
    {
        $this->process();
        
        return $this;
    }
}

