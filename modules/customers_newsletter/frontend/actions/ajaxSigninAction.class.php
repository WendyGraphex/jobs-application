<?php

require_once __DIR__."/../locales/Forms/CustomerNewsletterSigninForm.class.php";

class customers_newsletter_ajaxSigninAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {            
         if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerNewsletter'))
           return ;        
         $messages = mfMessages::getInstance();   
         $form = new CustomerNewsletterSigninForm();            
         $form->bind($request->getPostParameter('CustomerNewsletter'));
         if (!$form->isValid()) 
             return array('action'=>'Signin','errors'=>true);       
         try
         {
            $newsletter=new CustomerNewsletter($form->getEmail());
            $newsletter->create($request->getIP());       
            
             $engine= new CustomerNewsletterEmailEngine($newsletter);
            $engine->sendRequestToContactAndRecipients();
         }
         catch (mfException $e)
         {
             $messages->addError($e);
         }                
        return $messages->hasMessages('errors')?array("error"=>$messages->getDecodedErrors()):array('action'=>'Signin');
    }

}
