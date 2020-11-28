<?php


class ProjectTaskEditForm extends ProjectTaskBaseForm {
         
    protected $task=null;
    
    function __construct($task,$defaults = array(), $options = array()) {
        $this->task=$task;
        parent::__construct($defaults, $options);
    }
    
    function getTask()
    {
        return $this->task;
    }
    
      function configure()
    {
        parent::configure();                                            
        $this->setValidator('state_id',new mfValidatorChoice(array('key'=>true,'empty_value'=>null,'required'=>false,'choices'=>ProjectTaskState::getStatesForSelect()->unshift(array(''=>'')))));        
    }
    
   
}

