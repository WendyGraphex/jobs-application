<?php


class CustomerAcademyCourseI18nNewForm extends CustomerAcademyCourseI18nBaseForm {
         
       protected $course_i18n=null;
       
      function __construct(CustomerAcademyTeacherUser $user,$defaults = array(), $options = array()) {
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    function getUser()
    {
        return $this->user;
    }  
    function configure()
    {
        parent::configure();
        $this->addValidators(array(
            'id'=>new ObjectExistsValidator('CustomerAcademyCourseI18n',array('key'=>false,'required'=>false)),    
            'categories'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('categories')),array('required'=>false)),
            'level_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=>CustomerAcademyLevel::getLevelsForSelect()->unshift(array(''=>'')))),
            'duration'=>new mfValidatorInteger(array('min'=>0,'max'=>1000,'required'=>false))
            ));
        
     //   unset($this['id']);
    }
    
     function getCourseI18n()
    {                      
       if ($this->course_i18n===null)
       {    
          $this->course_i18n=new CustomerAcademyCourseI18n($this->getDefault('id')?$this->getDefault('id'):null,$this->getUser());
          $this->course_i18n->add($this->isValid()?$this->getValues():$this->getDefaults());
       }
       return $this->course_i18n;       
    }
    
    function getValues()
    {
        $values=parent::getValues();
        $values['categories']=$this->getCategories();        
        return $values;
    }
    
      function getCategories()
    {
        return CustomerCourseCategory::getCategoriesFromSelection($this['categories']->getArray());
    }
}

