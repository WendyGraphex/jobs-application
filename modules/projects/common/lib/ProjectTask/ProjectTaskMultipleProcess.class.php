<?php


class ProjectTaskMultipleProcess extends mfMultipleProcess {
      
    function process()
    {               
        $query=array();
        $params=array();      
        foreach (array('state') as $field)
        {    
            if ($this->getActions()->in($field))
            {            
                $params[$field."_id"]=$this->getParameter($field."_id");           
                $query[]=ProjectTask::getTableField($field."_id")."=".$this->getParameterIfNull($field."_id");
                $this->addField(__($field));
            } 
        }
        foreach (array('requested_at','before_at','start_at','end_at') as $field)
        {    
            if ($this->getActions()->in($field))
            {            
                $params[$field]=$this->getParameter($field);           
                $query[]=ProjectTask::getTableField($field)."=".$this->getParameterIfNull($field);
                $this->addField(__($field));
            } 
        }
        if ($this->getActions()->in('reference'))
        {            
            $this->getSelection()->reNumbering();
            $this->addMessage(__("Reference has been updated."));
        }         
        if ($this->getActions()->in('priority_delete'))
        {                                
            $query[]=ProjectTask::getTableField('priority')."=NULL"; 
            $this->addMessage(__("Priority has been removed."));
        }
        if (!$this->getFields()->isEmpty())
            $this->addMessage(__("%s have been updated.",$this->getFields()->implode(",")));
        if ($query)
        {           
           $db=mfSiteDatabase::getInstance()
                ->setParameters($params)                
                ->setQuery("UPDATE ".ProjectTask::getTable().
                           " SET ".implode(",",$query).
                           " WHERE id IN('".$this->getSelection()->getKeys()->implode("','")."')".                         
                           ";")                        
                ->makeSqlQuery(); 
          // echo $db->getQuery();
        }  
        return $this;
    }
        
}
