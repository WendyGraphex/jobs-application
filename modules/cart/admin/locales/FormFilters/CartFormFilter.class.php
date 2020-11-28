<?php


class CartFormFilter extends mfFormFilterBase {

       
    
    function configure()
    {                         
       $this->addDefaults(array(          
            'order'=>array(
                           // "id"=>"asc",     
                          //  "reference"=>"asc", 
                            "created_at"=>"desc", 
                         //   "updated_at"=>"asc",
                         //   "number_of_products"=>"asc",
            ), 
            'equal'=>array(
               // "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('Cart');
       
       $this->setFields(array(
          
         
           ));
       $this->setQuery("SELECT {fields} FROM ".Cart::getTable().                            
                       ";"); 
       // Validators 
       $this->setValidators(array(                   
            'order' => new mfValidatorSchema(array(
                     "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                     "reference"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)), 
                     "number_of_quotations"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    // "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
            ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                     "id"=>new mfValidatorInteger(array("required"=>false)),
                     "reference"=>new mfValidatorInteger(array("required"=>false)),
                   //  "number_of_products"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),
                     //"address"=>new mfValidatorString(array("required"=>false)),
            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                    "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                  //  "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
            ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                    "status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                   
                    'lang'=>new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>LanguageUtils::getFormattedActiveFrontendLanguages()->unshift(array(''=>'')))), 
            ),array("required"=>false)),                
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

