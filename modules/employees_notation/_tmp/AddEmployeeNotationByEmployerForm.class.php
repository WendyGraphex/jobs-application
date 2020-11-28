<?php


class AddEmployeeNotationByEmployerForm extends mfForm {
    
    protected $employer_user=null;
    
    function __construct(EmployerUser $employer_user,$defaults = array(), $options = array()) {
        $this->employer_user=$employer_user;
        parent::__construct($defaults, $options);
    }
    
    function getEmployerUser()
    {
        return $this->employer_user;
    }
    
    function configure()
    {
       $this->createEmbedFormForEach('notations', 'CustomerNotationForm',$this->getCriteriasByCategories()->getCriterias()->count()) ;
       $this->setValidator('employee_advert_i18n_id',new EmployeeAdvertI18nValidator());
       $this->setValidator('employee_user_id',new EmployeeValidator());
       $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
         if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
            return $values; 
         if ($work=EmployeeWork::getWorkForEmployeeAdvertI18nAndEmployeeUser($values['employee_advert_i18n_id'],$values['employee_user_id'],$this->getEmployerUSer()))             
         {
             $values['work']=$work;
             return $values;         
         }    
         throw new mfValidatorErrorSchema($validator,array('employee_user_id'=>new mfValidatorError($this->employee_user_id,__('Employee is invalid.'))));
    }   
    
     function getEmployeeUser()
    {
        return $this['employee_user_id']->getValue();
    } 
    
    function getCriteriasByCategories()
    {
        return EmployeeNotationCategoryCollection ::getCriteriasByCategories();           
    }
    
    function getEmployeeAdvertI18n()
    {
        return $this['employee_advert_i18n_id']->getValue();
    }
    
    function getWork()
    {
        return $this->getValue('work');
    }
    
    function getEmployeeAdvertI18nEmployeeCriteriaNotations()
    {
        $collection = new EmployeeAdvertI18nEmployeeCriteriaNotationCollection();
        foreach ($this->getValue('notations') as $values)
        {
           $item = new EmployeeAdvertI18nEmployeeCriteriaNotation();
           $item->set('notation',$values['notation']);
           $item->set('employee_criteria_id',$values['criteria_id']);
           $item->set('employer_id',$this->getEmployerUser());
           $item->set('employee_advert_id',$this->getEmployeeAdvertI18n()->get('advert_id'));          
           $item->set('employee_advert_lang',$this->getEmployeeAdvertI18n()->get('lang'));
           $item->set('employee_user_id',$this->getEmployeeUser());              
           $item->set('work_id',$this->getWork());                       
           $collection[]=$item;
        }
        return $collection;        
    }
}
