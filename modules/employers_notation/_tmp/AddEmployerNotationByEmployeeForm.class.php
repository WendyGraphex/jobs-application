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
       $this->setValidator('employer_advert_i18n_id',new EmployerAdvertI18nValidator());
       $this->setValidator('employer_user_id',new EmployerValidator());
       $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
         if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
            return $values;
         $employer_advert_i18n_notation = new EmployerAdvertI18nNotation(array('advert_i18n'=>$values['employer_advert_i18n_id'],'employer'=>$values['employer_user_id']));
         if ($employer_advert_i18n_notation->isLoaded())
            throw new mfValidatorErrorSchema($validator,array('employer_user_id'=>new mfValidatorError($this->employer_user_id,__('Advert notation already done.'))));                           
         if ($work=EmployeeWork::getWorkForEmployerAdvertI18nAndEmployerUser($values['employer_advert_i18n_id'],$values['employer_user_id'],$this->getEmployeeUser()))      
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
        if ($this->collection === null)
        {    
            $this->collection = new EmployerAdvertI18nEmployerCriteriaNotationCollection();
            foreach ($this->getValue('notations') as $values)
            {            
               $item = new EmployerAdvertI18nEmployerCriteriaNotation();
               $item->set('notation',$values['notation']);
               $item->set('employer_criteria_id',$values['criteria_id']);
               $item->set('employee_id',$this->getEmployeeUser());
               $item->set('employer_advert_id',$this->getEmployerAdvertI18n()->get('advert_id'));          
               $item->set('employer_advert_lang',$this->getEmployerAdvertI18n()->get('lang'));
               $item->set('employer_user_id',$this->getEmployerUser());              
               $item->set('work_id',$this->getWork());                       
               $this->collection[]=$item;
            }
        }
        return $this->collection;        
    }
}
