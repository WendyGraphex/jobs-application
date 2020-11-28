<?php


class ProjectTaskForProjectEmployeePager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'ProjectTask',
           'Project',
          // 'EmployeeUser',
         //  'ProjectManager',
           'ProjectTaskState','ProjectTaskStateI18n',
         //  'ProjectTaskCategory','ProjectTaskCategoryI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getProjectTask();                                         
              $item->set('project_id',$items->getProject());     
           //   $item->set('employee_id',$items->hasEmployeeUser()?$items->getEmployeeUser():false);  
           //   $item->set('manager_id',$items->hasProjectManager()?$items->getProjectManager():false);  
              $item->set('state_id',$items->hasProjectTaskState()?$items->getProjectTaskState():false);  
              if ($item->hasState())   
              {
                  $item->getState()->setI18n($items->hasProjectTaskStateI18n()?$items->getProjectTaskStateI18n():false);
              }    
          /*    $item->set('category_id',$items->hasProjectTaskCategory()?$items->getProjectTaskCategory():false);  
              if ($item->hasCategory())   
              {
                  $item->getCategory()->setI18n($items->hasProjectTaskCategoryI18n()?$items->getProjectTaskCategoryI18n():false);
              }  */
              $this->items[$item->get('id')]=$item;                  
       }                 
      // mfContext::getInstance()->getEventManager()->notify(new mfEvent($this,'project.task.pager')); 
      // echo "<pre>"; var_dump($this->items);
    }
   
    
}

