<?php


class EmailerSpoolerFormFilter extends mfFormFilterBase {

   
   
    function configure()
    {                           
       $this->setDefaults(array(            
            'order'=>array(
                            "id"=>"desc",                        
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('EmailerSpoolerSchedulerEmailSent');
       $this->setFields(array('to'=>'EmailerSpooler','site_id'=>'EmailerSpooler'));
       $this->setQuery("SELECT {fields} FROM ".EmailerSpoolerSchedulerEmailSent::getTable().
                       " INNER JOIN ".EmailerSpoolerSchedulerEmailSent::getOuterForJoin('email_id').                                                                       
                       " INNER JOIN ".EmailerSpooler::getOuterForJoin('site_id').
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                                                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                                                        "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                                      //  "value"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                                                       ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                            "to"=>new mfValidatorString(array("required"=>false)),                            
                          //  "link"=>new mfValidatorString(array("required"=>false)),                            
                          //  "title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                          //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                           // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                            "site_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+EmailerSpooler::getSitesForSelect()->toArray(),"key"=>true,"required"=>false)),                            
                            "has_error"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),                            
                            "is_sent"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                        
            'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
    function getObjectsForPager()
    {
        return $this->objects;
    }
    
    function hasObject($name)
    {             
        return in_array($name,$this->objects);
    }
    
    
}

