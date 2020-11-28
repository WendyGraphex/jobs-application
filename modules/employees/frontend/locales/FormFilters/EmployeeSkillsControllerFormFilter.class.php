<?php


class EmployeeSkillsControllerFormFilter extends mfFormFilterBase {

      
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
               //  'sortby'=>'most_requested',
                 'order'=>array(
                        'title'=>'asc'
                 ), 
                 'in'=>array(
                     
                 ),
                 'equal'=>array(
                     
                 ), 
                'range'=>array(
                 
                ),
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
        
       $this->setClass('EmployeeSkillI18n');
       
       $this->setFields(array(   
         //  'number_of_employees'=>array('class'=>''),
         //  'is_online'=>'Employee',         
         //  'country'=>'Employee',
         //  'skill_id'=>'EmployeeUserSkill',
         //  'experience_id'=>'Employee',
         //  'level_id'=>'Employee',
         //  'user_language'=>array('class'=>'EmployeeUserLanguage','name'=>'lang'),       
          /*  'city'=>array('class'=>'Employee',
               'search'=>array('conditions'=>
                     
                            Employee::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '%%{city}%%'  "                            
                        ),                                          
            ),*/
           
                        
           ));
      
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                   //      "budget"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                 //    "number_of_employees"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                      
                   // "title"=>new mfValidatorMultiple(new mfValidatorString(array("required"=>false)),array("required"=>false,'separator'=>" ")),
                    //  "city"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),      
           'begin' => new mfValidatorSchema(array(                      
                    //  "city"=>new mfValidatorString(array("required"=>false)),
                    //  "title"=>new mfValidatorString(array("required"=>false)),
                   //  "lastname"=>new mfValidatorString(array("required"=>false)),
                   //  "email"=>new mfValidatorString(array("required"=>false)),
                   //  "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),
           'in' => new mfValidatorSchema(array(   
                       //     'country'=>new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),                        
                       //     'skill_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getSkillsForSelect()->unshift(array(''=>__('All skills'))))),
                       //     'user_language'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getLanguagesForSelect()->unshift(array(''=>__('All languages'))))),                         
                       //     'experience_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getExperiencesForSelect()->unshift(array(''=>__('All experiences'))))),
                      //      'level_id'=> new mfValidatorChoice(array('key'=>true,'multiple'=>true,'required'=>false,'choices'=> EmployeeUtils::getLevelsForSelect()->unshift(array(''=>__('All study levels'))))),                           
               ),array("required"=>false)),      
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                         //   "budget"=>new mfValidatorIntegerRangeCompare(array("required"=>false,'min'=>EmployeeAdvertUtils::getMinBudget(),'max'=>EmployeeAdvertUtils::getMaxBudget())),           
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                   // 'lang'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployeeAdvertUtils::getFormattedLanguagesForSelect()->unshift(array(''=>__("All languages"))))),
                  //  'country'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployeeUtils::getFormattedCountriesForSelect()->unshift(array(''=>__("All countries"))))),
                  //  'is_online'=> new mfValidatorChoice(array("choices"=>array(""=>__("All"),"Y"=>__("Yes"),"N"=>__("No")),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                  //  "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),     
            "sortby"=>new mfValidatorChoice(array("choices"=>new mfArray(array('most_requested'=>__('Most requested'),
                                                                                'most_recent'=>__('Most recent'),                                                                               
                                                                                'most_popular'=>__("Most Popular"),     
                                                                                'top_rated'=>__("Top rated")
                                                                               )),'required'=>false,'key'=>true)),                   
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));  
       
                             
        // echo (string)$this->_query;  die(__METHOD__);        
        $this->setQuery((string)mfQuery::getInstance()->select("{fields}")
                    ->from(EmployeeSkill::getTable())                                                        
                    ->inner(EmployeeSkillI18n::getInnerForJoin('skill_id'))                                     
                    ->where(EmployeeSkillI18n::getTableField('lang')."='{lang}'"));    
    }
    
   /* function buildSortbyQuery($value)
    {
       $values=array();
       if ($value=='most_requested')       
           $values['number_of_views']='desc';                 
       $this->buildOrderQuery($values);       
    }*/
    
   
}

