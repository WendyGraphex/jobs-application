<?php


class SystemEmailModelsFormFilter extends mfFormFilterBase {

    protected $language=null,$objects=array();
    
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
    
       $this->objects=array('SystemModelEmailI18n','SystemModelEmail');
       $this->setDefaults(array(
            'lang'=>$this->getLanguage(),     
            'order'=>array(
                            "id"=>"asc",  
                           
            ),            
            'nbitemsbypage'=>"10",
       ));          
       $this->setClass('SystemModelEmail');
       $this->setFields(array(
                'name'=>array(
                    'class'=>'SystemModelEmail',
                    'search'=>array('conditions'=> 
                                SystemModelEmail::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%'"
                              )
                    ),
                'value'=>array(
                    'class'=>'SystemModelEmailI18n',
                    'search'=>array('conditions'=> 
                                SystemModelEmailI18n::getTableField('value')." COLLATE UTF8_GENERAL_CI LIKE '%%{value}%%'"
                              )
                    ),
               ));
       $this->setQuery("SELECT {fields} FROM ".SystemModelEmail::getTable().                      
                       " LEFT JOIN ".SystemModelEmailI18n::getInnerForJoin('model_id'). " AND ".SystemModelEmailI18n::getTableField('lang')."='{lang}'".                                                        
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "value"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                          //  "subject"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                          //  "link"=>new mfValidatorString(array("required"=>false)),                            
                          //  "title"=>new mfValidatorString(array("required"=>false)),
                            "name"=>new mfValidatorString(array("required"=>false)),
                            "value"=>new mfValidatorString(array("required"=>false)),
                        //    "subject"=>new mfValidatorString(array("required"=>false)),
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(
                            "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                            "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
             ),array("required"=>false)),                                                      
            'equal' => new mfValidatorSchema(array(   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                              
            'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
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

