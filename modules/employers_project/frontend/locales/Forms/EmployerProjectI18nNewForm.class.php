<?php

 class EmployerProjectI18nNewForm extends EmployerProjectI18nForm {
 
   
      function configure() {
          parent::configure();
          unset($this['id']);
      }
 
}

