<?php


class EmployerFavouriteFormFilter extends mfFormFilter2 {

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
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployerFavourite');
       
       $this->setFields(array(
               
           ));      
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                       
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                      
                                                
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                   // "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        )); 
       
       
        $this->setQuery(mfQuery::getInstance()
                        ->select("{fields}")
                        ->from(EmployerFavourite::getTable())
                        ->where(EmployerFavourite::getTableField('employer_user_id')."='{employer_user_id}'")); 
    }
    
   
}

