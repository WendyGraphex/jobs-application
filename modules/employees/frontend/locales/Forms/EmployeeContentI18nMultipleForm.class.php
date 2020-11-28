<?php

class EmployeeContentI18nMultipleForm extends EmployeeContentI18nForm {
    
    function configure() {
        parent::configure();
        unset($this['id']); 
    }
}

