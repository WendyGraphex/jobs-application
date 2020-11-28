<?php


class EmployeeMyCompanyForm extends EmployeeCompanyForm {
    
     function configure() {
          parent::configure();
          unset($this['id']);
      }
}


