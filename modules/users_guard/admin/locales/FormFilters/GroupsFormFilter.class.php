<?php

class GroupsFormFilter extends mfFormFilterBase {
 
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
       // Base Query
       $this->setClass("Group");
       $this->setQuery("SELECT {fields} FROM ".Group::getTable().
                       " LEFT JOIN ".GroupI18n::getInnerForJoin('group_id')." AND ".GroupI18n::getTableField('lang')."='{lang}'".
                       " WHERE application='admin';");
       // Validators
       $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                          //  "application"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorInteger(array("required"=>false)),
                            "name"=>new mfValidatorString(array("required"=>false)), 
                            "title"=>new mfValidatorString(array("required"=>false)),
                            "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"required"=>false)),
                         //   "application"=>new mfValidatorChoice(array("choices"=>array(""=>"","admin"=>"admin","frontend"=>"frontend"),"required"=>false)),
                           ),array("required"=>false)),
           'range' => new mfValidatorSchema(array(
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),
            'lang'=>new LanguagesExistsValidator(array(),'admin'), 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"))),         
        ));
    }
  
}

