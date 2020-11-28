<?php

class CustomerCourseCategoryCourseBase extends mfObject3 {
     
    protected static $fields=array('course_i18n_id','category_id','created_at','updated_at');    
    const table="t_customer_course_category_course"; 
    protected static $foreignKeys=array('category_id'=>'CustomerCourseCategory',
                                        'course_i18n_id'=>'CustomerAcademyCourseI18n');  
    protected static $fieldsNull=array('updated_at');  


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
        ));      
    }
            
      function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }   
            
    
          
     function getCourseI18n()
    {
       return $this->_course_i18n_id=$this->_course_i18n_id===null?new CustomerAcademyCourseI18n($this->get('course_i18n_id')):$this->_course_i18n_id;                 
    } 
    
     function getCategory()
    {
        return $this->_category_id=$this->_category_id===null?new CustomerCourseCategory($this->get('category_id')):$this->_category_id;
    }
    
    
}