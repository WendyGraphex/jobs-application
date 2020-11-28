<?php

abstract class UserGuardSecurityBase extends UserGuardSecurityCore {
     
  
  //abstract function isCustomerUser();
  //abstract function isCustomerCompanyUser();
  //abstract function isPartnerCompanyUser();
  
  public function initialize(mfStorage $storage, $options = array())
  {
       parent::initialize($storage, $options);      
  }
   
  public function signOut()
  {     
    $this->getAttributes()->removeNamespace('UserGuardSecurity');  
    if (method_exists($this->getGuardUser(), 'getCookieName'))
        mfContext::getInstance()->getResponse()->setCookie($this->getGuardUser()->getCookieName(), '', time() - $this->user->getExpirationAge());
    $this->user = null;
    $this->clearCredentials();
    $this->setAuthenticated(false);     
  }
 
 
   
  function logout()
  {
      $this->getGuardUser(); // load user if not
      $this->signout();
      $this->shutdown();
      return $this;
  }
  
}

