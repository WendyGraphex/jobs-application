<?php


class CustomerAcademyCourseFormFilter extends mfFormFilterBase {

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
       $this->setClass('CustomerAcademyCourseI18n');
       
       $this->setFields(array(
           
       ));
       $this->setQuery("SELECT {fields} FROM ".CustomerAcademyCourseI18n::getTable().                                         
                       " INNER JOIN ".CustomerAcademyCourseI18n::getOuterForJoin('teacher_user_id').                            
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
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
                      "published_at"=>new mfValidatorChoice(array("choices"=>array(""=>"","IS_NULL"=>__("Not published"),"IS_NOT_NULL"=>__("Published")),"key"=>true,"required"=>false)),
                         "refused_at"=>new mfValidatorChoice(array("choices"=>array(""=>"","IS_NULL"=>__("Not refused"),"IS_NOT_NULL"=>__("Refused")),"key"=>true,"required"=>false)),
                   "committed_at"=>new mfValidatorChoice(array("choices"=>array(""=>"","IS_NULL"=>__("Not committed"),"IS_NOT_NULL"=>__("Committed")),"key"=>true,"required"=>false)),
                  
                     'lang'=>new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>LanguageUtils::getFormattedFrontendLanguages()->unshift(array(''=>__('All'))))),
                            ),array("required"=>false)),             
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

