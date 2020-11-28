<?php


class PartnerWorkCategoryMenuFormFilter extends mfFormFilterBase {

     protected $language=null,$node=null;
    
    function __construct($node,$language)
    {
       $this->language=$language;     
       $this->node=$node;
       parent::__construct();      
    }
    
    function getNode()
    {
        return $this->node;
    }
    
    function getLanguage()
    {
      return $this->language;
    } 
       
     
        
    function configure()
    {                         
       $this->addDefaults(array(          
            'order'=>array(
              //  "rb"=>"asc",    
              /*  "id"=>"asc",
                "name"=>"asc",
                "title"=>"asc",
                "created_at"=>"asc",
                "updated_at"=>"asc",*/
            ), 
            'equal'=>array(
                // "is_active"=>'YES',
            )   ,     
          //  'lang'=>$this->getLanguage(),     
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('PartnerWorkCategoryMenu');
       
       $this->setFields(array(          
              'name'=>array(              
              'search'=>array('conditions'=>
                                                 "(".
               PartnerWorkCategoryMenu::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%'".
                                                 ")")
                                ),
           'title'=>array(
              'class'=>'PartnerWorkCategoryI18n',
              'search'=>array('conditions'=>
                                                 "(".
               PartnerWorkCategoryMenuI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%'".
                                                 ")")
                                ),  
           ));
       $this->setQuery("SELECT {fields} FROM ".PartnerWorkCategoryMenu::getTable(). 
                       " LEFT JOIN ".PartnerWorkCategoryMenuI18n::getInnerForJoin('menu_id')." AND ".PartnerWorkCategoryMenuI18n::getTableField('lang')."='{lang}'".                     
                       " LEFT JOIN ".PartnerWorkCategoryMenu::getOuterForJoin('category_id').
                       " LEFT JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id')." AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".                     
                       " WHERE ".PartnerWorkCategoryMenu::getTableField('level')."={levelplusone} AND  ". 
                               PartnerWorkCategoryMenu::getTableField('lb')." >= {lb} AND ". 
                               PartnerWorkCategoryMenu::getTableField('rb')." <= {rb} ".
                       " ORDER BY ".PartnerWorkCategoryMenu::getTableField('rb')." ASC".
                       ";"); 
  
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                     "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                     "rb"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                     "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    "number_of_products"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                "id"=>new mfValidatorString(array("required"=>false)),
                "name"=>new mfValidatorString(array("required"=>false)),
               // "number_of_try"=>new mfValidatorString(array("required"=>false)),    
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                          //  "link"=>new mfValidatorString(array("required"=>false)),                            
                             "title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
                'range' => new mfValidatorSchema(array(   
                             "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                             "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
                'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                   // "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                    //"status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                     //"lang"=>new mfValidatorChoice(array("choices"=>PartnerWorkCategoryUtils::getFormattedLanguages()->unshift(array(''=>'')),'required'=>false,'key'=>true)),                            
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "name"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryI18nFieldValuesForSelect('name',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "Category_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                     //"lang"=>new mfValidatorChoice(array("choices"=>QuotationUtils::getFormattedLanguagesForSelect()->unshift(array(''=>'')),'required'=>false,'key'=>true)),   
                    "is_active"=> new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                    'lang'=>new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>LanguageUtils::getFormattedActiveFrontendLanguages()->unshift(array(''=>'')))), 
                    ),array("required"=>false)),                                         
             //'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   function getQuery()
    {
         if ($this->query_valid)
             return $this->query;   
         if ($this->values['search']['title'])
         {             
             $this->setQuery("SELECT {fields} FROM ".PartnerWorkCategoryMenu::getTable(). 
                       " LEFT JOIN ".PartnerWorkCategoryMenuI18n::getInnerForJoin('menu_id')." AND ".PartnerWorkCategoryMenuI18n::getTableField('lang')."='{lang}'".                     
                       " LEFT JOIN ".PartnerWorkCategoryMenu::getOuterForJoin('category_id').
                       " LEFT JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id')." AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".                     
                       " WHERE ".PartnerWorkCategoryMenu::getTableField('lb')." >= {lb} AND ". 
                                  PartnerWorkCategoryMenu::getTableField('rb')." <= {rb} ".
                       " ORDER BY ".PartnerWorkCategoryMenu::getTableField('rb')." ASC".
                       ";"); 
             $this->setParameter('lb',$this->getNode()->get('lb'));
             $this->setParameter('rb',$this->getNode()->get('rb'));            
         }        
        return parent::getQuery();
    }
    
    
     
}

