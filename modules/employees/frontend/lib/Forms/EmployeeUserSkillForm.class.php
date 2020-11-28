<?php

class EmployeeUserSkillI18nForm extends mfForm {
    
      function configure()
      {
          $this->setValidators(array(
              'lang'=>new mfValidatorString(array('max_length'=>2,'min_length'=>2)), 
              'value'=>new mfValidatorString(array('required'=>false)),            
          ));
      }
}

 class EmployeeUserSkillForm extends mfForm {
 
      protected static $languages =null;
      
     function configure() {        
         $this->setValidators(array(                         
             'skill_id'=>new mfValidatorChoice(array('key'=>true,'key'=>true,'choices'=>EmployeeSkill::getSkillsForSelect()->unshift(array(''=>__('Select a skill'))))),
         ));
         $this->createEmbedFormForEach('i18n', 'EmployeeUserSkillI18nForm', $this->getLanguages()->count(),array('required'=>false,'fill_empty_field'=>false));    
     }
     
    function getLanguages()
    {        
        return self::$languages=self::$languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():self::$languages;
    }
}


