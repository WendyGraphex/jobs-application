<?php


class EmployeePortfolioDocumentCardFormFilter extends mfFormFilterBase {

    protected $user=null;
    
    function __construct($user,$defaults=array())
    {          
       $this->user=$user;
       parent::__construct($defaults);      
    }       
    
    function getUser()
    {
        return $this->user;
    }
           
    
    function configure()
    {      
       if (!$this->hasDefaults())
       {    
            $this->addDefaults(array(          
                 'order'=>array(
                                 
                 ), 
                 'equal'=>array(
                    // "is_active"=>'YES',
                 )   , 
                 'nbitemsbypage'=>"3",
            ));          
       }
       $this->setClass('EmployeePortfolioDocument');
       
       $this->setFields(array(
           
       ));
       
       //!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()
       $this->setQuery((string)mfQuery::getInstance()->select("{fields}")
                        ->from(EmployeePortfolioDocument::getTable())
                        ->left(EmployeePortfolioDocumentI18n::getInnerForJoin('document_id')." AND ".EmployeePortfolioDocumentI18n::getTableField('lang')."='{lang}'")
                        ->where(EmployeePortfolioDocument::getTableField('employee_user_id')."='{employee_user_id}'")
                        ->whereIf(!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser(),"is_public='Y'")
                      ); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                        "position"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),  
                      //  "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                      //  "phone"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                       
                      //  "city"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                                        
                   // "lastname"=>new mfValidatorString(array("required"=>false)),
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
          //  'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("3"=>"3","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

