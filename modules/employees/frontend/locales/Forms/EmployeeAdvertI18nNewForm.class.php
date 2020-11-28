<?php

 class EmployeeAdvertI18nNewForm extends EmployeeAdvertI18nForm {
 
   
      function configure() {
          parent::configure();
          unset($this['id']);
      }
 
}

