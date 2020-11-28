<?php


 class EmployerProjectI18nForm extends EmployerProjectI18nBaseForm {
 
   
      function configure() {
          parent::configure();
          $this->setValidator('lang',new mfValidatorString(array('min_length'=>2,'max_length'=>2)));
      }
 
}


