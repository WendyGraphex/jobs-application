<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyNewsletterSigninForm.class.php";

class customers_academy_newsletter_ajaxSigninAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {                    
         if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerAcademyNewsletter'))
           return ;
         $messages = mfMessages::getInstance();   
         $form = new CustomerAcademyNewsletterSigninForm();            
         $form->bind($request->getPostParameter('CustomerAcademyNewsletter'));
         if (!$form->isValid()) 
         {
            // var_dump($form->getErrorSchema()->getErrorsMessage());
             return array('action'=>'Signin','errors'=>true);  
         }
         try
         {
            $newsletter=new CustomerAcademyNewsletter($form->getEmail());
            $newsletter->create($request->getIP());          
            
            $engine= new CustomerAcademyNewsletterEmailEngine($newsletter);
            $engine->sendRequestToContactAndRecipients();
         }
         catch (mfException $e)
         {
             $messages->addError($e);
         }           
        return $messages->hasMessages('errors')?array("error"=>$messages->getDecodedErrors()):array('action'=>'Signin');
    }

}
