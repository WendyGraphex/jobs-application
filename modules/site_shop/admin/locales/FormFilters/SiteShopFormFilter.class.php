<?php


class SiteShopFormFilter extends mfFormFilterBase {

    
    function configure()
    {                         
       $this->setDefaults(array(           
            'order'=>array(
                "id"=>"asc",
                "created_at"=>"asc",
                "updated_at"=>"asc",
                "position"=>"asc",
                "meta_title"=>"asc",   
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('SiteShop');
       $this->setFields(array(
              'meta_title'=>array(
                        'class'=>'SiteShopI18n',
                        'search'=>array('conditions'=>SiteShopI18n::getTableField('meta_meta_title')." COLLATE UTF8_GENERAL_CI LIKE '%%{meta_title}%%' ")
                            ),              
       ));
       $this->setQuery("SELECT {fields} FROM ".SiteShop::getTable().                      
                       " INNER JOIN ".SiteShopI18n::getInnerForJoin('shop_id'). 
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                "meta_title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
            ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                            "lang"=>new mfValidatorString(array("required"=>false)),
                            "meta_title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(
                "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                          //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                           // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                              
            'lang'=>new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>LanguageUtils::getFormattedFrontendLanguages()->unshift(array(''=>'')))),
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

