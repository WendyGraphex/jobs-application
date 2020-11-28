<?php

class SmsBoxSentFormFilter extends mfFormFilterBase {


    protected $user = null;

    function __construct($user)
    {
        $this->user = $user;    
        parent::__construct();
    }
    
    
    function configure()
    {                   
       
       $this->setDefaults(array(          
            'order'=>array(
                "id"=>"desc",
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('SmsBoxSent');
       $this->setFields(array(

               'message'=>array(
                  'class'=>'SmsBoxSent',
                  'search'=>array(
                   'conditions'=>
                       "(".
                       SmsBoxSent::getTableField("message")."  COLLATE UTF8_GENERAL_CI LIKE '%%{message}%%' ".
                        ")"
               )),
               'from'=>array(
                   'class'=>'SmsBoxSent',
                   'search'=>array(
                       'conditions'=>
                           "(".SmsBoxSent::getTableField("sent_at")." >= '{from} 00:00:00' )"
                   ),
               ),
               'to'=>array(
                   'class'=>'SmsBoxSent',
                   'search'=>array(
                       'conditions'=>
                           "(".SmsBoxSent::getTableField("sent_at")." <=  '{to} 23:59:59' )"
                   ) ,
               ),


       ));
       $this->setQuery("SELECT * FROM ".SmsBoxSent::getTable().
                       " WHERE is_sent = 'YES'  ORDER BY id DESC".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                             "sent_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                            //  "id"=>new mfValidatorString(array("required"=>false)),
                            'from'=>new mfValidatorI18nDate(array('required'=>false,'date_format'=>'a')),
                            'to'=>new mfValidatorI18nDate(array('required'=>false,'date_format'=>'a')),
                            "mobile"=>new mfValidatorString(array("required"=>false)),                            
                            "reference"=>new mfValidatorString(array("required"=>false)),                            
                            "message"=>new mfValidatorString(array("required"=>false)),   
                            "error_api"=>new mfValidatorString(array("required"=>false)),
                            "error_callback"=>new mfValidatorString(array("required"=>false)),
                        ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            // "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                        ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                            "error_callback"=>new mfValidatorChoice(array("choices"=>SmsBoxSent::getCallbackErrorForSelect()->unshift(array(''=>'','IS_EMPTY'=>'Vide','IS_NOT_EMPTY'=>"Tous retours")),"key"=>true,"required"=>false)),                            
                            //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                            //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                            //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                        ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }

    function getSearchDate($field)
    {
        return format_date((string)$this['search'][$field],'a');
    }
    
}

