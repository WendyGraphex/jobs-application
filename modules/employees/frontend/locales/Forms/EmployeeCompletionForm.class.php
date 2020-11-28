<?php


class EmployeeCompletionForm extends EmployeeBaseForm {
    
    protected $user=null,$is_completed=false;
    
    function __construct(Employee $user,$defaults = array(), $options = array()) {
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    
    function getEmployee()
    {
        return $this->user;
    }
    function configure()
    {   
        if (!$this->getDefaults())
        {
            $this->setDefaults(array(
                'skills'=>$this->getEmployee()->getUserSkills()->toForm()->toArray(),
                'languages'=>$this->getEmployee()->getUserLanguages()->toForm()->toArray(),   
                'diplomas'=>$this->getEmployee()->getUserDiplomas()->toForm()->toArray(),   
            ));                    
         //   echo "<pre>"; var_dump($this->getDefault('skills'));
        }
        parent::configure();    
        unset($this['birthday']);
        $day = new Day();
        $day_range=new mfArray();
        $day_range->range(1,31,1,true)->unshift(array(''=>__('Day')));
        
        $year_range=new mfArray();
        $year_range->range($day->getYearSub($this->getSettings()->getNumberOfYearBirthDay())->getYear(),$day->getYearSub(70)->getYear(),1,true)->unshift(array(''=>__('Year')));                
        
         $this->addValidators(array(
              'function_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployeeFunction::getAllI18nForSelect()->unshift(array(''=>__('Select a function'))))),
              'experience_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployeeExperience::getAllI18nByPositionForSelect()->unshift(array(''=>__('Select an experience'))))),
              'level_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployeeStudyLevel::getAllI18nForSelect()->unshift(array(''=>__('Select an study level'))))),
              'default_language'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> LanguageUtils::getFormattedFrontendLanguages())),
              'categories'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('categories')),array('required'=>false)),
              'birthday_day'=>new mfValidatorChoice(array('choices'=>$day_range,'required'=>false)),
            'birthday_month'=>new mfValidatorChoice(array('choices'=>array(''=>__('Month'))+Day::getMonthsI18n(),'key'=>true,'required'=>false)),
            'birthday_year'=>new mfValidatorChoice(array('required'=>false,'choices'=>$year_range)),
        ));         
        $this->embedFormForEach('languages',new EmployeeUserLanguageForm($this->getDefault('languages')), $this->getDefault('languages')?count($this->getDefault('languages')):1);
        $this->embedFormForEach('diplomas',new EmployeeUserGraduateDiplomaForm($this->getDefault('diplomas')), $this->getDefault('diplomas')?count($this->getDefault('diplomas')):1,array('required'=>false));
        $this->embedFormForEach('skills',new EmployeeUserSkillForm($this->getDefault('skills')), $this->getDefault('skills')?count($this->getDefault('skills')):1,array('required'=>false));
      //  if ($this->getEmployee()->isProfessional())  
       // {                
           // $this->embedForm('company', new EmployeeCompanyForm($this->getDefault('company'))); 
            //unset($this->company['id']);
       // }         
        if (!$this->getEmployee()->isFromInstagram() && !$this->getEmployee()->isFromlinkedin())
           unset($this['email']);   
        unset($this['id']);    
           $this->validatorSchema->setPostValidator(new mfValidatorCallbacks(new mfArray(array(
                 new mfValidatorCallback(array('callback' => array($this, 'check'))),                
                 ))));
    }       
    
    function check($validator,$values)
    {
        if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
            return $values; 
        $user=new Employee(array('username'=>$values['username']));    
        if ($user->isLoaded() && $user->get('id') != $this->getEmployee()->get('id'))
            throw new mfValidatorErrorSchema($validator,array('username'=>new mfValidatorError($this->username,__('Username already exists.'))));        
        return $values;
    }
    
    function getValues()
    {
        $values=parent::getValues();
       if (!$this->getEmployee()->isCompleted())
       {    
             $values['is_completed']='YES';
             $this->is_completed=true;
       }
         if (!$values['password'])
            unset($values['password']);
    //    unset($values['company']);
         if ($this['birthday_year']->getValue() && $this['birthday_month']->getValue() && $this['birthday_day']->getValue())
            $values['birthday']=$this['birthday_year']->getValue()."-".sprintf ("%02d",$this['birthday_month']->getValue())."-".sprintf ("%02d",$this['birthday_day']->getValue());    
        else
           $values['birthday']=null;    
        return $values;
    }
    
   /*  function getValuesForCompany()
    {
        $values=  parent::getValue('company');       
        $values['is_completed']='YES';
        return $values;
    }*/
    
    
     function getAvatar()
    {
        return $this['avatar']->getValue();
    }
    
  /*  function getLogo()
    {
        return $this['company']['logo']->getValue();
    }
    
     function getPicture()
    {
        return $this['company']['picture']->getValue();
    }*/
        
     function getCategories()
    {
        return PartnerWorkCategory::getCategoriesFromSelection($this['categories']->getArray());
    }
    
     function getUserLanguages()
    {
        return $this['languages']->getArray();
    } 
    
    function getUserSkills()
    {
        return $this['skills']->getArray();
    } 
    
     function getUserDiplomas()
    {
        return $this['diplomas']->getArray();
    } 
    
    function getLanguages()
    {
        return $this->_languages=$this->_languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():$this->_languages;
    }
    
     function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployeeSettings():$this->settings;
    }
    
     function isCompleted()
    {
        return $this->is_completed;
    }
    
     function getDefaults()
    {
        if ($this->isValid())
            return parent::getDefaults();
        $values=parent::getValues();        
        unset($values['password'],$values['repassword']);
        return $values;
    }
}


