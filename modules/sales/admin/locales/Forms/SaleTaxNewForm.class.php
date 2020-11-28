<?php

class SaleTaxNewForm extends SaleTaxBaseForm {

  
    function configure() 
    { 
      parent::configure();
      unset($this['id']);       
    } 
}