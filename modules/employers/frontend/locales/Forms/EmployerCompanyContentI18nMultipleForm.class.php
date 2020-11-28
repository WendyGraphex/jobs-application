<?php

class EmployerCompanyContentI18nMultipleForm extends EmployerCompanyContentI18nForm {
    
    function configure() {
        parent::configure();
        unset($this['id']); 
    }
}

