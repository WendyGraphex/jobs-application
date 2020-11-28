<?php

class mfTextIpsForm extends mfForm{
    
    function configure()
    {
        $this->setOption("disabledCSRF",true);
        $this->setValidators(array(
            "ips" => new mfValidatorSchemaForEach(new mfValidatorIp(),count($this->getDefault("ips"))),
        ));
    }
}

class mfValidatorSmsBoxCallbackIpsSchema extends mfValidatorString {
    
    protected $form=null;
    
    protected function configure($options = array(), $messages = array()) 
    { 
        $this->setOption("separator",",");
        parent::configure($options, $messages);
        $this->addMessage('invalid_ip', $this->translateMessages('ip {ip} is not in the right format.'));
    }

    protected function doIsValid($value) 
    {   
        $values = explode($this->getOption("separator"), $value);
        $this->form = new mfTextIpsForm(array("ips"=>$values));
        $this->form->bind(array("ips"=>$values));
        if($this->form->isValid())
        {
            return implode(",",$this->form->getValue("ips"));
        }
        
        throw new mfValidatorErrorSchema($this, $this->form->getErrorSchema()->getError("ips"));
    }
    
    function getValues()
    {
        return $this->form['ips'];
    }
    
}