<?php


class EmployeeFormFilter extends mfFormFilterBase {

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
               // "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('Employee');
       
       $this->setFields(array(
                'name'=>array(
//                    'class'=>'CustomerCompany',
//                    'search'=>array('conditions'=> 
//                                CustomerCompany::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%'"
//                              )
                ),
              'lastname'=>array(
              'class'=>'Employee',
              'search'=>array('conditions'=>
                                                 "(".
               Employee::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               Employee::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),
           'firstname'=>array(
              'class'=>'Employee',
              'search'=>array('conditions'=>
                                                 "(".
               Employee::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               Employee::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),
           'username'=>array(
                        'class'=>'Employee',
                        'search'=>array('conditions'=>Employee::getTableField('username')." COLLATE UTF8_GENERAL_CI LIKE '%%{username}%%' ")
                        ),  
           'email'=>array(
                        'class'=>'Employee',
                        'search'=>array('conditions'=>Employee::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{email}%%' ")
                        ),
           'phone'=>array(
                        'class'=>'Employee',
                        'search'=>array('conditions'=>Employee::getTableField('phone')." COLLATE UTF8_GENERAL_CI LIKE '%%{phone}%%' ")
                        ),         
          
           ));
       $this->setQuery("SELECT {fields} FROM ".Employee::getTable().  
                       //" WHERE ".Employee::getTableField('company_id')."='{company_id}'".  
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                        "firstname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),  
                        "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "phone"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                       
                        "city"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                      
                     "firstname"=>new mfValidatorString(array("required"=>false)),
                     "lastname"=>new mfValidatorString(array("required"=>false)),
                     "email"=>new mfValidatorString(array("required"=>false)),
                     "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                    "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

