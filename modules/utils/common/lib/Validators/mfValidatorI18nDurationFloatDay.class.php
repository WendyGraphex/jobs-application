<?php


class mfValidatorI18nDurationFloatDay extends mfValidatorI18nNumber
{

  protected function configure($options = array(), $messages = array())
  {   
    $this->addOption('format', 's');       
    parent::configure($options,$messages);
  }
  
  protected function doIsValid($value)
  {
    if ($this->getOption('format')=='s')
        return (int) 3600 * 24 * parent::doIsValid($value);    
    if ($this->getOption('format')=='m')
        return (int) 24 * 60 * parent::doIsValid($value);
    if ($this->getOption('format')=='h')
        return  24 * parent::doIsValid($value);
    return parent::doIsValid($value);
  }
 
  
}
