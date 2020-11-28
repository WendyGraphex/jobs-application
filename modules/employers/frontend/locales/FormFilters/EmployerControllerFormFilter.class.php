<?php


class EmployerControllerFormFilter extends mfFormFilterBase {

      
   protected $searches = null;
    
    function __construct($searches=null,$defaults=array()) {
        $this->searches=$searches;
        parent::__construct($defaults);
    }
    
    function getSearches()
    {
      return $this->searches;    
    }
    
    function configure()
    {  
        if ($this->getSearches())
        {
          //  var_dump($this->getSearches()->getFilter()->toArray());
           $this->addDefaults($this->getSearches()->getFilter()->toArray());
        }    
        elseif (!$this->hasDefaults())
        {      
            $this->setDefaults(array(          
                 'order'=>array(
                                 "created_at"=>"desc",                        
                 ), 
                 'equal'=>array(
                    // "is_active"=>'YES',
                     // 'lang'=>$this->getUser()->getLanguage(),
                 )   , 
                 'nbitemsbypage'=>"20",
            ));          
       }             
       $this->setClass('EmployerUser');
       
       $this->setFields(array(
            'country'=>array(
                    'class'=>'EmployerUser',                     
                    'in'=>array('conditions'=>
                                                 "(".
                        EmployerUser::getTableField('country')." IN('{country}') OR ".
                        EmployerCompany::getTableField('country')." IN('{country}') ".
                                                 ")")                                        
                        ), 
            'is_online'=>'EmployerUser',
            'user_language'=>array('class'=>'EmployerUserLanguage','name'=>'lang')                   
          
           ));
     /*  $this->setQuery("SELECT {fields} FROM ".EmployerUser::getTable().  
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').
                       " LEFT JOIN ".EmployerContent::getInnerForJoin('employer_user_id').
                       " LEFT JOIN ".EmployerContentI18n::getInnerForJoin('content_id')." AND ".EmployerContentI18n::getTableField('lang')."='{lang}'".
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' AND ".EmployerUser::getTableField('is_validated')."='YES'".
                            " AND ".EmployerUser::getTableField('is_active')."='YES'".
                            " AND ".EmployerUser::getTableField('is_completed')."='YES'".                                                
                       ";"); */
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                      "number_of_views"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                      "published_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                      //  "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                      //  "phone"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                       
                      //  "city"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
           'begin' => new mfValidatorSchema(array(                      
                      "city"=>new mfValidatorString(array("required"=>false)),
                   //  "lastname"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                      
                   //  "firstname"=>new mfValidatorString(array("required"=>false)),
                   //  "lastname"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),   
            'in' => new mfValidatorSchema(array(   
                            'user_language'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerUserUtils::getLanguagesForSelect()->unshift(array(''=>__('All languages'))))),                           
                            'country'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployerUserUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),                                                    
                                ),array("required"=>false)),  
            'range' => new mfValidatorSchema(array(   
                               "published_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                'lang'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> LanguageUtils::getFormattedActiveFrontendLanguages()->unshift(array(''=>__("All languages"))))),
                'is_online'=> new mfValidatorChoice(array("choices"=>array(""=>__("All"),"Y"=>__("Yes"),"N"=>__("No")),"key"=>true,"required"=>false)),
                // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                //  "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                        ),array("required"=>false)),     
            "sortby"=>new mfValidatorChoice(array("choices"=>new mfArray(array( 'most_requested'=>__('Most requested'),
                                                                                'most_recent'=>__('Most recent'),     
                                                                                'created_asc'=>__("Date asc"), 
                                                                                'top_rated'=>__("Top rated")
                                                                               )),'required'=>false,'key'=>true)),        
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        )); 
       
        $this->_query=new mfQuery();
        $this->_query->select("{fields}")
                    ->from(EmployerUser::getTable())
                    ->left(EmployerUser::getOuterForJoin('company_id'))
                    ->left(EmployerContent::getInnerForJoin('employer_user_id'))
                    ->left(EmployerContentI18n::getInnerForJoin('content_id')." AND ".EmployerContentI18n::getTableField('lang')."='{lang}'")                  
                    ->innerIf($this->defaults['in']['user_language'],EmployerUserLanguage::getInnerForJoin('employer_user_id')) 
                    ->where(EmployerUser::getTableField('is_active')."='YES' ".
                            " AND ".EmployerUser::getTableField('is_validated')."='YES'".
                            " AND ".EmployerUser::getTableField('is_active')."='YES'".
                            " AND ".EmployerUser::getTableField('is_completed')."='YES'");                       
       //  echo (string)$this->_query;          
        $this->setQuery((string)$this->_query);    
        
      /*  $this->setQuery("SELECT {fields} FROM ".EmployerUser::getTable().  
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').
                       " LEFT JOIN ".EmployerContent::getInnerForJoin('employer_user_id').
                       " LEFT JOIN ".EmployerContentI18n::getInnerForJoin('content_id')." AND ".EmployerContentI18n::getTableField('lang')."='{lang}'".
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' AND ".EmployerUser::getTableField('is_validated')."='YES'".
                            " AND ".EmployerUser::getTableField('is_active')."='YES'".
                            " AND ".EmployerUser::getTableField('is_completed')."='YES'".                                                
                       ";");*/
    }
    
    
     function buildSortbyQuery($value)
    {
       $values=array();
       if ($value=='most_requested')       
           $values['number_of_views']='desc';                
       elseif ($value=='most_recent')      
           $values['created_at']='desc';       
        elseif ($value=='created_asc')       
           $values['created_at']='asc';            
       $this->buildOrderQuery($values);       
    }
   
}

