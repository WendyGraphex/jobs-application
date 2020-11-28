<?php


class CustomerCourseCategoryDialogFormFilter extends mfFormFilterBase {

    protected $language=null;
    
    function __construct($language,$defaults=array())
    {
       $this->language=$language;         
       parent::__construct($defaults);      
    }
    
    function getLanguage()
    {
      return $this->language;
    } 
                
    function configure()
    {  
       if (!$this->hasDefaults())
       {
            $this->setDefaults(array(          
                 'order'=>array(
                                 "id"=>"asc",                        
                 ), 
                 'equal'=>array(
                     // "is_active"=>'YES',
                 )   ,     
               //  'lang'=>$this->getLanguage(),     
                 'nbitemsbypage'=>"20",
            ));
       }
       if (!$this->getDefault('nbitemsbypage')) $this->setDefault('nbitemsbypage',20);       
       $this->setClass('CustomerCourseCategory');
       
       $this->setFields(array(          

           'title'=>array(
              'class'=>'CustomerCourseCategoryI18n',
              'search'=>array('conditions'=>
                                                 "(".
               CustomerCourseCategoryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%'".
                                                 ")")
                                ),  
           ));
       $this->setQuery("SELECT {fields} FROM ".CustomerCourseCategory::getTable(). 
                       " LEFT JOIN ".CustomerCourseCategoryI18n::getInnerForJoin('category_id')." AND lang='{lang}'".                     
                       " WHERE level={levelplusone} AND  lb >= {lb} AND rb <= {rb} AND ".CustomerCourseCategory::getTableField('is_active')."='YES'". 
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                     "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                     "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    // "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    // "number_of_products"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                   //  "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                   //  "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                "id"=>new mfValidatorString(array("required"=>false)),
                "title"=>new mfValidatorString(array("required"=>false)),
               // "number_of_try"=>new mfValidatorString(array("required"=>false)),    
                          //  "id"=>new mfValidatorString(array("required"=>false)),                            
                          //  "link"=>new mfValidatorString(array("required"=>false)),                            
                //"title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
                'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                             // "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
                'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                   // "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                    //"status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                     //"lang"=>new mfValidatorChoice(array("choices"=>ProductCategoryUtils::getFormattedLanguages()->unshift(array(''=>'')),'required'=>false,'key'=>true)),                            
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "name"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryI18nFieldValuesForSelect('name',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "Category_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                     // "lang"=>new mfValidatorChoice(array("choices"=>QuotationUtils::getFormattedLanguagesForSelect()->unshift(array(''=>'')),'required'=>false,'key'=>true)),         
                    ),array("required"=>false)),                                         
          // 'lang'=>new LanguagesExistsValidator(array(),'frontend'),           
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

