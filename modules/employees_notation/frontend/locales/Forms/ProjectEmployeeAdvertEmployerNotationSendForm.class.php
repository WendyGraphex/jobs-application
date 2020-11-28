<?php


class ProjectEmployeeAdvertEmployerNotationSendForm extends mfForm {
    
    protected $employee_user=null,$project=null;
    
    function __construct(Employee $user,Project $project,$defaults = array(), $options = array()) {      
        $this->employee_user=$user;
        $this->project=$project;
        parent::__construct($defaults, $options);
    }
    
    function getEmployeeUser()
    {
        return $this->employee_user;
    }
    
    function getProject()
    {
        return $this->project;
    }       
    
    function getAdvertI18n()
    {
        return $this->_advert_i18n=$this->_advert_i18n===null?$this->getProject()->getWork()->getQuotation()->getEmployeeAdvertI18n():$this->_advert_i18n;
    }
    
    function configure() {              
       $this->createEmbedFormForEach('notations', 'CustomerNotationForm',$this->getCriteriasByCategories()->getCriterias()->count()) ;
    }
  
    function getCriteriasByCategories()
    {
        return EmployerNotationCategoryCollection ::getCriteriasByCategories();           
    }          
    
     function getEmployeeAdvertI18nNotations()
    {
        if ($this->collection===null)
        {    
            $this->collection = new EmployeeAdvertI18nEmployeeCriteriaNotationCollection();
            foreach ($this->getValue('notations') as $values)
            {
               $item = new EmployeeAdvertI18nEmployeeCriteriaNotation();
               $item->set('sender','EMPLOYEE');
               $item->set('notation',$values['notation']);
               $item->set('employer_criteria_id',$values['criteria_id']);
               $item->set('employee_user_id',$this->getEmployeeUser());
               $item->set('employee_advert_id',$this->getAdvertI18n()->get('advert_id'));          
               $item->set('employee_advert_lang',$this->getAdvertI18n()->get('lang'));
               $item->set('employer_user_id',$this->getProject()->getEmployerUser());              
               $item->set('project_id',$this->getProject());              
               $item->set('quotation_id',$this->getProject()->getWork()->getQuotation());    
               $item->set('work_id',$this->getProject()->getWork());                       
               $this->collection[]=$item;
            }
        }
        return $this->collection;        
    }
  
        
}
