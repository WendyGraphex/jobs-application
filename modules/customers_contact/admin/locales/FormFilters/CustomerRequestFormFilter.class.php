<?php


class CustomerRequestFormFilter extends mfFormFilterBase {

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
            ), 
            'equal'=>array(
               // "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('CustomerRequest');
       
       $this->setFields(array(
           'lastname'=>array(
              'class'=>'CustomerRequest',
              'search'=>array('conditions'=>
                                                 "(".
               CustomerRequest::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               CustomerRequest::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),
           'firstname'=>array(
              'class'=>'CustomerRequest',
              'search'=>array('conditions'=>
                                                 "(".
               CustomerRequest::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               CustomerRequest::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),
           'username'=>array(
                        'class'=>'CustomerRequest',
                        'search'=>array('conditions'=>CustomerRequest::getTableField('username')." COLLATE UTF8_GENERAL_CI LIKE '%%{username}%%' ")
                        ),  
           'email'=>array(
                        'class'=>'CustomerRequest',
                        'search'=>array('conditions'=>CustomerRequest::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{email}%%' ")
                        ),
           'phone'=>array(
                        'class'=>'CustomerRequest',
                        'search'=>array('conditions'=>CustomerRequest::getTableField('phone')." COLLATE UTF8_GENERAL_CI LIKE '%%{phone}%%' ")
                        ),
           'adress1'=>array(
                        'class'=>'CustomerRequest',
                        'search'=>array('conditions'=>CustomerRequest::getTableField('adress1')." COLLATE UTF8_GENERAL_CI LIKE '%%{adress1}%%' ")
                        ),
           'adress2'=>array(
                        'class'=>'CustomerRequest',
                        'search'=>array('conditions'=>CustomerRequest::getTableField('adress2')." COLLATE UTF8_GENERAL_CI LIKE '%%{adress2}%%' ")
                        ),
       ));
       $this->setQuery("SELECT {fields} FROM ".CustomerRequest::getTable().                            
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                     "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)), 
                     "username"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "firstname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "email"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    //  "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                     "id"=>new mfValidatorInteger(array("required"=>true)),
                     "username"=>new mfValidatorString(array("required"=>true)),
                     "firstname"=>new mfValidatorString(array("required"=>true)),
                     "lastname"=>new mfValidatorString(array("required"=>true)),
                     "email"=>new mfValidatorString(array("required"=>true)),
                     "phone"=>new mfValidatorString(array("required"=>true)),
                     "adress1"=>new mfValidatorString(array("required"=>true)),
                     "adress2"=>new mfValidatorString(array("required"=>true)),
                     "city"=>new mfValidatorString(array("required"=>true)),
                
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

