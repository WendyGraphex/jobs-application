<?php


class EmployerNotationCriteriaPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployerNotationCriteria','EmployerNotationCriteriaI18n',
            'EmployerNotationCategory', 'EmployerNotationCategoryI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {                     
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployerNotationCriteria();            
              $item->setI18n($items->hasEmployerNotationCriteriaI18n()?$items->getEmployerNotationCriteriaI18n():false);              
              $item->set('category_id',$items->hasEmployerNotationCategory()?$items->getEmployerNotationCategory():false);  
              if ($item->hasCategory())
                  $item->getCategory()->setI18n($items->hasEmployerNotationCategoryI18n()?$items->getEmployerNotationCategoryI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


