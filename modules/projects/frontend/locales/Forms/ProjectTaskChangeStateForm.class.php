<?php


 class ProjectTaskChangeStateForm extends mfForm {
 
     protected $user=null;
     
     function __construct($user,$defaults = array(), $options = array()) {
         $this->user=$user;
         parent::__construct($defaults, $options);
     }
     
     function getUser()
     {
         return $this->user;
     }

    function configure()
    {
        $this->setValidators(array(
            'id'=>new ProjectTaskValidator($this->getUser()),
            'state_id'=>new ObjectExistsValidator('ProjectTaskState',array('required'=>false)),
        ));
    }
 
    function getTask()
    {
        return $this['id']->getValue();
    }
    
    function getState()
    {
        return $this['state_id']->getValue();
    }
}


