<?php

 class EmployeeNotationCategoryI18nForm extends EmployeeNotationCategoryI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('category_id', new mfValidatorInteger());
    }
}


