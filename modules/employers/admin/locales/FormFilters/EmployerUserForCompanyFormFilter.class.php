<?php


class EmployerUserForCompanyFormFilter extends mfFormFilterBase {

   
    function configure()
    {                         
       $this->addDefaults(array(          
            'order'=>array(
                            "id"=>"desc",                        
            ), 
            'equal'=>array(
                "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('EmployerUser');
       
       $this->setFields(array(
              'phone'=>array(
                        'class'=>'EmployerUser',
                        'search'=>array('conditions'=>
                                                           "(".
                         EmployerCompany::getTableField('phone')." COLLATE UTF8_GENERAL_CI LIKE '%%{phone}%%' OR ".
                         EmployerCompany::getTableField('mobile')." COLLATE UTF8_GENERAL_CI LIKE '%%{phone}%%' OR ".
                         EmployerCompany::getTableField('fax')." COLLATE UTF8_GENERAL_CI LIKE '%%{phone}%%' ".
                                                           ")")
              ), 
              'lastname'=>array(
                        'class'=>'EmployerUser',
                        'search'=>array('conditions'=>
                                                           "(".
                         EmployerUser::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
                         EmployerUser::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                           ")")
                                          ),               
           ));
       $this->setQuery("SELECT {fields} FROM ".EmployerUser::getTable().  
                       " INNER JOIN ".EmployerUser::getOuterForJoin('company_id').                     
                       " WHERE company_id='{company_id}'".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                    "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                    //  "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                "name"=>new mfValidatorString(array("required"=>true)),
                "firstname"=>new mfValidatorString(array("required"=>true)),
                "lastname"=>new mfValidatorString(array("required"=>true)),
                "email"=>new mfValidatorString(array("required"=>true)),
                "phone"=>new mfValidatorString(array("required"=>true)), 
               // "number_of_try"=>new mfValidatorString(array("required"=>false)),    
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                          //  "link"=>new mfValidatorString(array("required"=>false)),                            
                          //  "title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
                'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
                'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                    // "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                    // "status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                    
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "Employer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getEmployerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

