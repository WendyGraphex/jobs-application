<?php


class CustomerCourseCategoryFormFilter extends mfFormFilterBase {

    protected $searches = null,$price=null;
    
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
                 )   ,  
                'range'=>array(
                  //  'budget'=>array('min'=>CustomerAcademyCourseUtils::getMinBudget(),'max'=>CustomerAcademyCourseUtils::getMaxBudget())
                ),
                'in'=>array(
                //  'level_id'=>'',  
               //   'experience_id'=>'',
              //    'skill_id'=>'',
              //    'user_language'=>'',
               //   'country'=>''
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
       $this->setClass('CustomerAcademyCourseI18n');
       
       $this->setFields(array(  
           'level'=>array('name'=>'level_id','class'=>'CustomerAcademyLevel'),
           'lang'=>'CustomerAcademyCourseI18n',  
           'is_online'=>'CustomerAcademyTeacherUser',
           'budget'=>'CustomerAcademyCourseI18n',
           'country'=>'CustomerAcademyTeacherUser',
         //  'skill_id'=>'EmployeeUserSkill',
         //  'experience_id'=>'Employee',
         //  'level_id'=>'Employee',
        //   'user_language'=>array('class'=>'EmployeeUserLanguage','name'=>'lang'),
         /*   'city'=>array('class'=>'CustomerAcademyTeacherUser',
               'search'=>array('conditions'=>
                     
                            CustomerAcademyTeacherUser::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '%%{city}%%'  "                            
                        ),                                          
            ),*/
           'title'=>array(
               'begin'=>array('conditions'=>CustomerAcademyCourseI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '{title}%%' "),  
               'search'=>array('conditions'=>
                        "(".
                            CustomerAcademyCourseI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                            CustomerAcademyCourseI18n::getTableField('short_description')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                            CustomerAcademyCourseI18n::getTableField('content')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' ".
                        ")"
                        ),                      
                    ),              
           ));
      
      
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                   //  "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                   //  "rb"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                     "price"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "published_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "number_of_views"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                   //  "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                   //  "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
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
                          //   "price"=>new mfValidatorIntegerRangeCompare(array("required"=>false,'min'=>CustomerAcademyCourseUtils::getMinBudget(),'max'=>CustomerAcademyCourseUtils::getMaxBudget())),           
                                ),array("required"=>false)),      
               'in' => new mfValidatorSchema(array(   
                         //   'country'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),                        
                         //   'skill_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> CustomerAcademyCourseUtils::getSkillsForSelect()->unshift(array(''=>__('All skills'))))),
                           'lang'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> CustomerAcademyCourseI18nUtils::getFormattedLanguagesForSelect()->unshift(array(''=>__('All languages'))))),
                       //     'experience_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> CustomerAcademyCourseUtils::getExperiencesForSelect()->unshift(array(''=>__('All experiences'))))),
                            'level'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> CustomerAcademyCourseI18nUtils::getLevelsForSelect()->unshift(array(''=>__('All study levels'))))),
                                ),array("required"=>false)),      
                'equal' => new mfValidatorSchema(array(
                  //  'lang'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> CustomerAcademyCourseUtils::getFormattedLanguagesForSelect()->unshift(array(''=>__("All languages"))))),
                  //  'is_online'=> new mfValidatorChoice(array("choices"=>array(""=>__("All"),"Y"=>__("Yes"),"N"=>__("No")),"key"=>true,"required"=>false)),
                   //  'country'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> CustomerAcademyCourseUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),
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
                    ->from(CustomerAcademyCourseI18n::getTable())                 
                    ->inner(CustomerCourseCategoryCourse::getInnerForJoin('course_i18n_id'))  
                    ->inner(CustomerCourseCategoryCourse::getOuterForJoin('category_id'))  
                    ->inner(CustomerAcademyCourseI18n::getOuterForJoin('teacher_user_id'))  
                   // ->innerIf($this->defaults['in']['skill_id'],EmployeeUserSkill::getInnerForJoin('employee_user_id'))           
                  //  ->innerIf($this->defaults['in']['user_language'],EmployeeUserLanguage::getInnerForJoin('employee_user_id')) 
                    ->where("lb >= {lb} AND rb <= {rb} ".
                                " AND ".CustomerAcademyCourseI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".CustomerAcademyCourseI18n::getTableField('status')."='ACTIVE'".
                                " AND ".EmployeeWorkCategory::getTableField('is_active')."='YES'")
                    ->groupBy(CustomerAcademyCourseI18n::getTableField('id'));                       
       //  echo (string)$this->_query;          
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
  
    function getPrice()
    {
        return $this->price=$this->price===null?new mfArray(array($this['range']['price']['min']->getValue(),$this['range']['price']['max']->getValue())):$this->price;
    }
}

