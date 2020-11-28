<?php

class GroupI18nBaseForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(),
            'lang'=> new LanguagesExistsValidator(array(),'admin'), //   
            'title' => new mfValidatorName(), // @TODO define min max + messages
        ));
    }
}