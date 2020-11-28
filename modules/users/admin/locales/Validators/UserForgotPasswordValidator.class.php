<?php

class UserForgotPasswordValidator extends mfValidatorBase
{
  public function configure($options = array(), $messages = array())
  {
    $this->addOption('email_field', 'email');
    $this->setMessage('invalid', __('the email is not known.'));
  }

  protected function doIsValid($values)
  {
    if (isset($values[$this->getOption('email_field')]))
    {
      $email = $values[$this->getOption('email_field')];
      if ($user=UserUtils::getUsernameOrEmail($email)) 
          return array_merge($values, array('user' => $user));
      throw new mfValidatorErrorSchema($this, array(
        $this->getOption('email_field') => new mfValidatorError($this, 'invalid'),
      ));    
    }
    // assume a required error has already been thrown, skip validation
    return $values;
  }
}
