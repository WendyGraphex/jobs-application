<?php


class CustomerMessageFormFilter extends mfFormFilterBase {

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
                           // "id"=>"asc",
                            "created_at"=>"desc",                        
            ), 
            'notequal'=>array(
               // "is_active"=>'YES',
                // 'sender'=>'ADMIN',
            )   ,           
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('CustomerMessage');
       
       $this->setFields(array(
          /*  'sender'=>array(
                        'class'=>'CustomerMessage',
                        'equal'=>array('conditions'=>CustomerMessage::getTableField('sender')."{sender}")
                        ),*/
           /*   'lastname'=>array(
              'class'=>'CustomerUser',
              'search'=>array('conditions'=>
                                                 "(".
               CustomerUser::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               CustomerUser::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),
           'firstname'=>array(
              'class'=>'CustomerUser',
              'search'=>array('conditions'=>
                                                 "(".
               CustomerUser::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               CustomerUser::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),
           'username'=>array(
                        'class'=>'CustomerUser',
                        'search'=>array('conditions'=>CustomerUser::getTableField('username')." COLLATE UTF8_GENERAL_CI LIKE '%%{username}%%' ")
                        ),  
           'email'=>array(
                        'class'=>'CustomerUser',
                        'search'=>array('conditions'=>CustomerUser::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{email}%%' ")
                        ),
           'phone'=>array(
                        'class'=>'CustomerUser',
                        'search'=>array('conditions'=>CustomerUser::getTableField('phone')." COLLATE UTF8_GENERAL_CI LIKE '%%{phone}%%' ")
                        ),
           'adress1'=>array(
                        'class'=>'CustomerUser',
                        'search'=>array('conditions'=>CustomerUser::getTableField('adress1')." COLLATE UTF8_GENERAL_CI LIKE '%%{adress1}%%' ")
                        ),
           'adress2'=>array(
                        'class'=>'CustomerUser',
                        'search'=>array('conditions'=>CustomerUser::getTableField('adress2')." COLLATE UTF8_GENERAL_CI LIKE '%%{adress2}%%' ")
                        ),*/
           ));
       $this->setQuery("SELECT {fields} FROM ".CustomerMessage::getTable().   
                       " LEFT JOIN ".CustomerMessage::getOuterForJoin('employer_user_id').                     
                       " LEFT JOIN ".CustomerMessage::getOuterForJoin('employee_user_id').      
                       " LEFT JOIN ".CustomerMessage::getOuterForJoin('user_id').   
                       " WHERE deleted_at IS NULL".
                    //   " WHERE ".CustomerMessage::getTableField('user_id')." IS NOT NULL".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                    "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)), 
                    "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                  //  "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    //  "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                     "id"=>new mfValidatorInteger(array("required"=>true)),
//                     "username"=>new mfValidatorString(array("required"=>true)),
//                     "firstname"=>new mfValidatorString(array("required"=>true)),
//                     "lastname"=>new mfValidatorString(array("required"=>true)),
//                     "email"=>new mfValidatorString(array("required"=>true)),
//                     "phone"=>new mfValidatorString(array("required"=>true)),
//                     "adress1"=>new mfValidatorString(array("required"=>true)),
//                     "adress2"=>new mfValidatorString(array("required"=>true)),
                // "number_of_try"=>new mfValidatorString(array("required"=>false)),    
                //  "id"=>new mfValidatorString(array("required"=>false)),                            
                //  "link"=>new mfValidatorString(array("required"=>false)),                            
                //  "title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                           "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                         //  "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                     "read_at"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","IS_NULL"=>__("Not read"),"IS_NOT_NULL"=>__("Read")))),
                       "sender"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","ADMIN"=>__("Admin."),"EMPLOYEE"=>__("Employee"),"EMPLOYER"=>__("Employer")))),
                   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),    
            'notequal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                 //   "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                         "sender"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","ADMIN"=>__("Admin."),"EMPLOYEE"=>__("Employee"),"EMPLOYER"=>__("Employer")))),
                   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),    
          //  'sender'=>new mfValidatorBoolean(),
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }       
    
    
}

