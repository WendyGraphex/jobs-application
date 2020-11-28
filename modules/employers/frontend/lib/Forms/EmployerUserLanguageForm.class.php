<?php


 class EmployerUserLanguageForm extends mfForm {
 
      
     function configure() {        
         $this->setValidators(array(             
             'lang'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'key'=>true,'choices'=> mfLanguageInfoI18n::getI18nLanguages()->asort()->unshift(array(''=>__('Select a language'))))),
             'level_id'=>new mfValidatorChoice(array('key'=>true,'key'=>true,'required'=>false,'choices'=>EmployerLanguageLevel::getLevelsByPositionForSelect()->unshift(array(''=>__('Select a level'))))),
         ));
     }
}


