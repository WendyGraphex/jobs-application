<?php

class guardValidatorUser extends mfValidatorBase
{
  public function configure($options = array(), $messages = array())
  {
    $this->addOption('username_field', 'username');
    $this->addOption('password_field', 'password');
    $this->setMessage('invalid', __('The username and/or password is invalid.'));
  }

  protected function doIsValid($values)
  {
    if (isset($values[$this->getOption('username_field')]) && isset($values[$this->getOption('password_field')]))
    {
      $username = $values[$this->getOption('username_field')];
      $password = md5($values[$this->getOption('password_field')]);
      if ($user=UserGuardUtils::findByUserNameOrEmailAndPassword($username, $password)) 
      {
          return array_merge($values, array('user' => $user));
      }    
      throw new mfValidatorErrorSchema($this, array(
        $this->getOption('username_field') => new mfValidatorError($this, 'invalid'),
      ));
    }
    // assume a required error has already been thrown, skip validation
    return $values;
  }
}
