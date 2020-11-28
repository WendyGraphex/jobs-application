<?php

class GroupBaseForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(),          
            'name' => new mfValidatorName(array('required'=>false)), // @TODO define min max + messages
        ));
    }
}