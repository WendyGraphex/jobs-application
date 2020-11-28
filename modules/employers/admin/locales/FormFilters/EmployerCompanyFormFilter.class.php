<?php


class EmployerCompanyFormFilter extends mfFormFilterBase {

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
                            "id"=>"asc",          
                            "name"=>"asc",
                            "commercial"=>"asc",
                            "email"=>"asc",
                            "phone"=>"asc", 
                            "created_at"=>"asc", 
                            "updated_at"=>"asc", 
            ), 
            'equal'=>array(
               // "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployerCompany');
       
       $this->setFields(array(
          
          'name'=>array(
                        'class'=>'EmployerCompany',
                        'search'=>array('conditions'=>EmployerCompany::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%' ")
                        ),
           'commercial'=>array(
                        'class'=>'EmployerCompany',
                        'search'=>array('conditions'=>EmployerCompany::getTableField('commercial')." COLLATE UTF8_GENERAL_CI LIKE '%%{commercial}%%' ")
                        ),
           'email'=>array(
                        'class'=>'EmployerCompany',
                        'search'=>array('conditions'=>EmployerCompany::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{email}%%' ")
                        ),
           'phone'=>array(
                        'class'=>'EmployerCompany',
                        'search'=>array('conditions'=>EmployerCompany::getTableField('phone')." COLLATE UTF8_GENERAL_CI LIKE '%%{phone}%%' ")
                        ),
            'address'=>array(
                        'class'=>'EmployerUser',
                        'search'=>array('conditions'=>"(".
                                EmployerUser::getTableField('address1')." COLLATE UTF8_GENERAL_CI LIKE '%%{address}%%' OR ".
                                EmployerUser::getTableField('address2')." COLLATE UTF8_GENERAL_CI LIKE '%%{address}%%' OR ".
                                EmployerUser::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '%%{address}%%' OR ".
                                EmployerUser::getTableField('postcode')." COLLATE UTF8_GENERAL_CI LIKE '%%{address}%%' "
                                )
                        ),
           ));
       $this->setQuery("SELECT {fields} FROM ".EmployerCompany::getTable().                            
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
       'order' => new mfValidatorSchema(array(
                "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
               // "username"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),  
                "commercial"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "email"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "phone"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "address"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)), 
                "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                     "id"=>new mfValidatorInteger(array("required"=>false)),
                   //  "username"=>new mfValidatorString(array("required"=>false)),
                     "name"=>new mfValidatorString(array("required"=>false)),
                     "commercial"=>new mfValidatorString(array("required"=>false)),
                     "email"=>new mfValidatorString(array("required"=>false)),
                     "phone"=>new mfValidatorString(array("required"=>false)),
                     "address"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(
                 "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                 "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
              ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                    "is_active"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"key"=>true,"required"=>false)),
                    "status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "employer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getEmployerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

