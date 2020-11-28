<?php


class EmployerCityDialogFormFilter extends mfFormFilterBase {

    protected $gallery_i18n=null;
    
    function __construct(EmployerCityGalleryI18n $gallery_i18n,$defaults=array())
    {
       $this->gallery_i18n=$gallery_i18n;         
       parent::__construct($defaults);      
    }
    
    function getGalleryI18n()
    {
        return $this->gallery_i18n;
    }
    
    function getLanguage()
    {
      return $this->gallery_i18n->get('lang');
    } 
                
    function configure()
    {  
       if (!$this->hasDefaults())
       {    
            $this->setDefaults(array(
                 'selection'=>$this->getGalleryI18n()->getCities()->getKeys()->toArray(),
                 'lang'=>$this->getLanguage(),     
                 'order'=>array(
                                 "position"=>"asc",                        
                 ),  
                'nbitemsbypage'=>10
            ));
       }      
       $this->setClass('EmployerCity');
       
       $this->setFields(array(                     
           'title'=>array(
              'class'=>'EmployerCityI18n',
              'search'=>array('conditions'=>
                                                 "(".
               EmployerCityI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%'".
                                                 ")")
                                ),  
           ));
       $this->setQuery("SELECT {fields} FROM ".EmployerCity::getTable().                      
                       " LEFT JOIN ".EmployerCityI18n::getInnerForJoin('city_id')." AND lang='{lang}'".                                          
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                     "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                     "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    //  "reference"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    // "number_of_employers"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                   //  "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                   //  "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                "id"=>new mfValidatorString(array("required"=>false)),
                "title"=>new mfValidatorString(array("required"=>false)),
               // "reference"=>new mfValidatorString(array("required"=>false)),
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
                     //"lang"=>new mfValidatorChoice(array("choices"=>EmployerCategoryUtils::getFormattedLanguages()->unshift(array(''=>'')),'required'=>false,'key'=>true)),                            
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "name"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryI18nFieldValuesForSelect('name',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "Category_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),
                     // "lang"=>new mfValidatorChoice(array("choices"=>QuotationUtils::getFormattedLanguagesForSelect()->unshift(array(''=>'')),'required'=>false,'key'=>true)),         
                   //    "supplier_id"=>new mfValidatorChoice(array("choices"=>EmployerUtils::getSuppliersForSelect()->unshift(array(''=>'')),"key"=>true,"required"=>false)),
                    ),array("required"=>false)),                                         
         //  'lang'=>new LanguagesExistsValidator(array(),'frontend'),   
           'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array('required'=>false)),             
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
    function getSelection()
    {
        if ($this->isReady())
            return $this['selection']->getArray();
        return new mfArray($this->getDefault('selection'));
    }
}

