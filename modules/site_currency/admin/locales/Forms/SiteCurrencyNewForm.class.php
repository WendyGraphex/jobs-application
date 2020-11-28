<?php

class SiteCurrencyNewForm extends SiteCurrencyBaseForm {

    function configure() { 
      parent::configure();
      unset($this['id']);            
    } 
    
}