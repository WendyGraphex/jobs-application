<?php



class SocialNetworkNewForm extends SocialNetworkBaseForm {

    
    function configure() { 
      parent::configure();
      unset($this['id'],$this['is_active']);
    } 
}