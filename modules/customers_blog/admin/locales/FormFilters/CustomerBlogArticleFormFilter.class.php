<?php


class CustomerBlogArticleFormFilter extends mfFormFilterBase{
   
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
             
                "created_at"=>"desc",   
               
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('CustomerBlogArticle');
       $this->setFields(array(
              'title'=>array(
                        'class'=>'CustomerBlogArticleI18n',
                        'search'=>array('conditions'=>CustomerBlogArticleI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' ")
                            ),
              'query'=>array(
                        'class'=>'CustomerBlogArticleI18n',
                        'search'=>array('conditions'=>
                            "(".
                               CustomerBlogArticleI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' OR ".
                               CustomerBlogArticleI18n::getTableField('content')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' OR ".
                               CustomerBlogArticleI18n::getTableField('short_description')." COLLATE UTF8_GENERAL_CI LIKE '%%{query}%%' ".
                            ")"
                            ),
               ),
       ));
       $this->setQuery("SELECT {fields} FROM ".CustomerBlogArticle::getTable().                                          
                       " LEFT JOIN ".CustomerBlogArticleI18n::getInnerForJoin('article_id'). " AND ".CustomerBlogArticleI18n::getTableField('lang')."='{lang}'".                                                                        
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                       // "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                       // "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                      //  "position"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                       
                        "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                       ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                            "query"=>new mfValidatorString(array("required"=>false)),                            
                            "title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                           "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                           "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(   
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCriteriasSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "reference"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getProductI18nFieldValuesForSelect('reference',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "customer_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+ProductFavoriteUtils::getCustomerFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),                              
            'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
}
