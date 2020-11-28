<?php

// www.project41.net/module/Employee/admin/CheckUsername

require_once __DIR__."/../locales/Forms/EmployeeCheckUsernameForm.class.php";

class employees_ajaxCheckUsernameAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {                
            $form = new EmployeeCheckUsernameForm($this->getUser(),$request->getPostParameter('EmployeeUsernameCheck'));
            $form->bind($request->getPostParameter('EmployeeUsernameCheck'));
            if ($form->isValid())
            {               
                $response=array("status"=>"OK",'action'=>'CheckUsername');
            }  
            else
            {
              //  var_dump($form->getErrorSchema()->getErrorsMessage());
                $response=array('action'=>'CheckUsername','errors'=>(string)$form['username']->getError());
            }               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


