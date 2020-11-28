<?php

 class mfValidatorPermissionExists extends mfValidatorBase {
        
    
    function configure($options = array(), $messages = array()) {       
        $this->addOption('lang');
        parent::configure($options,$messages);           
        $this->addMessage('exist', __('[{value}] already exists.'));
    }
    
    function doIsValid($value) {
        if (!isset($value['name']) || !isset($value['title']))
            return $value;
        if ($value['name']=="" || $value['title']=="")
            return $value;                 
        $errors=array();
        $value['lang']=(string)$this->getOption('lang');
        $permission_i18n=new PermissionI18n(array_merge($value,array('application'=>'admin')));        
        if ($permission_i18n->isLoaded() && $permission_i18n->get('title')==$value['title'])
        {
            $errors['title']=new mfValidatorError($this, 'exist',array('value'=>$value['title']));
        } 
        if ($permission_i18n->getPermission()->isLoaded() && $permission_i18n->getPermission()->get('name')==$value['name'])
        {
            $errors['name']=new mfValidatorError($this, 'exist',array('value'=>$value['name']));
        }         
        if (!empty($errors))
        {
             throw new mfValidatorErrorSchema($this, $errors);
        }          
        return $value;
    }
} 

class PermissionNewForm extends mfForm {

   static $groups=array();
    
    
    function configure() { 
        if (!self::$groups)
             self::$groups=array(""=>"")+PermissionGroupUtils::getPermissionsGroupForI18nSelect();
         $this->setValidators(array(
            'name' => new mfValidatorName(), // @TODO define min max + messages    
            'title' => new mfValidatorName(), // @TODO define min max + messages    
            'group_id'=>new mfValidatorChoice(array("required"=>false,"key"=>true,"choices"=>self::$groups))
        ));
        $this->validatorSchema->setPostValidator(new mfValidatorPermissionExists($this->getDefaults()));
    }
}

class PermissionsI18nNewForm extends mfForm {

    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {              
        $this->language=$language;                        
        parent::__construct($defaults);
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure() 
    {     
        if (!$this->hasDefaults())
            $this->setDefault('lang',$this->getLanguage());      
        $this->setDefault('count', $this->getDefault('count',2)); // Number of form fields by default     
        $this->setValidators(array(
            'count'=>new mfValidatorInteger(array('min'=>1,"max"=>10)),   // min/max form fields  
            'lang'=> new LanguagesExistsValidator(array(),'admin'), //   
        ));
        $this->embedFormForEach('collection',new PermissionNewForm(array('lang'=>$this->getDefault('lang')),array()),$this->getDefault('count')); 
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'checkPermissions'))));
    }
    
    function checkPermissions($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;      
        $checkin=array();
        $error=false;                
        // Check item in double 
        foreach ($values['collection'] as $index=>$form)
        {
            foreach ($form as $key=>$value)
            {
              try
              {  
                  if (in_array($key,array('name','title')) && $value!="")
                  {        
                      if ($checkin[(string)$value."_".$key]==true)
                            throw new mfValidatorError($this['collection'][$index][$key]->getValidator(),__('this {key} [{value}] already exists in this form.'),array('key'=>$key,'value'=>$value));
                      $checkin[(string)$value."_".$key]=true;
                   }
               }
               catch (mfValidatorError $e)
               {
                       $this['collection'][$index][$key]->setError($e);
                       $error=true;
               }
            }    
        }  
        if ($error)
           throw new mfValidatorErrorSchema($validator,array("collection"=>new mfValidatorError($validator,"error")));  // Dummy Exception with no error
        return $values;
    }
}