<?php

class CustomerAcademyCourseI18n extends CustomerAcademyCourseI18nBase {
         
 
    function __construct($parameters = null,$user=null) {       
        if ($user instanceof CustomerAcademyTeacherUser)
            $this->set('teacher_user_id',$user);
        $this->getDefaults();       
        if (is_numeric($parameters) && $user instanceof CustomerAcademyTeacherUser)      
            return $this->loadByIdAndTeacher($parameters,$user);     
         if (is_array($parameters) && isset($parameters['id']) && $user instanceof CustomerAcademyTeacherUser)      
            return $this->loadByIdAndTeacher($parameters['id'],$user);     
        if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByIdAndTeacher($id,CustomerAcademyTeacherUser $user)
    {                  
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'teacher_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('teacher_user_id')."='{teacher_user_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
       //echo $db->getQuery();
        return $this->rowtoObject($db); 
    }
                    
    function upload()
    {
        if ($this->isNotLoaded())
            $this->set('state','UPLOAD')->save();                                        
        return $this;
    }
}