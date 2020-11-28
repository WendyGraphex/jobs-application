<?php

class EmployeeWorkGeneratorEngine extends ServerCronManagerEngineCore {
    
     
     
    /*   function getSettings()
    {
        return $this->settings=$this->settings===null?new ServerBackupManagerSettings():$this->settings;
    }
    */
    
    function getNumberOfWorks()
    {
        return new IntegerFormatter($this->getWorks()->count());
    }
    
    function getWorks()
    {
        if ($this->works===null)
        {
            $this->works=new EmployeeWorkCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('limit'=>10))
                ->setQuery("SELECT * FROM ".EmployeeWork::getTable().
                          " WHERE is_completed = 'NO' AND batch IS NULL".                   
                          " LIMIT 0,{limit}".
                          ";")
                ->makeSqlQuery(); 
            if (!$db->getNumRows())   
                  return $this->works;
            while ($item=$db->fetchObject('EmployeeWork'))
            {
               $this->works[$item->get('id')]=$item->loaded();
            }   
            $this->works->loaded();
        }   
        return $this->works;
    }
       
    function process()
    {            
        if ($this->getWorks()->isEmpty())
        {
             $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("UPDATE ".EmployeeWork::getTable().
                          " SET batch = NULL".                                             
                          ";")
                ->makeSqlQuery(); 
            return $this;
        }          
       // echo $this->getWorks()->getKeys()->implode();
        foreach ($this->getWorks() as $work)
        {
             $work->set('batch',1);
             $work->getEngine()->generate();
        }    
        $this->getWorks()->save();
        return $this;
    }
    
   
    
    function cron()
    {
     /*  $now = new Day();
       if ($this->getSettings()->get('processed_time') && $this->getSettings()->getProcessedTime()->getDay()->getDate() == $now->getDate())
           throw new mfException(__('Already processed today.'));
       $this->setOption('cron', true);       */ 
       return $this->process();
    }
    
}
