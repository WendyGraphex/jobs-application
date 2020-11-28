<?php


class EmployerAdvertCitiesControllerFormFilter extends mfFormFilter2 {

      
     protected $searches = null,$budget=null;
    
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
                              //    "budget"=>"asc",                        
                 ), 
                 'in'=>array(
                        'level_id'=>'',  
                        'experience_id'=>'',
                        'skill_id'=>'',
                        'user_language'=>'',
                        'country'=>''
                 ),
                 'equal'=>array(
                      "is_online"=>'',
                    //  'lang'=>$this->getUser()->getLanguage(),
                 ), 
                'range'=>array(
                    'budget'=>array('min'=>EmployerAdvertUtils::getMinBudget(),'max'=>EmployerAdvertUtils::getMaxBudget())
                ),
                 'nbitemsbypage'=>"20",
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
           'lang'=>'EmployerAdvertI18n',  
           'is_online'=>'EmployerUser',
           'budget'=>'EmployerAdvert',
           'country'=>array(
                    'class'=>'EmployerUser',                     
                    'in'=>array('conditions'=>
                                                 "(".
                        EmployerUser::getTableField('country')." IN('{country}') OR ".
                        EmployerCompany::getTableField('country')." IN('{country}') ".
                                                 ")")                                        
                        ),  
           'skill_id'=>'EmployerUserSkill',
           'experience_id'=>'EmployerUser',
           'level_id'=>'Employee',
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
                    ),              
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
           'in' => new mfValidatorSchema(array(   
                            'country'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerUserUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),                                                 
                            'user_language'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getUserLanguagesForSelect()->unshift(array(''=>__('All languages'))))),
                            'lang'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getLanguagesForSelect()->unshift(array(''=>__('All languages'))))),                                                      
               ),array("required"=>false)),      
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                            "budget"=>new mfValidatorIntegerRangeCompare(array("required"=>false,'min'=>EmployerAdvertUtils::getMinBudget(),'max'=>EmployerAdvertUtils::getMaxBudget())),           
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    'lang'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getFormattedLanguagesForSelect()->unshift(array(''=>__("All languages"))))),
                    'country'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),
                    'is_online'=> new mfValidatorChoice(array("choices"=>array(""=>__("All"),"Y"=>__("Yes"),"N"=>__("No")),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                  //  "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),     
            "sortby"=>new mfValidatorChoice(array("choices"=>new mfArray(array('most_requested'=>__('Most requested'),'most_recent'=>__('Most recent'),
                                                                                'price_asc'=>__("Price asc"),'price_desc'=>__("Price desc"),
                                                                                'published_asc'=>__("Date asc"),     
                                                                                'most_popular'=>__("Most Popular"),     
                                                                                'top_rated'=>__("Top rated")
                                                                               )),'required'=>false,'key'=>true)),                   
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));  
       
        $this->setQuery(mfQuery::getInstance()->select(Country::getTableField('code')." as `country`,IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('city').",".EmployerCompany::getTableField('city').") as `city`, count(".EmployerAdvertI18n::getTableField('id').") as `number_of_adverts`")       
                    ->from(EmployerAdvert::getTable())                  
                    ->inner(EmployerAdvertI18n::getInnerForJoin('advert_id'))                 
                    ->inner(EmployerAdvert::getOuterForJoin('employer_user_id'))    
                    ->left(EmployerUser::getOuterForJoin('company_id')) 
                    ->inner(Country::getTable()." ON ".Country::getTableField('code')."=".EmployerUser::getTableField('country')." OR ".
                              Country::getTableField('code')."=".EmployerCompany::getTableField('country'))
                    ->innerIf($this->defaults['in']['user_language'],EmployerUserLanguage::getInnerForJoin('employer_user_id'))                      
                    ->where(EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'")                             
                     ->groupBy(Country::getTableField('code').", `city`"));             
         //  echo (string)$this->_query;         die(__METHOD__); 
      //  $this->setQuery((string)$this->_query);    
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

