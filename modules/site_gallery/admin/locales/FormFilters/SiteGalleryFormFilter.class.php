<?php


class SiteGalleryFormFilter extends mfFormFilterBase {

    protected $language=null,$user=null,$conditions=null;
    
    function __construct($user,$language)
    {
       $this->language=$language; 
       $this->user=$user;    
       parent::__construct();      
    }
    
    function getLanguage()
    {
      return $this->language;
    }
              
    function getUser()
    {
        return $this->user;        
    }
    
    function configure()
    {       
         
       $this->setDefaults(array(
           'lang'=>$this->getLanguage(),           
                    'order'=>array(
                        "id"=>"asc",
                        
                        ),
                      'nbitemsbypage'=>"*",
       ));    
       // Base Query  
       $this->setClass('SiteGallery');
       $this->setFields(array(
            'name' => array(
                'class' => 'SiteGallery',
                'search' => array('conditions' =>
                    SiteGalleryI18n::getTableField('name') . " COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%'"
                )
            ),
       ));
       // Optional Objects   
       $this->setQuery("SELECT {fields} FROM ".SiteGallery::getTable().
                       " LEFT JOIN ".SiteGalleryI18n::getInnerForJoin('gallery_id')." AND lang='{lang}'".";"); 
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
                            "id" =>new mfValidatorInteger(array("required" => false)),
                            "name"=>new mfValidatorString(array("required"=>false)),  
                            "title"=>new mfValidatorString(array("required"=>false)),                                                                                                                                          
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            "start_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false,"with_time"=>true)),                            
                            "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false,"with_time"=>true)),                            
                            ),array("required"=>false)),
                            
            'equal' => new mfValidatorSchema(array(                               
                            "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO",),"required"=>false,"key"=>true)),
                            ),array("required"=>false)),                              
            'lang'=>new languagesExistsValidator(array(),'frontend'),
            'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"required"=>false,"key"=>true)),                    
        ));       
    }
}

