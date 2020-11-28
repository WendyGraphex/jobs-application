<?php

class SiteEventSpeakerUserNewForm extends SiteEventSpeakerUserBaseForm {

     
    
    function configure() {
        parent::configure();
        unset($this['id']);
    }
    
}