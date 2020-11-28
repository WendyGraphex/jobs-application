<?php

class EmployerNotationCategoryCollection extends mfObjectCollection3 {
    
     protected $project=null;
    
    function __construct($data) {
        if ($data instanceof Project)
        {    
            $this->project=$data;
            return parent::__construct();
        }
        return parent::__construct($data);
    }
    
    function getProject()
    {
        return $this->project;
    } 
    
    static function getCriteriasByCategories($lang=null)
    {
        $collection = new self();
          $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('EmployerNotationCriteria','EmployerNotationCriteriaI18n','EmployerNotationCategory','EmployerNotationCategoryI18n'))
                ->setQuery("SELECT {fields} FROM ".EmployerNotationCriteria::getTable(). 
                           " INNER JOIN ".EmployerNotationCriteria::getOuterForJoin('category_id').
                           " INNER JOIN ".EmployerNotationCriteriaI18n::getInnerForJoin('criteria_id').
                           " INNER JOIN ".EmployerNotationCategoryI18n::getInnerForJoin('category_id').                         
                           " WHERE ".EmployerNotationCriteriaI18n::getTableField('lang')."='{lang}' AND ".
                                     EmployerNotationCategoryI18n::getTableField('lang')."='{lang}' ".
                           ";")               
                ->makeSqlQuery(); 
           if (!$db->getNumRows())
               return $collection;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getEmployerNotationCategory();    
                $item->setI18n($items->getEmployerNotationCategoryI18n());
                if (!isset($collection[$item->get('id')]))
                    $collection[$item->get('id')]=$item;
                $collection[$item->get('id')]->getCriterias()->push($items->getEmployerNotationCriteria()->setI18n($items->getEmployerNotationCriteriaI18n()));
            } 
           return $collection; 
    }
    
    function getCriterias()
    {
        if ($this->criterias===null)
        {
            $this->criterias= new EmployerNotationCriteriaCollection();
            foreach ($this as $item)
            {
                $this->criterias->merge($item->getCriterias());
            }    
        }   
        return $this->criterias;
    }
    
    
    function forEmployer()
    {         
       if ($this->isLoaded()) return $this;            
          $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>mfContext::getInstance()->getUser()->getLanguage(),
                                      'employer_user_id'=>$this->getProject()->getEmployerUser()->get('id'),
                                      'employee_advert_id'=>$this->getProject()->getWork()->getQuotation()->get('employee_advert_id'),
                                      'employee_advert_lang'=>$this->getProject()->getWork()->getQuotation()->get('employee_advert_lang'),
                                      'employer_advert_id'=>$this->getProject()->getWork()->getQuotation()->get('employer_advert_id'),
                                      'employer_advert_lang'=>$this->getProject()->getWork()->getQuotation()->get('employer_advert_lang'),
                    ))
                                      
                ->setObjects(array( 'EmployerNotationCriteria','EmployerNotationCriteriaI18n',
                                    'EmployerAdvertI18nEmployerCriteriaNotation' ,
                                    'EmployerNotationCategory','EmployerNotationCategoryI18n'
                                  ))
                ->setQuery("SELECT {fields} FROM ".EmployerNotationCriteria::getTable(). 
                           " INNER JOIN ".EmployerNotationCriteria::getOuterForJoin('category_id').
                           " INNER JOIN ".EmployerNotationCriteriaI18n::getInnerForJoin('criteria_id').
                           " INNER JOIN ".EmployerNotationCategoryI18n::getInnerForJoin('category_id').   
                           " LEFT JOIN ".EmployerAdvertI18nEmployerCriteriaNotation::getInnerForJoin('employer_criteria_id').
                                        " AND ".EmployerAdvertI18nEmployerCriteriaNotation::getTableField('sender')."='EMPLOYEE'".                         
                                        " AND ((".
                                            EmployerAdvertI18nEmployerCriteriaNotation::getTableField('employee_advert_id')."='{employee_advert_id}' AND ".                         
                                            EmployerAdvertI18nEmployerCriteriaNotation::getTableField('employee_advert_lang')."='{employee_advert_lang}') ".
                                            " OR (".
                                            EmployerAdvertI18nEmployerCriteriaNotation::getTableField('employer_advert_id')."='{employer_advert_id}' AND ".                         
                                            EmployerAdvertI18nEmployerCriteriaNotation::getTableField('employer_advert_lang')."='{employer_advert_lang}' ".
                                            "))".
                           " WHERE ".EmployerNotationCriteriaI18n::getTableField('lang')."='{lang}' AND ".
                                     EmployerNotationCategoryI18n::getTableField('lang')."='{lang}' ".                                                     
                           ";")           
                ->makeSqlQuery(); 
       //   echo $db->getQuery();  die(__METHOD__);
           if (!$db->getNumRows())
               return $this;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getEmployerNotationCategory();    
                $item->setI18n($items->getEmployerNotationCategoryI18n());
                if (!$this->hasItemByKey($item->get('id')))
                    $this->set($item->get('id'),$item);
                $items->getEmployerNotationCriteria()->set('review',$items->hasEmployerAdvertI18nEmployerCriteriaNotation()?$items->getEmployerAdvertI18nEmployerCriteriaNotation():false);
                $this->getItemByKey($item->get('id'))->getCriterias()->push($items->getEmployerNotationCriteria()->setI18n($items->getEmployerNotationCriteriaI18n()));
            }         
       return $this;
    }
    
    
    
}

