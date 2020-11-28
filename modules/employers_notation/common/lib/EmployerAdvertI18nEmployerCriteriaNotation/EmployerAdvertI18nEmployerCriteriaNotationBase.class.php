<?php

// EmployerAdvertI18nEmployerCriteriaNotation
class EmployerAdvertI18nEmployerCriteriaNotationBase extends CustomerAdvertI18nCriteriaNotation  {
     
    protected static $fields=array('employee_user_id','employer_user_id',
                                   'employer_advert_id','employer_advert_lang','work_id','project_id','sender','quotation_id',
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
       return $this->formatter=$this->formatter===null?new EmployerAdvertI18nEmployerCriteriaNotationFormatter($this):$this->formatter;
   }
   
    
     function getEmployerAdvertI18n()
    {
       return $this->employer_advert_i18n_id=$this->employer_advert_i18n_id===null?new EmployerAdvertI18n(array('advert_id'=>$this->get('employer_advert_id'),'lang'=>$this->get('employer_lang'))):$this->employer_advert_i18n_id;                 
    } 
    
    static function loadEmployerReviews(EmployerUser $employer)
     {
          $employer->set('notations', new EmployerNotationCategoryCollection());
          $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>mfContext::getInstance()->getUser()->getLanguage(),
                                      'employer_user_id'=>$employer->get('id')))  
                ->setObjects(array( 'EmployerNotationCriteria','EmployerNotationCriteriaI18n',
                                   //'EmployerAdvertI18nEmployerCriteriaNotation' ,
                                    'EmployerNotationCategory','EmployerNotationCategoryI18n'
                                  ))
                ->setQuery("SELECT {fields},SUM(".EmployerAdvertI18nEmployerCriteriaNotation::getTableField('notation').") as sum_of_reviews, ".
                                           "count(".EmployerAdvertI18nEmployerCriteriaNotation::getTableField('notation').") as number_of_reviews FROM ".EmployerNotationCriteria::getTable(). 
                           " INNER JOIN ".EmployerNotationCriteria::getOuterForJoin('category_id').
                           " INNER JOIN ".EmployerNotationCriteriaI18n::getInnerForJoin('criteria_id').
                           " INNER JOIN ".EmployerNotationCategoryI18n::getInnerForJoin('category_id').   
                           " LEFT JOIN ".EmployerAdvertI18nEmployerCriteriaNotation::getInnerForJoin('employer_criteria_id')." AND ".EmployerAdvertI18nEmployerCriteriaNotation::getTableField('sender')."='EMPLOYER'".                         
                           " WHERE ".EmployerNotationCriteriaI18n::getTableField('lang')."='{lang}' AND ".
                                     EmployerNotationCategoryI18n::getTableField('lang')."='{lang}' ".                             
                           " GROUP BY ".EmployerNotationCriteria::getTableField('id').
                           ";")           
                ->makeSqlQuery(); 
        //  echo $db->getQuery();  die(__METHOD__);
           if (!$db->getNumRows())
               return ;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getEmployerNotationCategory();    
                $item->setI18n($items->getEmployerNotationCategoryI18n());
                if (!$employer->getNotations()->hasItemByKey($item->get('id')))
                    $employer->getNotations()->set($item->get('id'),$item);
                $items->getEmployerNotationCriteria()->set('notations',new EmployerNotationCriteriaNotationsFormatter(intval($items->get('sum_of_reviews')),intval($items->get('number_of_reviews'))));
                $employer->getNotations()->getItemByKey($item->get('id'))->getCriterias()->push($items->getEmployerNotationCriteria()->setI18n($items->getEmployerNotationCriteriaI18n()));
            }        
     }
}
