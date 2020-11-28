<?php


class EmployerCompletionForm extends EmployerUserBaseForm {
    
    protected $user=null,$is_completed=false;
    
    function __construct(EmployerUser $user,$defaults = array(), $options = array()) {
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    
    function getEmployerUser()
    {
        return $this->user;
    }
    
    function configure()
    {       
        parent::configure();
        $this->addValidators(array(
             'function_id'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerFunction::getAllI18nForSelect()->unshift(array(''=>__('Select a function'))))),
              'default_language'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> LanguageUtils::getFormattedFrontendLanguages())),
              'categories'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('categories')),array('required'=>false)),              
        ));
        $this->createEmbedFormForEach('languages','EmployerUserLanguageForm', $this->getDefault('languages')?count($this->getDefault('languages')):1,array('required'=>false));
        if ($this->getEmployerUser()->isProfessional() && $this->getEmployerUser()->isAdmin())  
        {                 
            $this->embedForm('company', new EmployerCompanyForm($this->getDefault('company'))); 
            $this->company->addValidator('activity_id',new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerActivity::getAllI18nForSelect()->unshift(array(''=>__('Select an activity'))))));        
            $this->company->addValidator('registration',new mfValidatorString(array()));
            unset($this->company['id']);
        }    
        elseif ($this->getEmployerUser()->isPrivate())
        {
           $this->setValidator('activity_id',new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=> EmployerActivity::getAllI18nForSelect()->unshift(array(''=>__('Select an activity'))))));            
        }    
       if (!$this->getEmployer()->isFromInstagram() && !$this->getEmployer()->isFromlinkedin())
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
        $user=new EmployerUser(array('username'=>$values['username']));    
        if ($user->isLoaded() && $user->get('id') != $this->getEmployerUser()->get('id'))
            throw new mfValidatorErrorSchema($validator,array('username'=>new mfValidatorError($this->username,__('Username already exists.'))));        
        return $values;
    }
    
    function hasCompany()
    {
        if ($this->hasValidator('company'))
            return (boolean)$this['company']->getValue();
        return false;
    }
    
    function getCompany()
    {
       return  $this['company']->getValue(); 
    }
    
    function getValues()
    {
        $values=parent::getValues();
       if ($this->getEmployerUser()->isPrivate() && !$this->getEmployerUser()->isCompleted())
       {    
             $values['is_completed']='YES';
             $this->is_completed=true;
       }
        if (!$values['password'])
            unset($values['password']);
        unset($values['avatar'],$values['company']);
        return $values;
    }
    
     function getValuesForCompany()
    {
        $values=  parent::getValue('company');
        unset($values['logo'],$values['picture']);
        if ($this->getEmployerUser()->isProfessional() && !$this->getEmployerUser()->getCompany()->isCompleted())
        {    
            $values['is_completed']='YES';
            $this->is_completed=true;
        }
        return $values;
    }
    
    function getAvatar()
    {
        return $this['avatar']->getValue();
    }
    
    function getLogo()
    {
        return $this['company']['logo']->getValue();
    }
    
     function getPicture()
    {
        return $this['company']['picture']->getValue();
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


