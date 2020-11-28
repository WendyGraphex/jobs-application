<?php

 class EmployeeSkillI18nForm extends EmployeeSkillI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('skill_id', new mfValidatorInteger());
    }
}


