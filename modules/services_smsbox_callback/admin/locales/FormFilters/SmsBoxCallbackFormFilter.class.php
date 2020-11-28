<?php

class SmsBoxCallbackFormFilter extends mfFormFilterBase {

    
    function configure()
    {                   
       
       $this->setDefaults(array(          
            'order'=>array(
                "id"=>"desc",                        
            ),            
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('SmsBoxCallback');
       $this->setFields(array());
       $this->setQuery("SELECT * FROM ". SmsBoxCallback::getTable().
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                           
                        ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                            //  "id"=>new mfValidatorString(array("required"=>false)),                            
                            "mobile"=>new mfValidatorString(array("required"=>false)),                            
                            "reference"=>new mfValidatorString(array("required"=>false)),                            
                        ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            // "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                        ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                            // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                            //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                            //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                            //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                        ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
}

