<?php


class GoogleMapRequestFormFilter extends mfFormFilterBase {

   
    
    function configure()
    {                    
      
       $this->setDefaults(array(            
            'order'=>array(
                            "id"=>"desc",                        
            ),            
            'equal'=>array(
                    
            ),
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('GoogleMapAddress');
       $this->setFields(array('address'=>array(
                                            'class'=>'GoogleMapAddress',
                                            'search'=>array('conditions'=>                                                 
                                                 GoogleMapAddress::getTableField('address')." COLLATE UTF8_GENERAL_CI LIKE '%%{address}%%' "                                             
                                                 )
                               ),                              
                             ));
       $this->setQuery("SELECT * FROM ".GoogleMapAddress::getTable().                                                                       
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                                                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                                                      //  "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                                      //  "value"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                                                       ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                            "address"=>new mfValidatorString(array("required"=>false)),                            
                            "signature"=>new mfValidatorString(array("required"=>false)),  
                            "lat"=>new mfValidatorString(array("required"=>false)),                            
                            "lng"=>new mfValidatorString(array("required"=>false)),                            
                            "error"=>new mfValidatorString(array("required"=>false)),         
                            ),array("required"=>false)),           
            'range' => new mfValidatorSchema(array(   
                            "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false,"with_time"=>true)),                            
                           // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                          //  "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"active_YES","NO"=>"active_NO"),"key"=>true,"required"=>false)),          
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                        
            'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   /* function getQuery()
    {
        if ($this->query_valid)
            return $this->query; 
        if ($this['range']['created_at']['from']->getValue())
            $this->values['range']['created_at']['from']=$this['range']['created_at']['from']->getValue()." 00:00:00";
        return parent::getQuery();
    }*/
    
}

