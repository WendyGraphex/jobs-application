<?php


class PartnerEmployeeAdvertControllerFormFilter extends mfFormFilterBase {

      
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
       if (!$this->hasDefaults())
       {    
            $this->setDefaults(array(                  
                 'order'=>array(
                                 "created_at"=>"desc",                        
                 ), 
                 'equal'=>array(
                    // "is_active"=>'YES',
                      'lang'=>$this->getUser()->getLanguage(),
                 )   , 
                 'nbitemsbypage'=>"20",
            ));          
       }              
       
       $this->setFields(array(
                       
          
       ));
       
      
       $this->setClass('EmployeeAdvertI18n');
       $this->setQuery("SELECT {fields} FROM ".EmployeeAdvertI18n::getTable().  
                       " INNER JOIN ".EmployeeAdvertI18n::getOuterForJoin('advert_id').
                       " INNER JOIN ".EmployeeAdvert::getOuterForJoin('employee_user_id').                     
                       " WHERE ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                        
                            " AND ".EmployeeAdvert::getTableField('status')."='ACTIVE'".
                            " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".                          
                       ";");       
      
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
                    'lang'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> LanguageUtils::getFormattedActiveFrontendLanguages()->unshift(array(''=>__("All languages"))))),
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                  //  "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),                 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
     
}

