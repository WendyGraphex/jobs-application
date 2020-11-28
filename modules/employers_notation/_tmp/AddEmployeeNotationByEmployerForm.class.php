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
       $this->setValidator('employer_advert_i18n_id',new EmployerAdvertI18nValidator());
       $this->setValidator('employee_user_id',new EmployeeValidator());
       $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
         if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
            return $values; 
         if ($work=EmployeeWork::getWorkForEmployerAdvertI18nAndEmployeeUser($values['employer_advert_i18n_id'],$values['employee_user_id'],$this->getEmployerUser()))      
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
    
    function getEmployerAdvertI18n()
    {
        return $this['employer_advert_i18n_id']->getValue();
    }
    
    function getWork()
    {
        return $this->getValue('work');
    }
    
    function getEmployerAdvertI18nEmployerCriteriaNotations()
    {
        if ($this->collection===null)
        {    
            $this->collection = new EmployerAdvertI18nEmployerCriteriaNotationCollection();
            foreach ($this->getValue('notations') as $values)
            {
               $item = new EmployerAdvertI18nEmployerCriteriaNotation();
               $item->set('notation',$values['notation']);
               $item->set('employee_criteria_id',$values['criteria_id']);
               $item->set('employer_id',$this->getEmployerUser());
               $item->set('employer_advert_id',$this->getEmployerAdvertI18n()->get('advert_id'));          
               $item->set('employer_advert_lang',$this->getEmployerAdvertI18n()->get('lang'));
               $item->set('employee_user_id',$this->getEmployeeUser());              
               $item->set('work_id',$this->getWork());                       
               $this->collection[]=$item;
            }
        }
        return $this->collection;        
    }
}
