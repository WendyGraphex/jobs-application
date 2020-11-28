<?php


class PaymentBankwireFormFilter extends mfFormFilterBase{
   
    
    function configure()
    {                    
       $this->setDefaults(array(            
            'order'=>array(
                            "created_at"=>"desc",  
                        
            ),            
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('PaymentEmployerUser');
       $this->setFields(array());
       $this->setQuery("SELECT {fields} FROM ".PaymentEmployerUser::getTable().  
                       " INNER JOIN ".PaymentEmployerUser::getOuterForJoin('method_id').  
                       " WHERE ".PaymentMethod::getTableField('name')."='bankwire'".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                          //  "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                           // "is_active"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)), 
                            "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                           "id"=>new mfValidatorString(array("required"=>false)),
                         //  "name"=>new mfValidatorString(array("required"=>false)),
                      
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                         //   "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)), 
                         //   "is_active"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                        
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
}
