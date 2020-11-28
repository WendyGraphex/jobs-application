<?php

 class EmployeeNotationCriteriaI18nForm extends EmployeeNotationCriteriaI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('criteria_id', new mfValidatorInteger());
    }
}


