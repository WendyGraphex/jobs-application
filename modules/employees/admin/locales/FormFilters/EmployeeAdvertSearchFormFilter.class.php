<?php


class EmployeeAdvertSearchFormFilter extends mfFormFilterBase {

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
               // "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployeeAdvertSearch');
       
       $this->setFields(array(
           
       ));
       $this->setQuery("SELECT {fields} FROM ".EmployeeAdvertSearch::getTable().     
                       " LEFT JOIN ".EmployeeAdvertSearch::getOuterForJoin('employee_user_id').
                       " LEFT JOIN ".EmployeeAdvertSearch::getOuterForJoin('employer_user_id').
                       " LEFT JOIN ".EmployeeAdvertSearch::getOuterForJoin('category_id').
                       " LEFT JOIN ".EmployeeWorkCategoryI18n::getInnerForJoin('category_id')." AND ".EmployeeWorkCategoryI18n::getTableField('lang')."='{lang}'".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
               // "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
            ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                                  
                            ),array("required"=>false)),                             
                'range' => new mfValidatorSchema(array(
                    "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                    "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                 ),array("required"=>false)),                                                         
                'equal' => new mfValidatorSchema(array(                   
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

