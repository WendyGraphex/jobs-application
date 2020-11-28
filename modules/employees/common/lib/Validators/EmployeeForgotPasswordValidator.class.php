<?php

class EmployeeForgotPasswordValidator extends mfValidatorBase
{
  public function configure($options = array(), $messages = array())
  {
    $this->addOption('email', 'email');
    $this->setMessage('invalid', __('the email is not known.'));
  }

  protected function doIsValid($values)
  {
    if (isset($values[$this->getOption('email')]))
    {
      $email = $values[$this->getOption('email')];
      if ($user=EmployeeUtils::getUserByEmail($email)) 
          return array_merge($values, array('user' => $user));
      throw new mfValidatorErrorSchema($this, array(
        $this->getOption('email') => new mfValidatorError($this, 'invalid'),
      ));    
    }
    // assume a required error has already been thrown, skip validation
    return $values;
  }
}
