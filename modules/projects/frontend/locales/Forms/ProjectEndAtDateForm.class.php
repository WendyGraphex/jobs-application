<?php

class ProjectEndAtDateForm extends mfForm  {
    
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
            'end_at'=>new mfValidatorI18nDate(array('date_format'=>'a'))
            ));        
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
     function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;
    
        if ($this->getProject()->get('start_at') && ($values['end_at'] < $this->getProject()->get('start_at')))     
            throw new mfValidatorErrorSchema($validator,array('end_at'=>new mfValidatorError($this->end_at,__('End date has to be upper than start date.'))));
        return $values;
    }
    
    function getValues()
    {
        $values=parent::getValues();
        return $values;
    }
      function getEndAt()
    {
        return $this['end_at']->getValue();
    }
    
}
