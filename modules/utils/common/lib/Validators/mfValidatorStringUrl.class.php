<?php

class mfValidatorStringUrl extends mfValidatorString  {

   protected function configure($options = array(), $messages = array())
  {
       parent::configure($options, $messages);   
    $this->addOption('replace',array(' '));   
    $this->addOption('replacement','-');   
  }

  protected function doIsValid($value)
  {
    $clean = new mfString(parent::doIsValid($value));
    return (string)$clean->replace($this->getOption('replace'), $this->getOption('replacement'))->noaccent();       
  }  
    
}