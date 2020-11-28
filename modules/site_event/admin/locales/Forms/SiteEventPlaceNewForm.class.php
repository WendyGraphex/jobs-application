<?php

class SiteEventPlaceNewForm extends SiteEventPlaceBaseForm {

    function configure() { 
      parent::configure();
      unset($this['id']);            
    } 
    
    
   
}