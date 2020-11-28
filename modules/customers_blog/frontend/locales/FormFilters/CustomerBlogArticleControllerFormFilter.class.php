<?php


class CustomerBlogArticleControllerFormFilter extends mfFormFilter2 {

      
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
                 'order'=>array(
                                 "created_at"=>"desc",                        
                 ), 
                 'equal'=>array(
                    // "is_active"=>'YES',
                    //  'lang'=>$this->getUser()->getLanguage(),
                 )   , 
                 'in'=>array(
                      //  'country'=>'',                                                  
                      //  'user_language'=>'',
                      //  'lang'=>''  
                 ),
                'search'=>array(
                //  'title'=>new mfArray(array('job1','job2')),
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
       $this->setClass('CustomerBlogArticleI18n');
       
        $this->setFields(array(
            'lang'=>'CustomerBlogArticleI18n',
            'published_at'=>'CustomerBlogArticle',
                   
                 
            'city'=>array(
               'search'=>array('conditions'=>
                        "(".CustomerBlogArticle::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{city}%%'   ".
                        ")"
                              ),
               'begin'=>array('conditions'=>
                        "(".CustomerBlogArticle::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{city}%%' OR ".
                            CustomerBlogArticle::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{city}%%' )"
                              )
               ),
           'title'=>array(
               'begin'=>array('conditions'=>CustomerBlogArticleI18n::getTableField('meta_title')." COLLATE UTF8_GENERAL_CI LIKE '{title}%%' "),  
               'search'=>array('conditions'=>
                        "(".
                            CustomerBlogArticleI18n::getTableField('meta_title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                            CustomerBlogArticleI18n::getTableField('short_description')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                            CustomerBlogArticleI18n::getTableField('content')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' ".
                        ")"
                        ),  
                    )
           ));     
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                     //     "budget"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "published_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "number_of_views"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
           'begin' => new mfValidatorSchema(array(                      
                      "city"=>new mfValidatorString(array("required"=>false)),
                      "title"=>new mfValidatorString(array("required"=>false)),
                   //  "lastname"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                      
                   //  "firstname"=>new mfValidatorString(array("required"=>false)),
                      "title"=>new mfValidatorMultiple(new mfValidatorString(array("required"=>false)),array("required"=>false,'separator'=>" ")),
                      "city"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),   
           'in' => new mfValidatorSchema(array(   
                          //  'country'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerUserUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),                                                  
                          //  'user_language'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getUserLanguagesForSelect()->unshift(array(''=>__('All languages'))))),
                          //  'lang'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerAdvertUtils::getLanguagesForSelect()->unshift(array(''=>__('All languages'))))),                          
                                ),array("required"=>false)),      
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                           //   "budget"=>new mfValidatorIntegerRangeCompare(array("required"=>false,'min'=>EmployerAdvertUtils::getMinBudget(),'max'=>EmployerAdvertUtils::getMaxBudget())),           
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    'lang'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> LanguageUtils::getFormattedActiveFrontendLanguages()->unshift(array(''=>__("All languages"))))),
                  //  'is_online'=> new mfValidatorChoice(array("choices"=>array(""=>__("All"),"Y"=>__("Yes"),"N"=>__("No")),"key"=>true,"required"=>false)),
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                  //  "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),                
            "sortby"=>new mfValidatorChoice(array("choices"=>new mfArray(array( //'most_requested'=>__('Most requested'),
                                                                                'most_recent'=>__('Most recent'),
                                                                               // 'price_asc'=>__("Price asc"),'price_desc'=>__("Price desc"),
                                                                               // 'published_asc'=>__("Date asc"),  
                                                                               // 'most_popular'=>__("Most Popular"),     
                                                                               // 'top_rated'=>__("Top rated")
                                                                               )),'required'=>false,'key'=>true)),    
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));         
                          
       $this->setQuery(mfQuery::getInstance()->select("{fields}")
                    ->from(CustomerBlogArticle::getTable())
                    ->inner(CustomerBlogArticleI18n::getInnerForJoin('article_id'))                                                  
                    ->where(CustomerBlogArticle::getTableField('published_at')." IS NOT NULL".  
                                " AND ".CustomerBlogArticleI18n::getTableField('lang')."='{lang}'".
                                " AND ".CustomerBlogArticle::getTableField('status')."='ACTIVE'") );           
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
    
  
}
