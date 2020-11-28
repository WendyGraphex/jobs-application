<?php


class CustomerAcademyStudentUserMyProfileForm extends CustomerAcademyStudentUserBaseForm {
    
     
    protected $user=null;
    
     function __construct(CustomerAcademyStudentUser $user,$defaults = array(), $options = array()) {
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
         //   echo "<pre>"; var_dump($this->getDefault('skills'));
        } 
        parent::configure();     
        if (!$this->getUser()->isFromInstagram() && !$this->getUser()->isFromlinkedin() && !$this->getUser()->isCompleted())
           unset($this['email']);   
        
        $day = new Day();
        $day_range=new mfArray();
        $day_range->range(1,31,1,true)->unshift(array(''=>__('Day')));
        $year_range=new mfArray();
        $year_range->range($day->getYearSub($this->getSettings()->getNumberOfYearBirthDay())->getYear(),$day->getYearSub(70)->getYear(),1,true)->unshift(array(''=>__('Year')));
        
        $this->addValidators(array(
            'password'=> new mfValidatorSecurePassword(array('required'=>false,'min_length'=>8,'max_length'=>'16','number_of_special'=>1,'number_of_digit'=>2,'number_of_upper'=>1,'special_list'=>"#'()@[]{}=+*/.!;?,:$&",'must_match'=>true)), 
            'repassword'=> new mfValidatorString(array('required'=>false)),
            'birthday_day'=>new mfValidatorChoice(array('choices'=>$day_range,'required'=>false)),
            'birthday_month'=>new mfValidatorChoice(array('choices'=>array(''=>__('Month'))+Day::getMonthsI18n(),'key'=>true,'required'=>false)),
            'birthday_year'=>new mfValidatorChoice(array('required'=>false,'choices'=>$year_range)),
        ));      
        if ($this->getDefault('password'))
        {
           $this->password->setOption('required',true);
           $this->repassword->setOption('required',true);
        }    
        unset($this['id']);     
        $this->validatorSchema->setPostValidator(new mfValidatorSchemaCompare('password', mfValidatorSchemaCompare::EQUAL, 'repassword',array('operator_error'=>true),array("invalid"=>__("password and repassword must be equal."))));                      
    }       
    
    
    function getValues()
    {
        $values=parent::getValues();
        if (!$values['password'])
            unset($values['password'],$values['repassword']);
        return $values;
    }
    
    function getAvatar()
    {
        return $this['avatar']->getValue();
    }
    
     function getSettings()
    {
        return $this->settings=$this->settings===null?new CustomerAcademyStudentUserSettings():$this->settings;
    }
}


