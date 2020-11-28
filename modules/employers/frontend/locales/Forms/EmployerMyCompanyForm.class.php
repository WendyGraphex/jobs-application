<?php


class EmployerMyCompanyForm extends EmployerCompanyForm {
    
    protected $employer=null;
    
    function __construct(EmployerUser $employer,$defaults = array(), $options = array()) {
        $this->employer=$employer;
        parent::__construct($defaults, $options);
    }
    
    function getEmployerUser()
    {
        return $this->employer;
    }
     function configure() {
          parent::configure();
          $this->setValidator('activity_id',new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerActivity::getAllI18nForSelect()->unshift(array(''=>__('Select an activity'))))));
          if ($this->getEmployerUser()->isProfessional())
          {
               $this->setValidator('registration',new mfValidatorString(array()));
          }    
          unset($this['id']);
      }
      
      
      function getValues()
      {
          $values=parent::getValues();
          unset($values['logo'],$values['picture']);
          return $values;
      }
       function getPicture()
    {
        return $this['picture']->getValue();
    }
    
     function getLogo()
    {
        return $this['logo']->getValue();
    }
}


