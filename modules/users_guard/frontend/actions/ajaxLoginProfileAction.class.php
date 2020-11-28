<?php

require_once __DIR__."/../locales/Forms/LoginProfileForm.class.php";

class users_guard_ajaxLoginProfileAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                
        $messages = mfMessages::getInstance();                    
        $form = new LoginProfileForm($this->getUser());      
        try 
        {                                    
                $form->bind($request->getPostParameter('LoginProfile'));
                if ($form->isValid()) 
                {                  
                   $this->getUser()->signin($form->getUser(),$request->getIP());                       
                   $response=array('action'=>'LoginProfile','login'=>'OK');                    
                }  
                // else   {   echo "<pre>"; var_dump($form->getErrorSchema()->getErrorsMessage()); echo "</pre>"; }    
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


