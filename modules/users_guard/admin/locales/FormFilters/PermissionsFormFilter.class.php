<?php

class PermissionsFormFilter extends mfFormFilterBase {
    
    
    protected $language=null,$user=null;
    
    function __construct($language,$user)
    {
       $this->language=$language;     
       $this->user=$user;
       parent::__construct();      
    }
    
    function getLanguage()
    {
      return $this->language;
    }
    
    function getUser()
    {
        return $this->user;
    }
           
    
    function configure()
    {                         
       $this->setDefaults(array(
            'lang'=>$this->getLanguage(),     
            'order'=>array(
                            "id"=>"asc",    
                "name"=>"asc",
                "created_at"=>"asc",
                "updated_at"=>"asc",
            ),            
            'nbitemsbypage'=>"10",
       ));          
       $this->setClass('Permission');
       // Base Query
       $this->setQuery("SELECT {fields} FROM ".Permission::getTable().
                       " LEFT JOIN ".PermissionI18n::getInnerForJoin('permission_id')." AND ".PermissionI18n::getTableField('lang')."='{lang}'".
                       " WHERE application='admin';");
       // Validators
       $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                           
                            "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorInteger(array("required"=>false)),
                            "name"=>new mfValidatorString(array("required"=>false)),                             
                           ),array("required"=>false)),
            'range' => new mfValidatorSchema(array(
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),
           'lang'=>new LanguagesExistsValidator(array(),'admin'), 
           'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"))),         
        ));
    }
  
}

