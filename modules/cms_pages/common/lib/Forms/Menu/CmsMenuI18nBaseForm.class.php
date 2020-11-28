<?php


class CmsMenuI18nBaseForm extends mfForm {

    function configure()
    {
        $this->setValidators(array(
                            "id"=>new mfValidatorInteger(),
                            "title"=>new mfValidatorString(array('required'=>false))
                            
            
                           ));
    } 
}

