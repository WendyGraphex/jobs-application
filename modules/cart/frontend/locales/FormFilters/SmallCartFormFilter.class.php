<?php


class SmallCartFormFilter extends mfFormFilterBase {

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
       ));          
       $this->setClass('CartQuotation');
       
       $this->setFields(array(
          
         
           ));
       $this->setQuery("SELECT {fields} FROM ".CartQuotation::getTable(). 
                     " INNER JOIN ".CartQuotation::getOuterForJoin('employee_user_id').   
                       " INNER JOIN ".CartQuotation::getOuterForJoin('quotation_id').   
                       " LEFT JOIN ".SaleEmployeeQuotation::getOuterForJoin('project_id').  
                       " LEFT JOIN ".SaleEmployeeQuotation::getOuterForJoin('employee_advert_id').  
                       " LEFT JOIN ".SaleEmployeeQuotation::getOuterForJoin('employer_advert_id').  
                       " LEFT JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id')." AND ". EmployerAdvertI18n::getTableField('lang')."=".SaleEmployeeQuotation::getTableField('employer_advert_lang').  
                       " LEFT JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id')." AND ". EmployeeAdvertI18n::getTableField('lang')."=".SaleEmployeeQuotation::getTableField('employee_advert_lang').                                        
                       " WHERE cart_id='{cart_id}' ".
                            " AND ".CartQuotation::getTableField('status')."='ACTIVE'".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
       'order' => new mfValidatorSchema(array(
                      "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                 
                   //  "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    // "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                   //  "id"=>new mfValidatorInteger(array("required"=>true)),
                   
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                        //     "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                        //     "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),                   
                            ),array("required"=>false)),                                                     
        ));              
    }
    
   
}

