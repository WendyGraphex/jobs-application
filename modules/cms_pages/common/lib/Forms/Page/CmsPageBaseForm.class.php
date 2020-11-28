<?php

class CmsPageBaseForm extends mfForm {
   
    function configure()
    {
        $this->setValidators(array(
                            "id"=>new mfValidatorInteger(),
                            "name"=>new mfValidatorString()    
                           ));
    } 
}

