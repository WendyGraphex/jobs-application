<?php

class EmployeeNotationCategoryCollection extends mfObjectCollection3 {
    
   
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
                ->setObjects(array('EmployeeNotationCriteria','EmployeeNotationCriteriaI18n','EmployeeNotationCategory','EmployeeNotationCategoryI18n'))
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
    
    function getCriterias()
    {
        if ($this->criterias===null)
        {
            $this->criterias= new EmployeeNotationCriteriaCollection();
            foreach ($this as $item)
            {
                $this->criterias->merge($item->getCriterias());
            }    
        }   
        return $this->criterias;
    }
    
    
    function forEmployee()
    {         
     //   echo "Q=".$this->getProject()->getWork()->getQuotation()->get('id')."<br/>";
     //   echo "W=".$this->getProject()->getWork()->get('id')."<br/>";
       if ($this->isLoaded()) return $this;            
          $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>mfContext::getInstance()->getUser()->getLanguage(),
                                      'employee_user_id'=>$this->getProject()->getEmployeeUser()->get('id'),
                                      'employee_advert_id'=>$this->getProject()->getWork()->getQuotation()->get('employee_advert_id'),
                                      'employee_advert_lang'=>$this->getProject()->getWork()->getQuotation()->get('employee_advert_lang'),
                                      'employer_advert_id'=>$this->getProject()->getWork()->getQuotation()->get('employer_advert_id'),
                                      'employer_advert_lang'=>$this->getProject()->getWork()->getQuotation()->get('employer_advert_lang'),
                    ))  
                ->setObjects(array( 'EmployeeNotationCriteria','EmployeeNotationCriteriaI18n',
                                   'EmployeeAdvertI18nEmployeeCriteriaNotation' ,
                                    'EmployeeNotationCategory','EmployeeNotationCategoryI18n'
                                  ))
                ->setQuery("SELECT {fields}FROM ".EmployeeNotationCriteria::getTable(). 
                           " INNER JOIN ".EmployeeNotationCriteria::getOuterForJoin('category_id').
                           " INNER JOIN ".EmployeeNotationCriteriaI18n::getInnerForJoin('criteria_id').
                           " INNER JOIN ".EmployeeNotationCategoryI18n::getInnerForJoin('category_id').   
                           " LEFT JOIN ".EmployeeAdvertI18nEmployeeCriteriaNotation::getInnerForJoin('employee_criteria_id').
                                        " AND ".EmployeeAdvertI18nEmployeeCriteriaNotation::getTableField('sender')."='EMPLOYER'".                         
                                        " AND ((".
                                            EmployeeAdvertI18nEmployeeCriteriaNotation::getTableField('employee_advert_id')."='{employee_advert_id}' AND ".                         
                                            EmployeeAdvertI18nEmployeeCriteriaNotation::getTableField('employee_advert_lang')."='{employee_advert_lang}') ".
                                            " OR (".
                                            EmployeeAdvertI18nEmployeeCriteriaNotation::getTableField('employer_advert_id')."='{employer_advert_id}' AND ".                         
                                            EmployeeAdvertI18nEmployeeCriteriaNotation::getTableField('employer_advert_lang')."='{employer_advert_lang}' ".
                                            "))".
                           " WHERE ".EmployeeNotationCriteriaI18n::getTableField('lang')."='{lang}' AND ".
                                     EmployeeNotationCategoryI18n::getTableField('lang')."='{lang}' ".                             
                           " GROUP BY ".EmployeeNotationCriteria::getTableField('id').
                           ";")           
                ->makeSqlQuery(); 
        //  echo $db->getQuery();  die(__METHOD__);
           if (!$db->getNumRows())
               return $this->loaded();
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getEmployeeNotationCategory();    
                $item->setI18n($items->getEmployeeNotationCategoryI18n());
                if (!$this->hasItemByKey($item->get('id')))
                    $this->set($item->get('id'),$item);              
                $items->getEmployeeNotationCriteria()->set('review',$items->hasEmployeeAdvertI18nEmployeeCriteriaNotation()?$items->getEmployeeAdvertI18nEmployeeCriteriaNotation():false);
                $this->getItemByKey($item->get('id'))->getCriterias()->push($items->getEmployeeNotationCriteria()->setI18n($items->getEmployeeNotationCriteriaI18n()));
            }         
       return $this;
    }
}

