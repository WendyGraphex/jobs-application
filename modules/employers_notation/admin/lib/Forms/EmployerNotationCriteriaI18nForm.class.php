<?php

 class EmployerNotationCriteriaI18nForm extends EmployerNotationCriteriaI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('criteria_id', new mfValidatorInteger());
    }
}


