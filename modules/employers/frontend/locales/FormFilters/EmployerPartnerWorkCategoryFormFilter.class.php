<?php


class EmployerPartnerWorkCategoryFormFilter extends mfFormFilterBase {

     
    protected $searches = null;
    
    function __construct($searches=null,$defaults=array()) {
        $this->searches=$searches;
        parent::__construct($defaults);
    }
    
    function getSearches()
    {
      return $this->searches;    
    }
    
    function _getDefaults()
    {
      return array(     
                 'sortby'=>'price_asc',
                 'order'=>array(
                                 "rb"=>"asc",                        
                 ), 
                 'equal'=>array(
                     "is_online"=>'',
                     // "is_active"=>'YES',
                 ),
                'range'=>array(
                    'budget'=>array('min'=>EmployerAdvertUtils::getMinBudget(),'max'=>EmployerAdvertUtils::getMaxBudget())
                ),
               //  'lang'=>$this->getLanguage(),     
                 'nbitemsbypage'=>"50",
            );  
    }
    
    function configure()
    {         
        if ($this->getSearches())
        {
           $this->addDefaults($this->getSearches()->getFilter()->mergeright($this->_getDefaults())->toArray());
        }    
        elseif (!$this->hasDefaults())    
        {        
            $this->addDefaults($this->_getDefaults());          
        }
       $this->setClass('EmployerAdvertI18n');
       
       $this->setFields(array(              
           'budget'=>'EmployerAdvert',                             
           'user_language'=>array('class'=>'EmployerUserLanguage','name'=>'lang'),
           'is_online'=>'EmployerUser',
          // 'country'=>'EmployerCompany',
           'country'=>array(
                'in'=>array('conditions'=>
                                                 "(".
                        EmployerUser::getTableField('country')." IN('{country}') OR ".
                        EmployerCompany::getTableField('country')." IN('{country}') ".
                                                 ")")                              
           ),                  
            'user_language'=>array('class'=>'EmployerUserLanguage','name'=>'lang'),       
            'city'=>array(
               'search'=>array('conditions'=>
                        "(".EmployerUser::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{city}%%' OR ".
                            EmployerCompany::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{city}%%' )"
                              ),
                'begin'=>array('conditions'=>
                        "(".EmployerUser::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{city}%%' OR ".
                            EmployerCompany::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{city}%%' )"
                              )
               ),
           'title'=>array(
               'begin'=>array('conditions'=>EmployerAdvertI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '{title}%%' "),  
               'search'=>array('conditions'=>
                        "(".
                            EmployerAdvertI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                            EmployerAdvertI18n::getTableField('short_description')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                            EmployerAdvertI18n::getTableField('content')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' ".
                        ")"
                        ),  
                    )
           ));     
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                                
                     "budget"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "published_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "number_of_views"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
             'search' => new mfValidatorSchema(array(                      
                    "title"=>new mfValidatorMultiple(new mfValidatorString(array("required"=>false)),array("required"=>false,'separator'=>" ")),
                      "city"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),      
           'begin' => new mfValidatorSchema(array(                      
                      "city"=>new mfValidatorString(array("required"=>false)),
                      "title"=>new mfValidatorString(array("required"=>false)),
                   //  "lastname"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),                          
                'range' => new mfValidatorSchema(array(   
                            "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)), 
                            "budget"=>new mfValidatorIntegerRangeCompare(array("required"=>false,'min'=>EmployerAdvertUtils::getMinBudget(),'max'=>EmployerAdvertUtils::getMaxBudget())),
                                ),array("required"=>false)),  
               'in' => new mfValidatorSchema(array(   
                            'country'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerUserUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),                                                   
                            'user_language'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getUserLanguagesForSelect()->unshift(array(''=>__('All languages'))))),                           
                            'lang'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getLanguagesForSelect()->unshift(array(''=>__('All languages'))))),                           
                                ),array("required"=>false)),     
                'equal' => new mfValidatorSchema(array(
                    'lang'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getFormattedLanguagesForSelect()->unshift(array(''=>__("All languages"))))),
                    'is_online'=> new mfValidatorChoice(array("choices"=>array(""=>__("All"),"Y"=>__("Yes"),"N"=>__("No")),"key"=>true,"required"=>false)),
                    'country'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                   // "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),
                    //"status"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","DELETE"=>__("DELETE"),"ACTIVE"=>__("ACTIVE")))),
                     //"lang"=>new mfValidatorChoice(array("choices"=>ProductCategoryUtils::getFormattedLanguages()->unshift(array(''=>'')),'required'=>false,'key'=>true)),                            
                           // "lang"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getLanguagesSort($this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "meta_title"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryI18nFieldValuesForSelect('meta_title',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "name"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryI18nFieldValuesForSelect('name',$this->getSite()),"key"=>true,"required"=>false)),                            
                          //  "Category_id"=>new mfValidatorChoice(array("choices"=>array(""=>"")+CategoryFavoriteUtils::getCategoryFieldValuesForSelect($this->getSite()),"key"=>true,"required"=>false)),                    
                    ),array("required"=>false)),                                         
             //'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
           "sortby"=>new mfValidatorChoice(array("choices"=>new mfArray(array('most_requested'=>__('Most requested'),'most_recent'=>__('Most recent'),
                                                                                'price_asc'=>__("Price asc"),'price_desc'=>__("Price desc"),
                                                                                'published_asc'=>__("Date asc"),                                                                             
                                                                                'top_rated'=>__("Top rated")
                                                                               )),'required'=>false,'key'=>true)),     
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        )); 
       
       
       $this->_query=new mfQuery();
        $this->_query->select("{fields}")
                    ->from(EmployerAdvert::getTable())
                    ->inner(EmployerAdvertI18n::getInnerForJoin('advert_id'))
                    ->inner(EmployerAdvertCategory::getInnerForJoin('advert_id'))  
                    ->inner(EmployerAdvertCategory::getOuterForJoin('category_id'))  
                    ->inner(EmployerAdvert::getOuterForJoin('employer_user_id'))  
                    ->left(EmployerUser::getOuterForJoin('company_id'))      
                    ->innerIf($this->defaults['in']['user_language'],EmployerUserLanguage::getInnerForJoin('employer_user_id')) 
                    ->where("lb >= {lb} AND rb <= {rb} ".
                                " AND ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                                " AND ".EmployerWorkCategory::getTableField('is_active')."='YES'")
                    ->groupBy(EmployerAdvertI18n::getTableField('id'));                       
       //  echo (string)$this->_query;          
        $this->setQuery((string)$this->_query);    
        
        /*
         *   $this->setQuery("SELECT {fields} FROM ".EmployerAdvertCategory::getTable().    
                       " INNER JOIN ".EmployerAdvertCategory::getOuterForJoin('category_id').   
                       " INNER JOIN ".EmployerAdvertCategory::getOuterForJoin('advert_id').   
                       " INNER JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id').
                       " INNER JOIN ".EmployerAdvert::getOuterForJoin('employer_user_id').         
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').     
                    //   " INNER JOIN ".EmployerWorkCategoryI18n::getInnerForJoin('category_id'). //" AND ".EmployerWorkCategoryI18n::getTableField('lang')."='{lang}'".                                                
                       
                       " WHERE  lb >= {lb} AND rb <= {rb} ".
                                " AND ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                        
                           // " AND ".EmployerAdvert::getTableField('status')."='ACTIVE'".
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                                " AND ".EmployerWorkCategory::getTableField('is_active')."='YES'".
                       " GROUP BY ".EmployerAdvertI18n::getTableField('id').
                       ";"); 
         */
    }
    
    
    function buildSortbyQuery($value)
    {
       $values=array();
       if ($value=='most_requested')       
           $values['number_of_views']='desc';       
       elseif ($value=='price_asc')       
           $values['budget']='asc';       
       elseif ($value=='price_desc')       
           $values['budget']='desc';       
       elseif ($value=='most_recent')      
           $values['published_at']='desc';       
        elseif ($value=='published_asc')       
           $values['published_at']='asc';            
       $this->buildOrderQuery($values);       
    }
    
    
     function getBudget()
    {
        return $this->budget=$this->budget===null?new mfArray(array($this['range']['budget']['min']->getValue(),$this['range']['budget']['max']->getValue())):$this->budget;
    }
    
  
}

