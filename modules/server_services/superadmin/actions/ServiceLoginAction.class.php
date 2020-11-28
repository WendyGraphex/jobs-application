<?php

require_once dirname(__FILE__).'/../locales/Forms/LoginServicesForm.class.php';

class site_services_ServiceLoginAction extends mfAction{
   
    public function execute(\mfWebRequest $request) {       
        $messages = mfMessages::getInstance();        
        $form = new LoginServicesForm();       
        try 
        {                                  
            if ($request->isMethod('POST')) 
            {
               // var_dump($request->getPostParameters());               
                $form->bind($request->getPostParameters());
                if ($form->isValid()) 
                {                   
                    $values = $form->getValues();
                    $this->getUser()->signin($values['user']);                      
                    $response=array('status'=>'OK','token'=>$form->getToken());                     
                } 
                else
                {
                   // var_dump($form->getErrorSchema()->getErrorsMessage());
                   $response=array('status'=>'error','errors'=>'invalid');
                }     
            }
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("errors"=>$messages->getDecodedErrors()):$response; 
    }

}
