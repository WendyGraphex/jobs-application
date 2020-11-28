<?php


class ProjectEmployerAdvertEmployerNotationSendForm extends mfForm {
    
    protected $employer_user=null,$project=null;
    
    function __construct(EmployerUser $user,Project $project,$defaults = array(), $options = array()) {      
        $this->employer_user=$user;
        $this->project=$project;
        parent::__construct($defaults, $options);
    }
    
    function getEmployerUser()
    {
        return $this->employer_user;
    }
    
    function getProject()
    {
        return $this->project;
    }       
    
    function getAdvertI18n()
    {
        return $this->_advert_i18n=$this->_advert_i18n===null?$this->getProject()->getWork()->getQuotation()->getEmployerAdvertI18n():$this->_advert_i18n;
    }
    
    function configure() {              
       $this->createEmbedFormForEach('notations', 'CustomerNotationForm',$this->getCriteriasByCategories()->getCriterias()->count()) ;
    }
  
    function getCriteriasByCategories()
    {
        return EmployeeNotationCategoryCollection ::getCriteriasByCategories();           
    }          
    
     function getEmployerAdvertI18nNotations()
    {
        if ($this->collection===null)
        {    
            $this->collection = new EmployerAdvertI18nEmployerCriteriaNotationCollection();
            foreach ($this->getValue('notations') as $values)
            {
               $item = new EmployerAdvertI18nEmployerCriteriaNotation();
               $item->set('sender','EMPLOYER');
               $item->set('notation',$values['notation']);
               $item->set('employee_criteria_id',$values['criteria_id']);
               $item->set('employer_user_id',$this->getEmployerUser());
               $item->set('employer_advert_id',$this->getAdvertI18n()->get('advert_id'));          
               $item->set('employer_advert_lang',$this->getAdvertI18n()->get('lang'));
               $item->set('employee_user_id',$this->getProject()->getEmployeeUser());              
               $item->set('project_id',$this->getProject());              
               $item->set('quotation_id',$this->getProject()->getWork()->getQuotation());    
               $item->set('work_id',$this->getProject()->getWork());                       
               $this->collection[]=$item;
            }
        }
        return $this->collection;        
    }
  
        
}
