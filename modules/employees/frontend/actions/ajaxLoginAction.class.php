<?php


class employees_ajaxLoginAction extends mfAction {
                 
    function execute(mfWebRequest $request) {                            
        try 
        {
            $messages = mfMessages::getInstance();                     
            $response=array('action'=>'Login');
            $form = new EmployeeUserGuardForm($request->getPostParameter('EmployeeLogin'));    
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeLogin')) 
                return $response;            
            $form->bind($request->getPostParameter('EmployeeLogin'));
            if ($form->isValid()) {              
                $this->getUser()->signin($form->getEmployeeUser(),$request->getIP(),$form->getRemember());                
                $this->getEventDispather()->notify(new mfEvent($form->getEmployeeUser(), 'employee.connected')); 
                $response['user']=$form->getEmployeeUser()->getFormatter()->toArrayForLogin();
            } 
            else 
            { 
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $response=array('errors'=>$form->getErrorSchema()->getCodes());
                $this->getEventDispather()->notify(new mfEvent($this, 'employee.failed.login', array_merge($request->getPostParameter('EmployeeLogin'),array('ip'=>$request->getIp()))));
            }               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


