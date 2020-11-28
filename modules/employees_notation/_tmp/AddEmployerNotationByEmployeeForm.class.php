<?php


class AddEmployerNotationByEmployeeForm extends mfForm {
    
    protected $employee_user=null;
    
    function __construct(Employee $employee_user,$defaults = array(), $options = array()) {
        $this->employee_user=$employee_user;
        parent::__construct($defaults, $options);
    }
    
    function getEmployeeUser()
    {
        return $this->employee_user;
    }
    
    function configure()
    {
       $this->createEmbedFormForEach('notations', 'CustomerNotationForm',$this->getCriteriasByCategories()->getCriterias()->count()) ;
       $this->setValidator('employee_advert_i18n_id',new EmployeeAdvertI18nValidator());
       $this->setValidator('employer_user_id',new EmployerValidator());
       $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
         if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
            return $values;     
         
         if ($work=EmployeeWork::getWorkForEmployeeAdvertI18nAndEmployerUser($values['employee_advert_i18n_id'],$values['employer_user_id'],$this->getEmployeeUSer()))      
         {
             $values['work']=$work;
             return $values;         
         }    
         throw new mfValidatorErrorSchema($validator,array('employer_user_id'=>new mfValidatorError($this->employer_user_id,__('Employer is invalid.'))));
    }   
    
     function getEmployerUser()
    {
        return $this['employer_user_id']->getValue();
    } 
    
    function getCriteriasByCategories()
    {
        return EmployerNotationCategoryCollection ::getCriteriasByCategories();           
    }
    
    function getEmployeeAdvertI18n()
    {
        return $this['employee_advert_i18n_id']->getValue();
    }
    
    function getWork()
    {
        return $this->getValue('work');
    }
    
    function getEmployeeAdvertI18nNotations()
    {            
        $collection = new EmployeeAdvertI18nEmployeeCriteriaNotationCollection();
        foreach ($this->getValue('notations') as $values)
        {            
           $item = new EmployeeAdvertI18nEmployeeCriteriaNotation();
           $item->set('notation',$values['notation']);
           $item->set('employer_criteria_id',$values['criteria_id']);
           $item->set('employee_id',$this->getEmployeeUser());
           $item->set('employee_advert_id',$this->getEmployeeAdvertI18n()->get('advert_id'));          
           $item->set('employee_advert_lang',$this->getEmployeeAdvertI18n()->get('lang'));
           $item->set('employer_user_id',$this->getEmployerUser());              
           $item->set('work_id',$this->getWork());                       
           $collection[]=$item;
        }
        return $collection;        
    }
}
