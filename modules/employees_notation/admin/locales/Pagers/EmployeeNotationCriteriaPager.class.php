<?php


class EmployeeNotationCriteriaPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployeeNotationCriteria','EmployeeNotationCriteriaI18n',
            'EmployeeNotationCategory', 'EmployeeNotationCategoryI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {                     
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployeeNotationCriteria();            
              $item->setI18n($items->hasEmployeeNotationCriteriaI18n()?$items->getEmployeeNotationCriteriaI18n():false);              
              $item->set('category_id',$items->hasEmployeeNotationCategory()?$items->getEmployeeNotationCategory():false);  
              if ($item->hasCategory())
                  $item->getCategory()->setI18n($items->hasEmployeeNotationCategoryI18n()?$items->getEmployeeNotationCategoryI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


