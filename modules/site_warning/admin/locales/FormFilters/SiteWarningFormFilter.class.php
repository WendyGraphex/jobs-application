<?php


class SiteWarningFormFilter extends mfFormFilterBase {

    protected $language=null;
    
    function __construct($language)
    {
       $this->language=$language;     
       parent::__construct();      
    }
    
    function getWarning()
    {
      return $this->language;
    }
        
   
    
    function configure()
    {                         
       $this->setDefaults(array(
            'lang'=>$this->getWarning(),     
            'order'=>array(
             
                
               
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('SiteWarning');
       $this->setFields(array(
              'title'=>array(
                        'class'=>'SiteWarningI18n',
                        'search'=>array('conditions'=>SiteWarningI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' ")
                            ),
              'name'=>array(
                        'class'=>'SiteWarning',
                        'search'=>array('conditions'=>SiteWarning::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%' ")
                            ),
       ));
       $this->setQuery("SELECT {fields} FROM ".SiteWarning::getTable().                      
                       " LEFT JOIN ".SiteWarningI18n::getInnerForJoin('warning_id'). " AND ".SiteWarningI18n::getTableField('lang')."='{lang}'".                                                        
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                        "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                                              
                        "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                        "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                       ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                            "name"=>new mfValidatorString(array("required"=>false)),                            
                            "title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                           "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                           "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getWarningsSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                              
            'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

