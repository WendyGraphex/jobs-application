<?php


class CmsMenuFormFilter extends mfFormFilterBase {

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
       $this->addDefaults(array(          
            'order'=>array(
               // "rb"=>"desc",    
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
       $this->setClass('CmsMenu');
       
       $this->setFields(array(   
              "meta_title"=>array('class'=>'CmsPageI18n','name'=>'meta_title'),
              'name'=>array(              
              'search'=>array('conditions'=>
                                                 "(".
               CmsMenu::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%'".
                                                 ")")
                                ),
           'title'=>array(
              'class'=>'CmsMenuI18n',
              'search'=>array('conditions'=>
                                                 "(".
               CmsMenuI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%'".
                                                 ")")
                                ),  
           ));
       $this->setQuery("SELECT {fields} FROM ".CmsMenu::getTable(). 
                       " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('menu_id')." AND ".CmsMenuI18n::getTableField('lang')."='{lang}'".                     
                       " LEFT JOIN ".CmsMenu::getOuterForJoin('page_id').              
                       " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id')." AND ".CmsPageI18n::getTableField('lang')."='{lang}'".                  
                       " WHERE level={levelplusone} AND  lb >= {lb} AND rb <= {rb} ".
                       " ORDER BY ".CmsMenu::getTableField('rb')." ASC ".
                       ";"); 
       
//       "SELECT {fields} FROM ".CmsMenu::getTable(). 
//                       " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('category_id')." AND lang='{lang}'".                     
//                       " WHERE level={levelplusone} AND  lb >= {lb} AND rb <= {rb} ".
//                       ";"
//       
       
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                     "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                     "rb"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                     "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "meta_title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                 //   "number_of_products"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                "id"=>new mfValidatorString(array("required"=>false)),
                "name"=>new mfValidatorString(array("required"=>false)),
                "meta_title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
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
                     "page_id"=>new ObjectExistsValidator('CmsPage',array('required'=>false,'empty_value'=>null)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                   // "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                    //"status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                     //"lang"=>new mfValidatorChoice(array("choices"=>CmsMenuUtils::getFormattedLanguages()->unshift(array(''=>'')),'required'=>false,'key'=>true)),                            
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
         if ($this->values['equal']['page_id'])
         {             
            $this->setQuery("SELECT {fields} FROM ".CmsMenu::getTable(). 
                       " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('menu_id')." AND ".CmsMenuI18n::getTableField('lang')."='{lang}'".                     
                       " LEFT JOIN ".CmsMenu::getOuterForJoin('page_id').              
                       " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id')." AND ".CmsPageI18n::getTableField('lang')."='{lang}'".                  
                       " WHERE lb >= {lb} AND rb <= {rb} ".
                       ";"); 
             $this->setParameter('lb',$this->getRoot()->get('lb'));
             $this->setParameter('rb',$this->getRoot()->get('rb'));            
         }     
        return parent::getQuery(); 
    } 
    
    
   function getRoot()
    {
        return $this->root=$this->root===null?CmsMenu::root():$this->root;
    }
    
    
    function getPage()
    {
        return $this->page=$this->page===null?new CmsPage((string)$this['equal']['page_id']):$this->page;
    }
}

