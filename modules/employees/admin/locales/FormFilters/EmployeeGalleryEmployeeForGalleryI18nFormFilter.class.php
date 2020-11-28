<?php


class EmployeeGalleryEmployeeForGalleryI18nFormFilter extends mfFormFilterBase {
 
    
    function configure()
    {                         
       $this->setDefaults(array(           
            'order'=>array(
                "id"=>"asc",
                "created_at"=>"asc",
                "updated_at"=>"asc",
                            "position"=>"asc",                        
            ),            
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployeeGalleryEmployee');
       
       $this->setFields(array(
                        
           ));
       $this->setQuery("SELECT {fields} FROM ".EmployeeGalleryEmployee::getTable().
                       " INNER JOIN ".EmployeeGalleryEmployee::getOuterForJoin('employee_user_id').                     
                       " WHERE ".EmployeeGalleryEmployee::getTableField('gallery_id')."='{gallery_id}'".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                    "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                    "position"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                      // "id"=>new mfValidatorString(array("required"=>false)),
                     "position"=>new mfValidatorString(array("required"=>false)),                            
                          //  "link"=>new mfValidatorString(array("required"=>false)),                            
                          //  "title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                          "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false,'formatter'=>'DateFormatter')),                            
                          "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false,'formatter'=>'DateFormatter')),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                   // "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                    //"status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                    
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                        //     "employee_id"=>new mfValidatorChoice(array("choices"=>ProductUtils::getEmployeesForSelect()->unshift(array(''=>'')),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),    
            // 'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100"),"key"=>true)),                    
        ));              
    }
    
   
}


