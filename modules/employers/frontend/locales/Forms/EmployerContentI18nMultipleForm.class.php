<?php

class EmployerContentI18nMultipleForm extends EmployerContentI18nForm {
    
    function configure() {
        parent::configure();
        unset($this['id']); 
    }
}

