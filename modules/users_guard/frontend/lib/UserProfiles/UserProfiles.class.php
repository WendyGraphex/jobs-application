<?php

class UserProfiles implements ArrayAccess ,Iterator, Countable {
    
    protected $profiles=array();
    
     public function offsetExists($name)
  {
    return isset($this->profiles[$name]);
  }

  public function offsetGet($name)
  {
     return $this->profiles[$name]; 
  }
  
   public function offsetSet($offset, $value)
  {      
                 
    if ($offset===null)
       $this->profiles[]=$value;  
    else
       $this->profiles[$offset]=$value;                       
  }

  public function offsetUnset($offset)
  {
      unset($this->profiles[$offset]);      
  }
  
  public function count()
  {
    return count($this->profiles);
  }
  
  function reset()
  {
      $this->rewind();
      return $this;
  }
  
  
  public function rewind()
  {  
    reset($this->profiles);
     return $this;
  }

  public function key()
  {       
      return key($this->profiles);
  }

  public function current()
  {   
      return current($this->profiles);
  }

  public function next()
  {  
      return next($this->profiles);
  }

  public function valid()
  {    
       $key = key($this->profiles);
       return ($key !== NULL && $key !== FALSE);
  }    
    
    function setUser($user)
    {
        $this->profiles['User']=$user;
        return $this;
    }
    
     function setCompanyUser($company_user)
    {
        $this->profiles['CompanyUser']=$company_user;
        return $this;
    }
    
    function setPartnerUser($partner_user)
    {
        $this->profiles['PartnerUser']=$partner_user;
        return $this;
    }
    
    function getFirst()
  {
      reset($this->profiles);
      return current($this->profiles);
  }
  
  function isEmpty()
  {
      return empty($this->profiles);
  }
  
  function getKeys()
  {
      return array_keys($this->profiles);
  }
  
    function isUnique()
    {
        return (boolean)(count($this->profiles)==1);
    }
    
    function hasProfiles()
    {
        return !empty($this->profiles);
    }
    
    function getProfiles()
    {
        return $this->profiles;
    }
    
    function getProfileNames()
    {
        return array_keys($this->profiles);
    }
    
    function getProfilesForSelect()
    {
        $profiles=array();
        foreach (array_keys($this->profiles) as $profile)
            $profiles[$profile]=__($profile,array(),'messages','users_guard');
        return $profiles;
    }
    
    function getProfile($name,$default=null)
    {
        return isset($this->profiles[$name])?$this->profiles[$name]:$default;
    }
}

