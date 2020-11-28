<?php


 class EmployerAdvertI18nForm extends EmployerAdvertI18nBaseForm {
 
   
      function configure() {
          parent::configure();
          $this->setValidator('lang',new mfValidatorString(array('min_length'=>2,'max_length'=>2)));
      }
 
}


