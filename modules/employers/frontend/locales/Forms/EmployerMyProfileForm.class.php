<?php


class EmployerMyProfileForm extends EmployerUserBaseForm {
    
    protected $user=null;
    
     function __construct(EmployerUser $user,$defaults = array(), $options = array()) {
         $this->user=$user;
         parent::__construct($defaults, $options);
     }
     
     function getUser()
     {
         return $this->user;
     }
     
    function configure()
    {       
        if (!$this->getDefaults())
        {
            $this->setDefaults(array(              
                'languages'=>$this->getUser()->getUserLanguages()->toForm()->toArray(),         
            ));                    
         //   echo "<pre>"; var_dump($this->getDefault('skills'));
        } 
        
        $day = new Day();
        
        $day_range=new mfArray();
        $day_range->range(1,31,1,true)->unshift(array(''=>__('Day')));
        
         $year_range=new mfArray();
        $year_range->range($day->getYearSub($this->getSettings()->getNumberOfYearBirthDay())->getYear(),$day->getYearSub(70)->getYear(),1,true)->unshift(array(''=>__('Year')));
        
        parent::configure(); 
        if ($this->getUser()->isProfessional())
        {          
           unset($this['address1'],$this['address2'],$this['postcode'],$this['city'],$this['country'],$this['state']);            
        }
        else        
        {          
           $this->setValidator('activity_id',new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerActivity::getAllI18nForSelect()->unshift(array(''=>__('Select an activity'))))));            
        }
        if (!$this->getUser()->isCompleted())
            unset($this['email']);
        $this->addValidators(array(
            'password'=> new mfValidatorSecurePassword(array('required'=>false,'min_length'=>8,'max_length'=>'16','number_of_special'=>1,'number_of_digit'=>2,'number_of_upper'=>1,'special_list'=>"#'()@[]{}=+*/.!;?,:$&",'must_match'=>true)), 
            //'password'=> new mfValidatorSecurePassword(array('required'=>false,'number_of_special'=>1,'number_of_digit'=>2,'number_of_upper'=>1,'special_list'=>"-_#",'must_match'=>true)), 
            'repassword'=> new mfValidatorString(array('required'=>false)),
            'function_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerFunction::getAllI18nForSelect()->unshift(array(''=>__('Select a function'))))),           
            'default_language'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> LanguageUtils::getFormattedFrontendLanguages())),
            'categories'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('categories')),array('required'=>false)),
            'birthday_day'=>new mfValidatorChoice(array('choices'=>$day_range,'required'=>false)),
            'birthday_month'=>new mfValidatorChoice(array('choices'=>array(''=>__('Month'))+Day::getMonthsI18n(),'key'=>true,'required'=>false)),
            'birthday_year'=>new mfValidatorChoice(array('required'=>false,'choices'=>$year_range)),
        ));
        $this->createEmbedFormForEach('languages','EmployerUserLanguageForm', $this->getDefault('languages')?count($this->getDefault('languages')):1,array('required'=>false));
        if ($this->getDefault('password'))
        {
           $this->password->setOption('required',true) ;
           $this->repassword->setOption('required',true) ;
        }    
        unset($this['id']);     
      //  $this->validatorSchema->setPostValidator(new mfValidatorSchemaCompare('password', mfValidatorSchemaCompare::EQUAL, 'repassword',array('operator_error'=>true),array("invalid"=>__("password and repassword must be equal."))));         
         $this->validatorSchema->setPostValidator(new mfValidatorCallbacks(new mfArray(array(
                 new mfValidatorCallback(array('callback' => array($this, 'check'))),
                 new mfValidatorSchemaCompare('password', mfValidatorSchemaCompare::EQUAL, 'repassword',array('operator_error'=>true),array("invalid"=>__("password and repassword must be equal.")))
                 ))));
    } 
    
    
     function check($validator,$values)
    {
        if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
            return $values; 
        $user=new EmployerUser(array('username'=>$values['username']));    
        if ($user->isLoaded() && $user->get('id') != $this->getUser()->get('id'))
            throw new mfValidatorErrorSchema($validator,array('username'=>new mfValidatorError($this->username,__('Username already exists.'))));        
        return $values;
    }
    
    function getValues()
    {
        $values=parent::getValues();
        if (!$values['password'])
            unset($values['password'],$values['repassword']);
        if ($this['birthday_year']->getValue() && $this['birthday_month']->getValue() && $this['birthday_day']->getValue())
            $values['birthday']=$this['birthday_year']->getValue()."-".sprintf ("%02d",$this['birthday_month']->getValue())."-".sprintf ("%02d",$this['birthday_day']->getValue());    
        else
           $values['birthday']=null;         
        return $values;
    }
    
     function getAvatar()
    {
        return $this['avatar']->getValue();
    }
    
    function getCategories()
    {
        return PartnerWorkCategory::getCategoriesFromSelection($this['categories']->getArray());
    }
    
     function getUserLanguages()
    {        
        if ($this['languages']->isEmpty())
                return new mfArray();
            return $this['languages']->getArray();   
    } 
    
    
      function getLanguages()
    {
        return $this->_languages=$this->_languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():$this->_languages;
    }
    
     function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployerSettings():$this->settings;
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


