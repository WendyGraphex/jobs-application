<?php


class EmployerProjectPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerProject","EmployerProjectI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerProject();   
            if (!isset($this->items[$item->get('id')]))
                $this->items[$item->get('id')]=$item->setProjectsI18n(new EmployerProjectI18nCollection()); 
            $this->items[$item->get('id')]->getProjectsI18n()->add($items->getEmployerProjectI18n()->set('project_id',$this->items[$item->get('id')]));                                               
       }         
    } 
}