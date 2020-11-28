<?php


class PartnerWorkCategoryDialogFormFilter extends mfFormFilterBase {

    protected $language=null,$node=null;
    
    function __construct($node,$language)
    {
       $this->language=$language;     
       $this->node=$node;
       parent::__construct();      
    }
    
    function getNode()
    {
        return $this->node;
    }
    
    function getLanguage()
    {
      return $this->language;
    } 
    
    function configure()
    {                         
       $this->addDefaults(array(          
            'order'=>array(
                "rb"=>"desc",    
              /*  "id"=>"asc",
                "name"=>"asc",
                "title"=>"asc",
                "created_at"=>"asc",
                "updated_at"=>"asc",*/
            ), 
            'equal'=>array(
                // "is_active"=>'YES',
            )   ,     
          //  'lang'=>$this->getLanguage(),     
            'nbitemsbypage'=>"10",
       ));          
       $this->setClass('PartnerWorkCategory');
       
       $this->setFields(array(                      
           'title'=>array(
              'class'=>'PartnerWorkCategoryI18n',
              'search'=>array('conditions'=>
                                                 "(".
               PartnerWorkCategoryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%' OR ".
                  PartnerWorkCategory::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{title}%%'".
                                                 ")")
                                ),  
           ));
       $this->setQuery("SELECT {fields} FROM ".PartnerWorkCategory::getTable(). 
                       " LEFT JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id')." AND lang='{lang}'".                     
                       " WHERE level={levelplusone} AND  lb >= {lb} AND rb <= {rb} ".
                       ";"); 

       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                                  
                     "rb"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                     "title"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                  
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                "id"=>new mfValidatorString(array("required"=>false)),                              
                             "title"=>new mfValidatorString(array("required"=>false)),                            
                            ),array("required"=>false)),                             
                'range' => new mfValidatorSchema(array(   
                                         
                                ),array("required"=>false)),                                                         
                'equal' => new mfValidatorSchema(array(
                  
                    ),array("required"=>false)),                                                    
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
        
    function getQuery()
    {
         if ($this->query_valid)
             return $this->query;   
         if ($this->values['search']['title'])
         {             
             $this->setQuery("SELECT {fields} FROM ".PartnerWorkCategory::getTable(). 
                       " LEFT JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id')." AND lang='{lang}'".                     
                       " WHERE lb >= {lb} AND rb <= {rb} ".
                       ";"); 
             $this->setParameter('lb',$this->getNode()->get('lb'));
             $this->setParameter('rb',$this->getNode()->get('rb'));            
         }        
        return parent::getQuery();
    }
    
    
}

