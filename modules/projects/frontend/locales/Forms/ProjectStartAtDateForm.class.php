<?php

class ProjectStartAtDateForm extends mfForm  {
    
    protected $project=null;
    
    function __construct(Project $project,$defaults = array(), $options = array()) {
        $this->project=$project;
        parent::__construct($defaults, $options);
    }
    
    function getProject()
    {
        return $this->project;
    }
    
    function configure()
    {
        $this->setValidators(array(
            'start_at'=>new mfValidatorI18nDate(array('date_format'=>'a'))
            ));
          $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
     function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;
        if ($this->getProject()->get('end_at') && ($values['start_at'] > $this->getProject()->get('end_at')))     
            throw new mfValidatorErrorSchema($validator,array('start_at'=>new mfValidatorError($this->start_at,__('Start date has to be below than end date.'))));
        return $values;
    }
    
     function getValues()
    {
        $values=parent::getValues();
        return $values;
    }
    
    function getStartAt()
    {
        return $this['start_at']->getValue();
    }
}

