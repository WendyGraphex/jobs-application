<?php

/*
 * /^([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/
 * (?P<name>\w+): (?P<digit>\d+)/
 * /^(?P<hour>[0-1][0-9]|2[0-3]):(?P<minute>[0-5][0-9]):(?P<second>[0-5][0-9])$/
 */

class mfValidatorDurationTime extends mfValidatorTime
{

  protected function configure($options = array(), $messages = array())
  {
    $this->addMessage('bad_format', '"{value}" does not match the time format ({time_format}).');
    $this->addOption('time_format', null);   
    $this->addOption('time_format_error');
  }
 
 protected function doIsValid($value)
  {
    if (is_array($value))
    {
      $clean = $this->convertTimeArrayToTimestamp($value);
    }
    else if ($regex = $this->getOption('time_format'))
    {
      if (!preg_match($regex, $value, $match))     
        throw new mfValidatorError($this, 'bad_format', array('value' => $value, 'time_format' => $this->getOption('time_format_error') ? $this->getOption('time_format_error') : $this->getOption('time_format')));      
      $clean = $this->convertTimeArrayToTimestamp($match);
    }   
    return $clean;
  }
  
  protected function convertTimeArrayToTimestamp($value)
  {
    // all elements must be empty or a number
    foreach (array('hour', 'minute', 'second') as $key)
    {
      if (isset($value[$key]) && !preg_match('#^\d+$#', $value[$key]) && !empty($value[$key]))
      {
        throw new mfValidatorError($this, 'invalid', array('value' => $value));
      }
    }
    // if second is set, minute and hour must be set
    // if minute is set, hour must be set
    if (
      $this->isValueSet($value, 'second') && (!$this->isValueSet($value, 'minute') || !$this->isValueSet($value, 'hour'))
      ||
      $this->isValueSet($value, 'minute') && !$this->isValueSet($value, 'hour')
    )
    {
      throw new mfValidatorError($this, 'invalid', array('value' => $value));
    }
    $clean =  mktime(
      isset($value['hour']) ? intval($value['hour']) : 0,
      isset($value['minute']) ? intval($value['minute']) : 0,
      isset($value['second']) ? intval($value['second']) : 0
    ) - mktime(0,0,0);
    $clean=isset($value['sign']) && $value['sign']=='-'?-$clean:$clean;    
    if (false === $clean)
    {
      throw new mfValidatorError($this, 'invalid', array('value' => var_export($value, true)));
    }    
    return $clean;
  }
  
}
