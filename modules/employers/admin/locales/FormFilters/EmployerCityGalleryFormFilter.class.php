<?php


class EmployerCityGalleryFormFilter extends mfFormFilterBase {

    
    protected $language=null;
    
    function __construct($language)
    {
       $this->language=$language;     
       parent::__construct();      
    }
    
    function getLanguage()
    {
      return $this->language;
    }  
    
    function configure()
    {                         
       $this->setDefaults(array(
            'lang'=>$this->getLanguage(),     
            'order'=>array(
                            "created_at"=>"asc",                        
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('EmployerCityGallery');
       
       $this->setFields(array(
                        
           ));
       $this->setQuery("SELECT {fields} FROM ".EmployerCityGallery::getTable().
                       " LEFT JOIN ".EmployerCityGalleryI18n::getInnerForJoin('gallery_id')." AND lang='{lang}'".    
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                    "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                    "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                       "id"=>new mfValidatorString(array("required"=>false)),
                        "name"=>new mfValidatorString(array("required"=>false)),                            
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
                    
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+EmployerFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+EmployerFavoriteUtils::getEmployerI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+EmployerFavoriteUtils::getEmployerI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                        //     "supplier_id"=>new mfValidatorChoice(array("choices"=>EmployerUtils::getSuppliersForSelect()->unshift(array(''=>'')),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),    
            'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

