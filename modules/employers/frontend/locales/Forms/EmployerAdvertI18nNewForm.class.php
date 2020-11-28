<?php

 class EmployerAdvertI18nNewForm extends EmployerAdvertI18nForm {
 
   
      function configure() {
          parent::configure();
          unset($this['id']);
      }
 
}

