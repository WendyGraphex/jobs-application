<?php


class SiteEventNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('event_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('event', new SiteEventForm($this->getDefault('event')));
        $this->embedForm('event_i18n', new SiteEventI18nForm($this->getDefault('event_i18n')));
        unset($this->event_i18n['id'],$this->event['id'],$this->event_i18n['event_id']);
        $this->event_i18n->setValidator('event_id',new ObjectExistsValidator('SiteEvent',array('key'=>false,'empty_value'=>null,'required'=>false)));
        $this->setValidator('speakers',new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('speakers')),array('required'=>false)));
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;
        
        
        
      //  $this->getErrorSchema()->addError(new mfValidatorError($validator,'invalid',__("dddddd.")),'password');          
        return $values;
    }
    
    function getIcon()
    {
        return $this['event']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['event']['icon']->hasValue();
    }
    
    function getPicture()
    {
        return $this['event']['picture']->getValue();
    }
    
    function hasPicture()
    {
        return (boolean)$this['event']['picture']->getValue();
    }
    
    function hasEvent()
    {
        return (boolean)$this['event_i18n']['event_id']->getValue();
    }
    
    function getEvent()
    {
        if ($this->_event===null)
        {    
            if ($this->isValid())         
                $this->_event= $this['event_i18n']['event_id']->getValue();            
            else            
                $this->_event=new SiteEvent($this->defaults['event_i18n']['event_id']);                 
        }
        return $this->_event;
    }
    
     function getValuesForEvent()
    {
        $values= $this['event']->getValue();
        if ($this->hasPicture())
             unset($values['event']['picture']);
        $values['speakers']=$this->getSpeakers();
        $values['available_quantity']=$values['number_of_people'];
        return $values;
    }
    
    function getValuesForEventI18n()
    {
        return $this['event_i18n']->getValue();      
    }
    
       function getSpeakers()
    {
        return SiteEventSpeakerUser::getSpeakerUsersFromSelection($this['speakers']->getArray());
    }
}

