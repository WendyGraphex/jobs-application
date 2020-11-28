<?php


 
class SaleTaxFormFilter extends mfFormFilterBase {
 
    
    function configure()
    {
        $this->setDefaults(array(
                       'order'=>array(),
                      'nbitemsbypage'=>"*",
       ));
        $this->setFields(array(
          
        ));
       // Base Query
       $this->setQuery("SELECT * FROM ".SaleTax::getTable().";");
       // Validators 
       $this->setValidators(array(       
            'order' => new mfValidatorSchema(array(
                                                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                                      
                                                        "rate"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                                       ),array("required"=>false)),
            'equal' => new mfValidatorSchema(array(   
                          
                            
                            ),array("required"=>false)),                              
             'search' => new mfValidatorSchema(array(   
                               "rate"=>new mfValidatorString(array("required"=>false)),           
                            
                            ),array("required"=>false)),   
           'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>"5","10"=>"10","20"=>"20","*"=>"*",))),         
        ));
    }
}


