<?php


class EmployeeGuardRememberMeFilter extends mfFilter
{
    
  
  public function execute($filterChain)
  {           
    if (
      $this->isFirstCall()
      &&
      $this->context->getUser()->isAnonymous()
      &&
       $cookie = $this->context->getRequest()->getCookie(EmployeeRemember::getCookieName())      
    )
    {                  
        if ($remember=EmployeeRemember::getUserRemember($cookie))
        {            
           $this->context->getUser()->signIn($remember->getUser());
        }     
    }    
    $filterChain->execute();
  }
}
