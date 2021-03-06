<?php


class EmployerUserPopularFormFilter extends mfFormFilterBase {

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
            'nbitemsbypage'=>"50",
       ));          
       $this->setClass('EmployerUserPopular');
       
       $this->setFields(array(
           
       ));
     $this->setQuery("SELECT {fields} FROM ".EmployerUserPopular::getTable().   
                       " INNER JOIN ".EmployerUserPopular::getOuterForJoin('user_id','page').                      
                       " LEFT JOIN ".EmployerUserPopular::getOuterForJoin('employee_user_id').     
                       " LEFT JOIN ".EmployerUserPopular::getOuterForJoin('employer_user_id','employer').  
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                                                   
                "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
              
                ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                                  
                            ),array("required"=>false)),                             
                'range' => new mfValidatorSchema(array(
                    "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                  
                 ),array("required"=>false)),                                                         
                'equal' => new mfValidatorSchema(array(                   
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

