<?php

class CmsBlockFormbase extends mfForm {

    function configure() {                         
        $this->setValidators(array(           
            'name' => new mfValidatorName(),            
            'id'=>new mfValidatorInteger()
        ));
    }
}