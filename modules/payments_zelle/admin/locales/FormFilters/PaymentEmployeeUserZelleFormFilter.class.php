<?php


class PaymentEmployeeUserZelleFormFilter extends mfFormFilterBase{
   
    
    function configure()
    {                    
       $this->setDefaults(array(            
            'order'=>array(
                            "created_at"=>"desc",  
                        
            ),            
            'nbitemsbypage'=>"25",
       ));          
       $this->setClass('PaymentEmployee');
       $this->setFields(array());
       $this->setQuery("SELECT {fields} FROM ". PaymentEmployee::getTable().           
                       " INNER JOIN ".PaymentEmployee::getOuterForJoin('method_id').    
                       " INNER JOIN ".PaymentEmployee::getOuterForJoin('employee_user_id').    
                       " WHERE ".PaymentMethod::getTableField('name')."='zelle'".
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
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","25"=>"25","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
}
