<?php

// www.project41.net/module/Employee/admin/CheckUsername

require_once __DIR__."/../locales/Forms/EmployerCheckUsernameForm.class.php";

class employers_ajaxCheckUsernameAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
           //  if (!$this->getUser()->isEmployerUser()) 
           //      $this->forwardTo401Action();
            //$post=array('email'=>'test@ewebsolutions.fr','token'=>mfForm::getToken('SupplierCheckEmailForm'));
            $form = new EmployerCheckUsernameForm($this->getUser(),$request->getPostParameter('EmployerUsernameCheck'));
            $form->bind($request->getPostParameter('EmployerUsernameCheck'));
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


