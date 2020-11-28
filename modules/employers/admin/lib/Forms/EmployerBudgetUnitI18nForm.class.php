<?php



 class EmployerBudgetUnitI18nForm extends EmployerBudgetUnitI18nBaseForm {
    
    
     function configure()
    {
        parent::configure();
        $this->setValidator('unit_id', new mfValidatorInteger());
    }

 
}


