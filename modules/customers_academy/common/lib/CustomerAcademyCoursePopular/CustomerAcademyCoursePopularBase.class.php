<?php

class CustomerAcademyCoursePopularBase extends mfObject3 {
         
    protected static $fields=array('course_i18n_id','student_user_id','lang','country','ip','created_at','updated_at');    
    const table="t_customer_academy_course_popular"; 
    protected static $fieldsNull=array('updated_at','student_user_id');  
    protected static $foreignKeys=array('student_user_id'=>'CustomerAcademyStudentUser',
                                         'course_i18n_id'=>'CustomerAcademyCourseI18n',
                                      );  

    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);   
          if (isset($parameters['course']) && isset($parameters['user']) && $parameters['course'] instanceof CustomerAcademyCourseI18n)
            return $this->loadbyCourseAndUser($parameters['course'],$parameters['user']);    
          return $this->add($parameters); 
      }
      else
        {         
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);
         
        } 
    }   
    
      function loadbyCourseAndUser(CustomerAcademyCourseI18n $course,$user)
    {
        $this->set('course_id',$course);
        $this->set('lang',$user->getLanguage());
        $this->set('country',$user->getCountry());
        if ($user->isAuthenticated() && $user->isStudentUser())
            $this->set('student_user_id',$user->getGuardUser());      
    }
     /* protected function loadByPhoneOrMobile($phone)
      {       
           $this->set('phone',$phone);
           $db=mfSiteDatabase::getInstance()->setParameters(array('phone'=>$phone));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE phone='{phone}' OR mobile='{phone}';")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      }*/
      
     
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
            
    /*  protected function executeIsExistQuery($db)    
      {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }*/
          
   
      
       function hasStudentUser()
      {
            return (boolean)$this->get('student_user_id');
      }
          
   
      function geStudentUser()
    {
        return $this->_student_user_id=$this->_student_user_id===null?new CustomerAcademyStudentUser($this->get('student_user_id')):$this->_student_user_id;
    }
    
      function getCourseI18n()
    {
        return $this->_course_i18n_id=$this->_course_i18n_id===null?new CustomerAcademyCourseI18n($this->get('course_i18n_id')):$this->_course_i18n_id;
    }
    
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new CustomerAcademyCoursePopularFormatter($this):$this->formatter;
   }
   
   
    function create()
    {     
        $this->set('ip',mfContext::getInstance()->getRequest()->getIP());      
        $this->save();        
        $this->getCourseI18n()->set('number_of_views',$this->getCourseI18n()->getNumberOfViews() + 1)->save();
        return $this;
    }
}