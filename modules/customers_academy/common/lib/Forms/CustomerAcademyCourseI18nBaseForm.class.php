<?php

  
class CustomerAcademyCourseI18nBaseForm extends mfForm {
         
     
    function configure() {
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(),
            'lang'=>new languagesExistsValidator(array(),'frontend'),          
            'title'=>new mfValidatorString(),
            'short_description'=>new mfValidatorString(),
            'content'=>new mfValidatorString(),
            'price'=>new mfValidatorI18nNumber(),                                  
        ));
    }
   
}