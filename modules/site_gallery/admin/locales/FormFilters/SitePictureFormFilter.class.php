<?php


class SitePictureFormFilter extends mfFormFilterBase {

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
                          "id"=>"desc",
                        /*    "name"=>"asc", 
                            "title"=>"asc",
                            "start_at"=>"asc",
                            "expired_at"=>"asc",*/
                          ),
                      'nbitemsbypage'=>"100",
       ));  
       $this->setClass('SitePicture');
       // Base Query  
       $this->setFields(array(
           'id'=>"SitePicture",
           'title'=>array(
                'search'=>array('conditions'=>"(".
                 SitePictureI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                 SitePicture::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%' ".            
                                               ")")
                                    ), 
           ));
       
       $this->setQuery("SELECT {fields} FROM ".SitePicture::getTable().
                       " LEFT JOIN ".SitePictureI18n::getInnerForJoin('picture_id')." AND lang='{lang}'".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                            "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                        
                            "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "start_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                            "expired_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                            "id"=>new mfValidatorInteger(array("required"=>false)), 
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
            'lang'=>new languagesExistsValidator(array(),'frontend'),
            'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"required"=>false,"key"=>true)),                    
        ));       
    }
}

