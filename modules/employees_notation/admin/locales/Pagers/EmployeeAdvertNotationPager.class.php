<?php


class EmployeeAdvertNotationPager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvertI18nEmployeeCriteriaNotation","EmployeeNotationCriteria","EmployeeNotationCriteriaI18n",
                                  "Employee","EmployerUser","EmployeeAdvertI18n","EmployerAdvertI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                                        
            $item=$items->getEmployeeAdvertI18nEmployeeCriteriaNotation();                                    
         //   echo "id=".$item->get('id')."<br/>";
            $item->set('employee_user_id',$items->getEmployee()) ;
            $item->set('employer_user_id',$items->getEmployerUser());
            if ($items->hasEmployeeAdvertI18n())
                $item->set('advert_i18n',$items->getEmployeeAdvertI18n()); 
            elseif ($items->hasEmployerAdvertI18n())
               $item->set('advert_i18n',$items->getEmployerAdvertI18n()); 
            $item->set('employee_criteria_id',$items->getEmployeeNotationCriteria());
            $item->getEmployeeCriteria()->set('i18n',$items->getEmployeeNotationCriteriaI18n());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}