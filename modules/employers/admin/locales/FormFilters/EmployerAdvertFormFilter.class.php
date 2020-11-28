<?php


class EmployerAdvertFormFilter extends mfFormFilterBase {

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
                            "created_at"=>"desc",                          
            ), 
            'equal'=>array(
               "published_at"=>"IS_NULL",
               "refused_at"=>"IS_NULL",
               "committed_at"=>"IS_NOT_NULL"
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployerAdvertI18n');
       
       $this->setFields(array(
            "published_at"=>"EmployerAdvert",
             "refused_at"=>"EmployerAdvert",
            "reference"=> 'EmployerAdvert',
             "committed_at"=>"EmployerAdvert",
           'lastname'=>array(
                            'class'=>'EmployerUser',
                            'search'=>array('conditions'=>
                                                               "(".
                             EmployerUser::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
                             EmployerUser::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
                             EmployerUser::getTableField('mobile')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
                             EmployerUser::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%'".
                                                               ")")
            ),
       ));
       $this->setQuery("SELECT {fields} FROM ".EmployerAdvert::getTable().    
                       " INNER JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id').
                       " INNER JOIN ".EmployerAdvert::getOuterForJoin('employer_user_id').
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                        "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),  
                      //  "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                      //  "phone"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                       
                      //  "city"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                      
                     "reference"=>new mfValidatorString(array("required"=>false)),
                      "lastname"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                         "published_at"=>new mfValidatorChoice(array("choices"=>array(""=>"","IS_NULL"=>__("Not published"),"IS_NOT_NULL"=>__("Published")),"key"=>true,"required"=>false)),
                         "refused_at"=>new mfValidatorChoice(array("choices"=>array(""=>"","IS_NULL"=>__("Not refused"),"IS_NOT_NULL"=>__("Refused")),"key"=>true,"required"=>false)),
                   "committed_at"=>new mfValidatorChoice(array("choices"=>array(""=>"","IS_NULL"=>__("Not committed"),"IS_NOT_NULL"=>__("Committed")),"key"=>true,"required"=>false)),
                  
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                  //  "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),     
           // 'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));                  
    }
    
   
}

