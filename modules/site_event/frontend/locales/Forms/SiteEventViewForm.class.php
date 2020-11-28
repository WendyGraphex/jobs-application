<?php



class SiteEventViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('event', new SiteEventForm($this->getDefault('event')));
        $this->embedForm('event_i18n', new SiteEventI18nForm($this->getDefault('event_i18n')));
       $this->setValidator('speakers',new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('speakers')),array('required'=>false)));
        unset($this->event_i18n['id'],$this->event['id']);
    }

  /*  function getIcon()
    {
        return $this['event']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['event']['icon']->getValue();
    }*/
    
   function getPicture()
    {
        return $this['event']['picture']->getValue();
    }
    
    function hasPicture()
    {
        return $this['event']['picture']->getValue();
    }
    
    function getValuesForEvent()
    {
        $values= $this['event']->getValue();
         if ($this->hasPicture())
            unset($values['event']['picture']);
        $values['speakers']=$this->getSpeakers();
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
