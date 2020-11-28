<?php


class employers_ajaxLoginAction extends mfAction {
                 
    function execute(mfWebRequest $request) {                            
        try 
        {
            $messages = mfMessages::getInstance();                     
            $response=array('action'=>'Login');
            $form = new EmployerUserGuardForm($request->getPostParameter('EmployerLogin'));    
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerLogin')) 
                return $response;            
            $form->bind($request->getPostParameter('EmployerLogin'));
            if ($form->isValid()) {              
                 $this->getUser()->signin($form->getEmployerUser(),$request->getIP(),$form->getRemember());                
                $this->getEventDispather()->notify(new mfEvent($form->getEmployerUser(), 'employer.connected')); 
                $response['user']=$form->getEmployerUser()->getFormatter()->toArrayForLogin();
            } 
            else 
            { 
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $response=array('errors'=>$form->getErrorSchema()->getCodes());
                $this->getEventDispather()->notify(new mfEvent($this, 'employer.failed.login', array_merge($request->getPostParameter('EmployerLogin'),array('ip'=>$request->getIp()))));
            }               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


