<?php


class EmployerCommentFormFilter extends mfFormFilter2 {

      
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
                 'in'=>array(
                    
                 ),
                 'equal'=>array(
                  
                 ), 
                'range'=>array(
                    
                ),
                 'nbitemsbypage'=>"10",
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
        
       $this->setClass('EmployerAdvertComment');
       
       $this->setFields(array(
             
           ));
      
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                         "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                  //   "published_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                  //   "number_of_views"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                      
                   
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
               ),array("required"=>false)),      
            'range' => new mfValidatorSchema(array(   
                            //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                         
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                           
                            ),array("required"=>false)),                                 
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));  
                   
        $this->setQuery(mfQuery::getInstance()->select("{fields}")
                    ->from(EmployerAdvertComment::getTable())                              
                    ->inner(EmployerAdvertComment::getOuterForJoin('employee_user_id'))                          
                    ->inner(EmployerAdvertCommentI18n::getInnerForJoin('comment_id'))       
                    ->where(EmployerAdvertComment::getTableField('is_active')."='YES' AND sender='EMPLOYEE' AND ".
                            EmployerAdvertComment::getTableField('employer_user_id')."='{employer_user_id}' "
                            ));    
    }
    
   
}

