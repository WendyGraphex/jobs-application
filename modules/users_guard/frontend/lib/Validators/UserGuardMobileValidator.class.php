<?php

class UserGuardMobileValidator extends mfValidatorBase
{
  public function configure($options = array(), $messages = array())
  {
    $this->addOption('email_field', 'email');
    $this->addOption('password_field', 'password');
    $this->setMessage('invalid', __('The email and/or password is invalid.'));
  }

  protected function doIsValid($values)
  {      
    if (isset($values[$this->getOption('email_field')]) && isset($values[$this->getOption('email_field')]))
    {
      if ($values[$this->getOption('email_field')]==''||$values[$this->getOption('password_field')]=='')
          return $values;
      $email = $values[$this->getOption('email_field')];
      $password = md5($values[$this->getOption('password_field')]);
      $profiles=UserGuardUtils::findByEmailAndPassword($email, $password);      
      if ($profiles->hasProfiles()) 
      {                
          return array_merge($values, array('profiles' => $profiles));
      }              
      throw new mfValidatorErrorSchema($this, array(
        $this->getOption('email_field') => new mfValidatorError($this, 'invalid'),
      ));
    }
    // assume a required error has already been thrown, skip validation
    return $values;
  }
}
