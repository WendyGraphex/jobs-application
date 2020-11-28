<?php

class unsubscribeForm extends mfForm {
    
    function configure()
    {
        $this->setValidators(array(
            'email'=>new mfValidatorEmail()
        ));
    }
}

class customers_newsletter_unsubscribeAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {  
        
        if ($request->getMethod()=='POST')
        {    
           $this->form=new unsubscribeForm();
           $this->form->bind($request->getPostParameter('unsubscribe'));
           $this->newsletter=new Newsletter($request->getPostParameter('unsubscribe'));
           if ($this->form->isValid())
           {
               if ($this->newsletter->isLoaded())
                   $this->newsletter->disabled();
               $request->addRequestParameter('newsletter', $this->newsletter);
               $this->forward('customers_newsletter','unsubscribeSuccess');
           }    
           else
           {
              $this->newsletter->add($request->getPostParameter('unsubscribe')); // Repopulate
           }                   
        }
        elseif ($request->getMethod()=='GET')
        {
            if ($request->getGetParameter('email'))
                $this->newsletter=new Newsletter($request->getGetParameter('email'));
            else
                $this->newsletter=new Newsletter();
        }    
    }

}
