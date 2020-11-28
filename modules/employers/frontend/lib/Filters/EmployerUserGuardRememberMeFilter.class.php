<?php


class EmployerUserGuardRememberMeFilter extends mfFilter
{
    
  
  public function execute($filterChain)
  {               
    if (
      $this->isFirstCall()
      &&
      $this->context->getUser()->isAnonymous()
      &&
       $cookie = $this->context->getRequest()->getCookie(EmployerUserRemember::getCookieName())      
    )
    {               
        if ($remember=EmployerUserRemember::getUserRemember($cookie))
        {                    
           $this->context->getUser()->signIn($remember->getUser());
        }          
    }    
    $filterChain->execute();
  }
}
