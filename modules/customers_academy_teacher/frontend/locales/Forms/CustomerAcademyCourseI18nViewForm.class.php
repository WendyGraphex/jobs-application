<?php


class CustomerAcademyCourseI18nViewForm extends CustomerAcademyCourseI18nBaseForm {
         
       protected $course_i18n=null;
       
      function __construct(CustomerAcademyCourseI18n $course_i18n,$defaults = array(), $options = array()) {
        $this->course_i18n=$course_i18n;
        parent::__construct($defaults, $options);
    }
    
    function getUser()
    {
        return $this->user;
    }  
    
    function configure()
    {
        if (!$this->hasDefaults())
        {
            $this->setDefault('categories', $this->getCourseI18n()->getCourseCategories()->getCategories()->getKeys()->toArray());
        }    
        parent::configure();
          $this->addValidators(array(       
            'categories'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('categories')),array('required'=>false)),
            'level_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=>CustomerAcademyLevel::getLevelsForSelect()->unshift(array(''=>'')))),
              'duration'=>new mfValidatorInteger(array('min'=>0,'max'=>1000,'required'=>false))
            ));
        
    }
    
     function getCourseI18n()
    {                      
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

