<?php

 class EmployeeGraduateDiplomaI18nForm extends EmployeeGraduateDiplomaI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('graduate_id', new mfValidatorInteger());
    }
}


