<?php


class SiteEventSpeakerUserFormFilter extends mfFormFilterBase {

    protected $user=null;
    
    function __construct($user)
    {          
       $this->user=$user;
       parent::__construct();      
    }       
    
    function getUser()
    {
        return $this->user;
    }
           
    
    function configure()
    {                         
       $this->addDefaults(array(          
            'order'=>array(
                            "id"=>"desc",                        
            ), 
            'equal'=>array(
              //  "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('SiteEventSpeakerUser');
       
       $this->setFields(array(
          
              'query'=>array(
              'class'=>'SiteEventSpeakerUser',
              'search'=>array('conditions'=>
                                                 "(".          
             SiteEventSpeakerUser::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
             SiteEventSpeakerUser::getTableField('query')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' OR ".
             SiteEventSpeakerUser::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%'".
                                                 ")")
                                ), 
           
           
           ));
       $this->setQuery("SELECT {fields} FROM ".SiteEventSpeakerUser::getTable().     
                     
                     //  " WHERE is_admin='NO' ".
                       ";"); 
          // Validators
          $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                "id" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
              
                "gender" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "firstname" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),               
                "lastname" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),              
                "created_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                "updated_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
               // "state" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                //"lastlogin" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            ), array("required" => false)),
            'search' => new mfValidatorSchema(array(
               
                "query" => new mfValidatorString(array("required" => false)),
                            
            ), array("required" => false)),
              'range' => new mfValidatorSchema(array(
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),
            'equal'=>new mfValidatorSchema(array(                        
                  "is_active"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
              
            ), array("required" => false)),
            'nbitemsbypage' => new mfValidatorChoice(array("choices" => array("5" => 5, "10" => 10, "20" => 20, "50" => 50, "100" => 100, "250" => 250))),
        ));               
    }
    
   
}


