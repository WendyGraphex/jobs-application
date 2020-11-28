<?php


 class EmployeePortfolioDocumentI18nBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                    
            'title'=>new mfValidatorString(array('max_length'=>64)),          
        ));
    }
    
 
}


