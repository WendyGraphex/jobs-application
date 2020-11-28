<?php

// www.project41.net/module/Employee/admin/CheckEmail

require_once __DIR__."/../locales/Forms/EmployeeCheckEmailForm.class.php";

class employees_ajaxCheckEmailAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {           
            //$post=array('email'=>'test@ewebsolutions.fr','token'=>mfForm::getToken('SupplierCheckEmailForm'));
            $form = new EmployeeCheckEmailForm($request->getPostParameter('EmailChecker'));
            $form->bind($request->getPostParameter('EmailChecker'));
            if ($form->isValid())
            {               
                $response=array("status"=>"OK",'action'=>'CheckEmail');
            }  
            else
            {
              //  var_dump($form->getErrorSchema()->getErrorsMessage());
                $response=array('action'=>'CheckEmail','errors'=>(string)$form['email']->getError());
            }               
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


