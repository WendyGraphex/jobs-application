<?php


 class SiteClientFormBase extends mfForm {
 

    function configure() {
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(),
            'name'=>new mfValidatorString(),
        ));
    }
 
}


