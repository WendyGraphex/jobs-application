<?php

class PaymentEmployeeSettingsMultipleForm extends mfForm {
    
    protected $methods=null,$employee_user=null;
    
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
        $this->setValidators(array(
            'method'=>new mfValidatorChoice(array('key'=>true,'choices'=>PaymentEmployeeMethod::getMethods()->getAll()->byNames()))
        ));
        $this->getSettings();
    }
    
    function getMethods()
    {
        return $this->methods=$this->methods===null?PaymentEmployeeMethod::getMethods()->getAll(): $this->methods;
    }
    
    
    function getSettings()
    {
        if ($this->settings===null)
        {
            $this->settings=PaymentEmployeeSettings::getAllForEmployee($this->getEmployeeUser());           
            foreach ($this->getMethods()->bySettings() as $method)
            {                
                if (!$this->settings->hasItemByKey($method->get('name')))                
                {
                     $item = new PaymentEmployeeSettings();
                     $item->set('method_id',$this->method->getChoices()->getItemByKey($method->get('name')));
                     $item->set('employee_user_id',$this->getEmployeeUser());
                     $this->settings[$method->get('name')]=$item;   
                }       
                if ($this->getDefault($method->get('name')))
                    $this->settings[$method->get('name')]->setOptions($this->getDefault($method->get('name')));   
                if ($this->getDefault('method'))
                    $this->settings->getItemByKey($method->get('name'))->set('is_default',$this->getDefault('method') == $method->get('name')?'YES':'NO');                
            }    
        }
        return $this->settings;
    }
    
    function getMethod()
    {
        return $this->method->getChoices()->getItemByKey($this['method']->getValue());
    }
}

