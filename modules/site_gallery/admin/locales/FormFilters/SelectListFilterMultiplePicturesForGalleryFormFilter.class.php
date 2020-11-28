<?php


class SelectListFilterMultiplePicturesForGalleryFormFilter extends mfFormFilterBase {
     
   
    function configure()
    {       
       $this->addDefaults(array(      
                      'order'=>array("id"=>"asc"),
                      'nbitemsbypage'=>"*",
       ));    
       // Base Query  
       $this->setFields(array('id'=>"SitePicture"));
       // Optional Objects   
       $this->setQuery("SELECT {fields} FROM ".SitePicture::getTable().
                       " LEFT JOIN ".SitePictureI18n::getInnerForJoin('picture_id')." AND lang='{lang}'".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
            "selected"=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selected')),array("required"=>false)),          
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                            "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                        
                            "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                            "id"=>new mfValidatorString(array("required"=>false)), 
                            "name"=>new mfValidatorString(array("required"=>false)),  
                            "title"=>new mfValidatorString(array("required"=>false)),                                                                                                                                          
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            "start_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),                             
                            
            'equal' => new mfValidatorSchema(array(                               
                            "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO",),"required"=>false,"key"=>true)),
                            ),array("required"=>false)),                                        
            'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"required"=>false,"key"=>true)),                    
        ));       
    }
}

