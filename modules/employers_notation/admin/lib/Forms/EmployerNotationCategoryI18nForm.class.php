<?php

 class EmployerNotationCategoryI18nForm extends EmployerNotationCategoryI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('category_id', new mfValidatorInteger());
    }
}


