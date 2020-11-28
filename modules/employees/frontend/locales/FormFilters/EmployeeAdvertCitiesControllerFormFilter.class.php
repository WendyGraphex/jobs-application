<?php


class EmployeeAdvertCitiesControllerFormFilter extends mfFormFilterBase {

      
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
               //  'sortby'=>'price_asc',
                 'order'=>array(
                          "number_of_adverts"=>'desc',                   
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
                    'budget'=>array('min'=>EmployeeAdvertUtils::getMinBudget(),'max'=>EmployeeAdvertUtils::getMaxBudget())
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
        
       $this->setClass('EmployeeAdvertI18n');
       
       $this->setFields(array(
           'lang'=>'EmployeeAdvertI18n',  
           'is_online'=>'Employee',
           'budget'=>'EmployeeAdvert',
           'country'=>'Employee',
           'skill_id'=>'EmployeeUserSkill',
           'experience_id'=>'Employee',
           'level_id'=>'Employee',
           'user_language'=>array('class'=>'EmployeeUserLanguage','name'=>'lang'),       
           'city'=>array('class'=>'Employee',
               'search'=>array('conditions'=>
                     
                            Employee::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '%%{city}%%'  "                            
                        ),                                          
            ),
           'title'=>array(
               'begin'=>array('conditions'=>EmployeeAdvertI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '{title}%%' "),  
               'search'=>array('conditions'=>
                        "(".
                            EmployeeAdvertI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                            EmployeeAdvertI18n::getTableField('short_description')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                            EmployeeAdvertI18n::getTableField('content')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' ".
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
                            'country'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),                        
                            'skill_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeAdvertUtils::getSkillsForSelect()->unshift(array(''=>__('All skills'))))),
                            'user_language'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeAdvertUtils::getUserLanguagesForSelect()->unshift(array(''=>__('All languages'))))),
                            'lang'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeAdvertUtils::getLanguagesForSelect()->unshift(array(''=>__('All languages'))))),
                            'experience_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeAdvertUtils::getExperiencesForSelect()->unshift(array(''=>__('All experiences'))))),
                            'level_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeAdvertUtils::getLevelsForSelect()->unshift(array(''=>__('All study levels'))))),                           
               ),array("required"=>false)),      
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                            "budget"=>new mfValidatorIntegerRangeCompare(array("required"=>false,'min'=>EmployeeAdvertUtils::getMinBudget(),'max'=>EmployeeAdvertUtils::getMaxBudget())),           
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    'lang'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployeeAdvertUtils::getFormattedLanguagesForSelect()->unshift(array(''=>__("All languages"))))),
                    'country'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployeeAdvertUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),
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
       
        $this->_query=new mfQuery();
        $this->_query->select("country,city, count(".EmployeeAdvertI18n::getTableField('id').") as `number_of_adverts`")
                    ->from(EmployeeAdvert::getTable())                  
                    ->inner(EmployeeAdvertI18n::getInnerForJoin('advert_id'))                 
                    ->inner(EmployeeAdvert::getOuterForJoin('employee_user_id'))  
                    ->innerIf($this->defaults['in']['skill_id'],EmployeeUserSkill::getInnerForJoin('employee_user_id'))                                      
                    ->innerIf($this->defaults['in']['user_language'],EmployeeUserLanguage::getInnerForJoin('employee_user_id'))                      
                    ->where(EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'")   
                    ->groupBy(Employee::getTableField('country').",".Employee::getTableField('city'));                           
                    //->groupBy(EmployeeAdvertI18n::getTableField('id'));                       
       //   echo (string)$this->_query;          
        $this->setQuery((string)$this->_query);    
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

