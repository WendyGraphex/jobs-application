<?php


class EmployerAdvertPopularFormFilter extends mfFormFilterBase {

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
       $this->setClass('EmployerAdvertPopular');
       
       $this->setFields(array(
           
       ));
        $this->setQuery("SELECT {fields} FROM ".EmployerAdvertPopular::getTable().    
                       " INNER JOIN ".EmployerAdvertPopular::getOuterForJoin('advert_id').    
                       " INNER JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id')." AND ".EmployerAdvertPopular::getTableField('lang')."=".EmployerAdvertPopular::getTableField('lang').    
                       " LEFT JOIN ".EmployerAdvertPopular::getOuterForJoin('employee_user_id').     
                       " LEFT JOIN ".EmployerAdvertPopular::getOuterForJoin('employer_user_id').                         
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
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

