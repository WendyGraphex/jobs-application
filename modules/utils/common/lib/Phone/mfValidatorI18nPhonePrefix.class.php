<?php

class mfValidatorI18nPhonePrefix extends mfValidatorRegex {
    
  protected function configure($options = array(), $messages = array())
  {       
    parent::configure($options, $messages);
    $this->addOption('culture');  
    $culture=isset($options['culture']) ? $options['culture'] : mfContext::getInstance()->getUser()->getCulture(); 
    $regex=mfCultureInfo::getInstance($culture)->findInfo('PhoneValidatorRegex'); 
    $this->setOption('pattern', $regex);
  }        
    
}

