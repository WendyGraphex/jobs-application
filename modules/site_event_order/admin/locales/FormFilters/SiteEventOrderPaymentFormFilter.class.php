<?php


class SiteEventOrderPaymentFormFilter extends mfFormFilterBase {

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
                          //  "id"=>"asc",   
                            "created_at"=>"desc",
                          //  "updated_at"=>"asc",
            ), 
            'equal'=>array(
                "is_active"=>'',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('SiteEventOrderPayment');
       
       $this->setFields(array(
          ));
       $this->setQuery("SELECT {fields} FROM ".SiteEventOrderPayment::getTable().  
                       " LEFT JOIN ".SiteEventOrderPayment::getOuterForJoin('event_user_id').
                       " INNER JOIN ".SiteEventOrderPayment::getOuterForJoin('event_id').
                       " LEFT JOIN ".SiteEventI18n::getInnerForJoin('event_id')." AND ".SiteEventI18n::getTableField('lang')."='{lang}'".
                     //  " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').
                    //   " LEFT JOIN ".SiteEventOrder::getOuterForJoin('method_id').  
                       " WHERE ".SiteEventOrderPayment::getTableField('event_user_id')." IS NOT NULL".
                       ";"); 
       // Validators
       $this->setValidators(array(
        'order' => new mfValidatorSchema(array(
            "id" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "created_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
            "updated_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
        ), array("required" => false)),
        'search' => new mfValidatorSchema(array(
           
          
        ), array("required" => false)),
        'equal'=>new mfValidatorSchema(array(                        
               
            ), array("required" => false)),
        'range' => new mfValidatorSchema(array(
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),
        'nbitemsbypage' => new mfValidatorChoice(array("choices" => array("5" => 5, "10" => 10, "20" => 20, "50" => 50, "100" => 100, "250" => 250))),
    ));         
    }
    
   
}


