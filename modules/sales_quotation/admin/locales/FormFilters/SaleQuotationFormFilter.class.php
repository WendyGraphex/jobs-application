<?php


class SaleQuotationFormFilter extends mfFormFilterBase {

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
                "is_active"=>'',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('SaleEmployeeQuotation');
       
       $this->setFields(array(
          ));
       $this->setQuery("SELECT {fields} FROM ".SaleEmployeeQuotation::getTable(). 
                       " INNER JOIN ".SaleEmployeeQuotation::getOuterForJoin('employer_user_id'). 
                       " INNER JOIN ".SaleEmployeeQuotation::getOuterForJoin('employee_user_id'). 
                       " LEFT JOIN ".SaleEmployeeQuotation::getOuterForJoin('project_id'). 
                       " LEFT JOIN ".SaleEmployeeQuotation::getOuterForJoin('employee_advert_id').  
                       " LEFT JOIN ".SaleEmployeeQuotation::getOuterForJoin('employer_advert_id').  
                       " LEFT JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id')." AND ". EmployerAdvertI18n::getTableField('lang')."=".SaleEmployeeQuotation::getTableField('employer_advert_lang').  
                       " LEFT JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id')." AND ". EmployeeAdvertI18n::getTableField('lang')."=".SaleEmployeeQuotation::getTableField('employee_advert_lang').
                       ";"); 
       // Validators
       $this->setValidators(array(
        'order' => new mfValidatorSchema(array(
            "id" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "created_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),           
        ), array("required" => false)),
        'search' => new mfValidatorSchema(array(
            'id'=>new mfValidatorString(array('required'=>false)),
            'reference'=>new mfValidatorString(array('required'=>false)),
          
        ), array("required" => false)),
        'equal'=>new mfValidatorSchema(array(                        
               
            ), array("required" => false)),
        'range' => new mfValidatorSchema(array(
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),             
             ),array("required"=>false)),
        'nbitemsbypage' => new mfValidatorChoice(array("choices" => array("5" => 5, "10" => 10, "20" => 20, "50" => 50, "100" => 100, "250" => 250))),
    ));         
    }
    
   
}


