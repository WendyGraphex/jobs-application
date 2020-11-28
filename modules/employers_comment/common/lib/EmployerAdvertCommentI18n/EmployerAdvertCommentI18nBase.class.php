<?php


class EmployerAdvertCommentI18nBase extends CustomerAdvertCommentI18n {
        
      protected static $fields=array('comment_id','lang','message','is_active','created_at','updated_at');    
   // const table="t_employer_advert_comment_i18n"; 
  //  protected static $fieldsNull=array('updated_at');  
     protected static $foreignKeys=array('comment_id'=>'EmployerAdvertComment');  


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
    
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new EmployerAdvertCommentI18nFormatter($this):$this->formatter;
    }
    
               
      function getComment()
    {
        return $this->_comment_id=$this->_comment_id===null?new EmployerAdvertComment($this->get('comment_id')):$this->_comment_id;
    }
    
   
}
