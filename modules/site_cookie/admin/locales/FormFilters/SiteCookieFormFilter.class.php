<?php


class SiteCookieFormFilter extends mfFormFilterBase {

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
                            "created_at"=>"asc",
                "id"=>"asc",
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('SiteCookie');
       $this->setFields(array(
                    
       ));      
       $this->setQuery("SELECT {fields} FROM ".SiteCookie::getTable().    
                       
                       ";");
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                                                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                                                         "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                                      //  "ended_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                          
                                                       // "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                                                       ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                             
                            "ip"=>new mfValidatorString(array("required"=>false)),
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                         "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false,'formatter'=>'DateFormatter')),                            
                        //  "ended_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false,'formatter'=>'DateFormatter')),                            
                                                          
                            ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getSupplierFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

