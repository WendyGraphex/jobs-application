<?php


class EmployerAdvertCommentFormFilter extends mfFormFilter2 {

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
                         //   "id"=>"asc",    
                            "created_at"=>"desc",
                         //   "updated_at"=>"asc",
            ), 
            'equal'=>array(
               // "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployerAdvertComment');
       
       $this->setFields(array(
           'employee'=>array(     
              
              'search'=>array('conditions'=>
                                                 "(".
               Employee::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{employee}%%' OR ".
               Employee::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{employee}%%' OR ".
               Employee::getTableField('username')." COLLATE UTF8_GENERAL_CI LIKE '%%{employee}%%' OR ".
               Employee::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{employee}%%' ".
                                                 ")")
                                ),
            'employer'=>array(            
              'search'=>array('conditions'=>
                                                 "(".
               EmployerUser::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{employer}%%' OR ".
               EmployerUser::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{employer}%%' OR ".
               EmployerUser::getTableField('username')." COLLATE UTF8_GENERAL_CI LIKE '%%{employer}%%' OR ".
               EmployerUser::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{employer}%%' ".
                                                 ")")
                                ),                    
       ));       
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
              
               // "firstname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
              //  "employeee"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
              //  "email"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
              //  "phone"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
              //  "address1"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
              //  "address2"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
              //  "city"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                  
                  "employee"=>new mfValidatorString(array("required"=>false)),
                  "employer"=>new mfValidatorString(array("required"=>false)),
                                          
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
       $this->setQuery(mfQuery::getInstance()->select('{fields}')
                       ->from(EmployerAdvertCommentI18n::getTable())
                       ->inner(EmployerAdvertCommentI18n::getOuterForJoin('comment_id'))
                       ->inner(EmployerAdvertComment::getOuterForJoin('employee_user_id'))
                       ->inner(EmployerAdvertComment::getOuterForJoin('employer_user_id'))
                       ->inner(EmployerAdvertI18n::getTable()." ON ".EmployerAdvertI18n::getTableField('advert_id')."=".EmployerAdvertComment::getTableField('employer_advert_id'))
                       ->where(EmployerAdvertI18n::getTableField('lang')."=".EmployerAdvertComment::getTableField('employer_advert_lang')                               
                                ) 
                       ); 
    }
    
   
}

