<?php


class EmployeeControllerFormFilter extends mfFormFilterBase {

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
            $this->addDefaults(array(          
                 'order'=>array(
                                 "created_at"=>"desc",                        
                 ), 
                 'equal'=>array(
                    // "is_active"=>'YES',
                 )   , 
                 'nbitemsbypage'=>"20",
            )); 
        }
       $this->setClass('Employee');
       
       $this->setFields(array(                    
           'country'=>'Employee',
           'skill_id'=>'EmployeeUserSkill',
           'experience_id'=>'Employee',
           'level_id'=>'Employee',
           'is_online'=>'Employee',
           'user_language'=>array('class'=>'EmployeeUserLanguage','name'=>'lang')         
          
           ));
      
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                    //   "budget"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                   //  "published_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "number_of_views"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
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
                  //    "city"=>new mfValidatorString(array("required"=>false)),
                   //  "lastname"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),
             'in' => new mfValidatorSchema(array(   
                            'user_language'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getLanguagesForSelect()->unshift(array(''=>__('All languages'))))),
                            'skill_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getSkillsForSelect()->unshift(array(''=>__('All skills'))))),
                            'country'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),                        
                            'experience_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getExperiencesForSelect()->unshift(array(''=>__('All experiences'))))),
                            'level_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getLevelsForSelect()->unshift(array(''=>__('All study levels'))))),
                                ),array("required"=>false)),      
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(                  
                   'is_online'=> new mfValidatorChoice(array("choices"=>array(""=>__("All"),"Y"=>__("Yes"),"N"=>__("No")),"key"=>true,"required"=>false)),
                  //  "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),     

            "sortby"=>new mfValidatorChoice(array("choices"=>new mfArray(array('most_requested'=>__('Most requested'),
                                                                                'most_recent'=>__('Most recent'),     
                                                                                'created_asc'=>__("Date asc"), 
                                                                                'top_rated'=>__("Top rated")
                                                                               )),'required'=>false,'key'=>true)),        
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        )); 
       
        $this->_query=new mfQuery();
        $this->_query->select("{fields}")
                    ->from(Employee::getTable())
                    ->left(EmployeeContent::getInnerForJoin('employee_user_id'))
                    ->left(EmployeeContentI18n::getInnerForJoin('content_id')." AND ".EmployeeContentI18n::getTableField('lang')."='{lang}'") 
                    ->innerIf($this->defaults['in']['skill_id'],EmployeeUserSkill::getInnerForJoin('employee_user_id'))     
                    ->innerIf($this->defaults['in']['user_language'],EmployeeUserLanguage::getInnerForJoin('employee_user_id')) 
                    ->where(Employee::getTableField('is_active')."='YES' AND ".Employee::getTableField('is_validated')."='YES'".
                            " AND ".Employee::getTableField('is_active')."='YES'".
                            " AND ".Employee::getTableField('is_completed')."='YES'");                       
       //  echo (string)$this->_query;          
        $this->setQuery((string)$this->_query);    
       
       
    /*    $this->setQuery("SELECT {fields} FROM ".Employee::getTable(). 
                       " LEFT JOIN ".EmployeeContent::getInnerForJoin('employee_user_id').
                       " LEFT JOIN ".EmployeeContentI18n::getInnerForJoin('content_id')." AND ".EmployeeContentI18n::getTableField('lang')."='{lang}'".
                       " WHERE ".Employee::getTableField('is_active')."='YES' AND ".Employee::getTableField('is_validated')."='YES'".
                            " AND ".Employee::getTableField('is_active')."='YES'".
                            " AND ".Employee::getTableField('is_completed')."='YES'".                                                
                       ";"); */
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

