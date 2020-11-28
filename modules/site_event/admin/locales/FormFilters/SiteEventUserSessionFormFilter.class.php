<?php


class SiteEventUserSessionFormFilter extends mfFormFilterBase {

    protected $user=null;
    
    function __construct($user)
    {       
       $this->user=$user;
       parent::__construct();      
    }      
    
    function getUser()
    {
        return $this->user;
    }
           
    
    function configure()
    {                         
       $this->addDefaults(array(           
            'order'=>array(
                          //  "id"=>"asc",
                           // "ip"=>"asc",
                            "started_at"=>"desc",
                           // "ended_at"=>"asc",                        
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('SiteEventUserSession');
       $this->setFields(array(
          
           
             'email'=>array(
                        'class'=>'SiteEventUserSession',
                        'search'=>array('conditions'=>SiteEventUserSession::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{email}%%' ")
                        ), 
           'ip'=>array(
                        'class'=>'SiteEventUserSession',
                        'search'=>array('conditions'=>SiteEventUserSession::getTableField('ip')." COLLATE UTF8_GENERAL_CI LIKE '%%{ip}%%' ")
                        ),  
               ));      
       $this->setQuery("SELECT {fields} FROM ".SiteEventUserSession::getTable().    
                      " INNER JOIN ".SiteEventUserSession::getOuterForJoin('user_id').
                       ";");
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                                                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                                                        "user"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                                                        "ip"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)), 
                                                        "started_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                                         "ended_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                                                       ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                            "ip"=>new mfValidatorString(array("required"=>false)),                            
                            "email"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                          "started_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                           "ended_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getSiteEventFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

