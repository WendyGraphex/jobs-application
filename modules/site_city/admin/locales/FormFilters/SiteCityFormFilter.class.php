<?php


class SiteCityFormFilter extends mfFormFilterBase {

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
                "id"=>"asc", 
                "name"=>"asc", 
                "position"=>"asc",        
                "title"=>"asc",
                "created_at"=>"asc",
                "updated_at"=>"asc",                
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('SiteCity');
       $this->setFields(array(
              'title'=>array(
                        'class'=>'SiteCityI18n',
                        'search'=>array('conditions'=>SiteCityI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' ")
                            ),
              'name'=>array(
                        'class'=>'SiteCity',
                        'search'=>array('conditions'=>SiteCity::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%' ")
                            ),
       ));
       $this->setQuery("SELECT {fields} FROM ".SiteCity::getTable().                      
                       " LEFT JOIN ".SiteCityI18n::getInnerForJoin('city_id'). " AND ".SiteCityI18n::getTableField('lang')."='{lang}'".                                                        
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                    "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                    "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                    "position"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                    "created_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),
                    "updated_at" => new mfValidatorChoice(array("choices" => array("asc", "desc"), "required" => false)),                          
                ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                            "name"=>new mfValidatorString(array("required"=>false)),                            
                            "title"=>new mfValidatorString(array("required"=>false)),   
                            "position"=>new mfValidatorInteger(array("required"=>false)), 
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
    
   
}

