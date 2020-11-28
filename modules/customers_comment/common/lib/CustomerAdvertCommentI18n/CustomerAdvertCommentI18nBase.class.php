<?php


class CustomerAdvertCommentI18nBase extends mfObject3 {
        
      protected static $fields=array('comment_id','lang','message','is_active','created_at','updated_at');    
    const table="t_customer_advert_comment_i18n"; 
    protected static $fieldsNull=array('updated_at');  
     protected static $foreignKeys=array('comment_id'=>'CustomerAdvertComment');  


    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);                     
          return $this->add($parameters); 
      }   
      else
      {         
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
      
      }   
    }
    
     protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),    
            'is_active'=>'NO',
        ));      
    }
              
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }            
    
      function getLanguage()
    {
        return new LanguageFormatter($this->get('lang'));
    }
}
