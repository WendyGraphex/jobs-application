<?php


class CustomerEmployerMessageFormFilter extends mfFormFilterBase {

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
                // 'sender'=>'EMPLOYEE',
            )   ,
            'notequal'=>array(
               // "is_active"=>'YES',
                 'sender'=>'EMPLOYER',
            )   ,            
            'nbitemsbypage'=>"20",
       ));         
       $this->setClass('CustomerEmployerMessage');
       
       $this->setFields(array(
            /*  'sender'=>array(
                        'class'=>'CustomerEmployerMessage',
                        'equal'=>array('conditions'=>CustomerEmployerMessage::getTableField('sender')."!{sender}")
                      ),      */
          
           ));
       $this->setQuery("SELECT {fields} FROM ". CustomerEmployerMessage::getTable().  
                       " LEFT JOIN ". CustomerEmployerMessage::getOuterForJoin('employee_user_id').
                       " LEFT JOIN ". CustomerEmployerMessage::getOuterForJoin('user_id').
                       " WHERE ".CustomerEmployerMessage::getTableField('employer_user_id')."='{employer_user_id}' ".                                   
                                    " AND ".CustomerEmployerMessage::getTableField('state')."='SENT' AND deleted_at IS NULL AND employer_deleted_at IS NULL".  
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                        "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),  
                      /*  "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "phone"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                       
                        "city"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),*/
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                      
                    /* "firstname"=>new mfValidatorString(array("required"=>false)),
                     "lastname"=>new mfValidatorString(array("required"=>false)),
                     "email"=>new mfValidatorString(array("required"=>false)),
                     "phone"=>new mfValidatorString(array("required"=>false)),     */                                  
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                   "sender"=>new mfValidatorChoice(array("choices"=>array(''=>'','EMPLOYEE'=>__("Send messages"),'EMPLOYER'=>__("Employer"),'ADMIN'=>__('Admin')),"key"=>true,"required"=>false)),
                 
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                 //   "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),    
             'notequal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                 //   "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                        "sender"=>new mfValidatorChoice(array("choices"=>array(''=>'','EMPLOYEE'=>__("Send messages"),'EMPLOYER'=>__("Employer"),'ADMIN'=>__('Admin')),"key"=>true,"required"=>false)),
                 
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
    
     
   
}

