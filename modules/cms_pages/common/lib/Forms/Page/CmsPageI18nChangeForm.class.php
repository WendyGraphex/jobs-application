<?php

class CmsPageI18nChangeForm extends mfForm {
    
    function configure()
    {
        $this->setValidators(array(
                 "id"=>new mfValidatorInteger(),
                 "value"=> new mfValidatorChoice(array("choices"=>array("NO","YES")))
                ));
    }
}
