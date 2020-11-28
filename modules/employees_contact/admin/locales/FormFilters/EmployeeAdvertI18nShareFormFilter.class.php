<?php


class EmployeeAdvertI18nShareFormFilter extends mfFormFilterBase {

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
                          //  "id"=>"asc",    
                            "created_at"=>"desc",
                         //   "updated_at"=>"asc",
            ), 
            'equal'=>array(
               // "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployeeAdvertI18nShare');
       
       $this->setFields(array(
           'lastname'=>array(            
              'search'=>array('conditions'=>
                                                 "(".
               EmployeeAdvertI18nShare::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               EmployeeAdvertI18nShare::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),
           'firstname'=>array(             
              'search'=>array('conditions'=>
                                                 "(".
               EmployeeAdvertI18nShare::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               EmployeeAdvertI18nShare::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),  
          
           'email'=>array(                     
                        'search'=>array('conditions'=>EmployeeAdvertI18nShare::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{email}%%' ")
             ),
       ));
       $this->setQuery("SELECT {fields} FROM ".EmployeeAdvertI18nShare::getTable().    
                       " INNER JOIN ".EmployeeAdvertI18nShare::getOuterForJoin('advert_i18n_id').  
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                
                "firstname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "email"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),             
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                "id"=>new mfValidatorInteger(array("required"=>false)),
                  "firstname"=>new mfValidatorString(array("required"=>false)),
                  "lastname"=>new mfValidatorString(array("required"=>false)),
                  "email"=>new mfValidatorString(array("required"=>false)),                                   
                            ),array("required"=>false)),                             
                'range' => new mfValidatorSchema(array(
                    "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                    "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                 ),array("required"=>false)),                                                         
                'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                   // "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                  //  "status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                    
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getEmployeeFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

