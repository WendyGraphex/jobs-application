<?php


abstract class mfMultipleProcess {
   
    
    protected $actions=null,$selection=null,$fields=null,$parameters=null,$messages=array(),$user=null,$errors=null;
    
    abstract function process();
    
    function __construct(mfForm $form,$user=null) {        
        $this->actions=$form['actions']->getArray();
        $this->selection=$form->getSelection();
        $this->parameters=$form->getValues();
        $this->user=$user;
        $this->errors=new mfArray();
        $this->messages=new mfArray();
        $this->fields=new mfArray();
    }
    
    function getActions()
    {
        return $this->actions;
    }
       
    function getUser()
    {
        return $this->user;
    }
    
    function getSelection()
    {
        return $this->selection;
    }        
    
    function getMessages()
    {
        return $this->messages;
    }
    
    function getParameters()
    {
        return $this->parameters;
    }
    
    function getParameterIfNull($name,$default="NULL")
    {
        return  $this->getParameter($name)===null?$default:"'{".$name."}'";
    }        
    
    function getParameter($name,$default=null)
    {
        return isset($this->parameters[$name])?$this->parameters[$name]:$default;
    }        
    
     function getErrors()
    {
        return $this->errors;
    }
    
    function hasErrors()
    {
        return !$this->errors->isEmpty();
    }
    
    function addErrors(mfArray $errors)
    {
        $this->errors->merge($errors);        
        return $this;
    }
    
    function addError($error)
    {
        $this->errors[]=$error;  
        return $this;
    }
    
    function hasMessages()
    {
        return !$this->messages->isEmpty();
    }
    
    function addMessage($message)
    {
        $this->messages[]=$message;
        return $this;
    }
    
    function addField($field)
    {
       $this->fields[]=$field;
        return $this; 
    }
    
     function getFields()
    {
        return $this->fields;
    }
}
