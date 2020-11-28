<?php

class SiteCurrencyFormFilter extends mfFormFilterBase {
 
 
    function configure()
    {
        $this->setDefaults(array(
                       'order'=>array(
                           "id"=>"asc",
                           "rate"=>"asc",
                           "code"=>"asc",
                           "lang"=>"asc",
                           "created_at"=>"asc",
                           "updated_at"=>"asc",
                           ),
                      'nbitemsbypage'=>"*",
       ));
       // Base Query
       $this->setQuery("SELECT * FROM ".SiteCurrency::getTable().";");
       // Validators 
       $this->setValidators(array(       
            'order' => new mfValidatorSchema(array(
                                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                        "rate"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                        "is_active"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                        "code"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                        "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                        "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        ),array("required"=>false)),
            'equal' => new mfValidatorSchema(array(   
                            ),array("required"=>false)), 
            'search' => new mfValidatorSchema(array(   
                               "rate"=>new mfValidatorString(array("required"=>false)),           
                            
                            ),array("required"=>false)),  
             'equal' => new mfValidatorSchema(array(                   
                            "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),                     
                            ),array("required"=>false)),
            'range' => new mfValidatorSchema(array(              
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),
           'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>"5","10"=>"10","20"=>"20","*"=>"*",))),         
        ));
    }
}


