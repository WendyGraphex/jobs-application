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
               // "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployerAdvertI18n');
       
       $this->setFields(array(
                       
          
           ));
       $this->setQuery("SELECT {fields} FROM ".EmployerAdvert::getTable().  
                       " INNER JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".EmployerAdvert::getTableField('employer_user_id')."='{employer_user_id}' AND ".EmployerAdvert::getTableField('state')."!='UPLOAD' ".                        
                            " AND ".EmployerAdvert::getTableField('status')."='ACTIVE'".
                            " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
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
                   //  "firstname"=>new mfValidatorString(array("required"=>false)),
                   //  "lastname"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                  //  "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),     
           // 'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

