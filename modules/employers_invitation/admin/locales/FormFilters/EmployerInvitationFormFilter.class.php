<?php


class EmployerInvitationFormFilter extends mfFormFilterBase {

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
       $this->setClass('EmployerInvitation');
       
       $this->setFields(array(
           'query'=>array(            
              'search'=>array('conditions'=>
                                                 "(".
               EmployerInvitation::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' OR ".
               EmployerInvitation::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' OR ".             
               EmployerInvitation::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' OR ".
               EmployerInvitation::getTableField('phone')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' OR ".
               EmployerInvitation::getTableField('state')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' OR ".
               EmployerInvitation::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' ".
                                                 ")")
                                ),
                    
               
          
              'profession'=>array(                       
                        'search'=>array('conditions'=>EmployerInvitation::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '%%{city}%%' ")
                        ),
       ));
       $this->setQuery("SELECT {fields} FROM ".EmployerInvitation::getTable().                            
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                "firstname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
              //  "email"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
              //  "phone"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "race"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "attending"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "level"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "has_experience"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
             //   "adress1"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
             //   "adress2"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
             //   "city"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                "id"=>new mfValidatorInteger(array("required"=>false)),
                    "query"=>new mfValidatorString(array("required"=>false)),
                  //  "lastname"=>new mfValidatorString(array("required"=>false)),
                  //  "email"=>new mfValidatorString(array("required"=>false)),
                  //  "phone"=>new mfValidatorString(array("required"=>false)),
                    "race"=>new mfValidatorString(array("required"=>false)),
                    "attending"=>new mfValidatorString(array("required"=>false)),
                    "level"=>new mfValidatorString(array("required"=>false)),
                    "fax"=>new mfValidatorString(array("required"=>false)),
                 //   "adress1"=>new mfValidatorString(array("required"=>false)),
                 //   "adress2"=>new mfValidatorString(array("required"=>false)),
                 //   "city"=>new mfValidatorString(array("required"=>false)),
                    "profession"=>new mfValidatorString(array("required"=>false)),
               // "number_of_try"=>new mfValidatorString(array("required"=>false)),    
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                          //  "link"=>new mfValidatorString(array("required"=>false)),                            
                          //  "title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
                'range' => new mfValidatorSchema(array(   
                            "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
                'equal' => new mfValidatorSchema(array(
                     "has_experience"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                   // "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                  //  "status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                    
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

