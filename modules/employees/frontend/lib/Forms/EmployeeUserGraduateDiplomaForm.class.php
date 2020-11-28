<?php

class EmployeeUserGraduateDiplomaI18nForm extends mfForm {
    
      function configure()
      {
          $this->setValidators(array(
              'lang'=>new mfValidatorString(array('max_length'=>2,'min_length'=>2,)), 
              'diploma'=>new mfValidatorString(array('required'=>false)),
              'location'=>new mfValidatorString(array('required'=>false)),
              'city'=>new mfValidatorString(array('required'=>false)),                          
          ));
      }
}

 class EmployeeUserGraduateDiplomaForm extends mfForm {
 
     protected static $languages =null,$countries=null,$diplomas=null;
     
     function configure() {        
         $today = new Day();         
         $this->setValidators(array(             
             'country'=>new mfValidatorChoice(array('key'=>true,'key'=>true,'choices'=> $this->getCountries())),
             'graduate_id'=>new mfValidatorChoice(array('key'=>true,'key'=>true,'choices'=> $this->getDiplomas())),
             'year'=>new mfValidatorInteger(array('min'=>$today->getYear() - 70,'max'=>$today->getYear()))
         ));
         $this->createEmbedFormForEach('i18n', 'EmployeeUserGraduateDiplomaI18nForm', $this->getLanguages()->count(),array('required'=>false,'fill_empty_field'=>false));    
     }
     
     function getCountries()
     {      
         return self::$countries=self::$countries===null?mfCountryInfoI18n::getI18nCountriesToArray()->asort()->unshift(array(''=>__('Select a country'))):self::$countries;
     }
     
    function getLanguages()
    {        
        return self::$languages=self::$languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():self::$languages;
    }
    
    function getDiplomas()
    {
       return self::$diplomas=self::$diplomas===null?EmployeeGraduateDiploma::getGraduateDiplomasByPositionForSelect()->unshift(array(''=>__('Select a diploma'))):self::$diplomas;
    }
}


