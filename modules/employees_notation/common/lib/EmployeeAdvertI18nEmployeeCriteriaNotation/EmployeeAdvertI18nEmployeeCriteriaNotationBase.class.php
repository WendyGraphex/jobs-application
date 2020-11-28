<?php


class EmployeeAdvertI18nEmployeeCriteriaNotationBase extends CustomerAdvertI18nCriteriaNotation  {
     
    protected static $fields=array('employee_user_id','employer_user_id',
                                   'employee_advert_id','employee_advert_lang','work_id','project_id','sender','quotation_id',
                                   'employee_criteria_id','employer_criteria_id','notation','created_at','updated_at');
     
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
        
      }   
    }
                 
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeAdvertI18nEmployeeCriteriaNotationFormatter($this):$this->formatter;
   }
       
    
     static function loadEmployeeReviews(Employee $employee)
     {
          $employee->set('notations', new EmployeeNotationCategoryCollection());
          $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>mfContext::getInstance()->getUser()->getLanguage(),
                                      'employee_user_id'=>$employee->get('id')))  
                ->setObjects(array( 'EmployeeNotationCriteria','EmployeeNotationCriteriaI18n',
                                   //'EmployeeAdvertI18nEmployeeCriteriaNotation' ,
                                    'EmployeeNotationCategory','EmployeeNotationCategoryI18n'
                                  ))
                ->setQuery("SELECT {fields},SUM(".EmployeeAdvertI18nEmployeeCriteriaNotation::getTableField('notation').") as sum_of_reviews, ".
                                           "count(".EmployeeAdvertI18nEmployeeCriteriaNotation::getTableField('notation').") as number_of_reviews FROM ".EmployeeNotationCriteria::getTable(). 
                           " INNER JOIN ".EmployeeNotationCriteria::getOuterForJoin('category_id').
                           " INNER JOIN ".EmployeeNotationCriteriaI18n::getInnerForJoin('criteria_id').
                           " INNER JOIN ".EmployeeNotationCategoryI18n::getInnerForJoin('category_id').   
                           " LEFT JOIN ".EmployeeAdvertI18nEmployeeCriteriaNotation::getInnerForJoin('employee_criteria_id')." AND ".EmployeeAdvertI18nEmployeeCriteriaNotation::getTableField('sender')."='EMPLOYER'".                         
                           " WHERE ".EmployeeNotationCriteriaI18n::getTableField('lang')."='{lang}' AND ".
                                     EmployeeNotationCategoryI18n::getTableField('lang')."='{lang}' ".                             
                           " GROUP BY ".EmployeeNotationCriteria::getTableField('id').
                           ";")           
                ->makeSqlQuery(); 
        //  echo $db->getQuery();  die(__METHOD__);
           if (!$db->getNumRows())
               return ;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getEmployeeNotationCategory();    
                $item->setI18n($items->getEmployeeNotationCategoryI18n());
                if (!$employee->getNotations()->hasItemByKey($item->get('id')))
                    $employee->getNotations()->set($item->get('id'),$item);
                $items->getEmployeeNotationCriteria()->set('notations',new EmployeeNotationCriteriaNotationsFormatter(intval($items->get('sum_of_reviews')),intval($items->get('number_of_reviews'))));
                $employee->getNotations()->getItemByKey($item->get('id'))->getCriterias()->push($items->getEmployeeNotationCriteria()->setI18n($items->getEmployeeNotationCriteriaI18n()));
            }        
     }
     
     
     static function loadAdvertEmployeeReviews(EmployeeAdvert $advert)
     {
         $collection = new self();
          $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>mfContext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('EmployeeNotationCriteria','EmployeeNotationCriteriaI18n',
                                   'EmployeeAdvertI18nEmployeeCriteriaNotation',
                                   'EmployeeNotationCategory','EmployeeNotationCategoryI18n'))
                ->setQuery("SELECT {fields} FROM ".EmployeeNotationCriteria::getTable(). 
                           " INNER JOIN ".EmployeeNotationCriteria::getOuterForJoin('category_id').
                           " INNER JOIN ".EmployeeNotationCriteriaI18n::getInnerForJoin('criteria_id').
                           " INNER JOIN ".EmployeeNotationCategoryI18n::getInnerForJoin('category_id').                         
                           " WHERE ".EmployeeNotationCriteriaI18n::getTableField('lang')."='{lang}' AND ".
                                     EmployeeNotationCategoryI18n::getTableField('lang')."='{lang}' ".
                           ";")               
                ->makeSqlQuery(); 
           if (!$db->getNumRows())
               return $collection;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getEmployeeNotationCategory();    
                $item->setI18n($items->getEmployeeNotationCategoryI18n());
                if (!isset($collection[$item->get('id')]))
                    $collection[$item->get('id')]=$item;
                $collection[$item->get('id')]->getCriterias()->push($items->getEmployeeNotationCriteria()->setI18n($items->getEmployeeNotationCriteriaI18n()));
            } 
           return $collection;                     
     }
}
