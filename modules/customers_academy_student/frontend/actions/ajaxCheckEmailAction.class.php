<?php


require_once __DIR__."/../locales/Forms/CustomerAcademyStudentUserCheckEmailForm.class.php";

class customers_academy_student_ajaxCheckEmailAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {           
            //$post=array('email'=>'test@ewebsolutions.fr','token'=>mfForm::getToken('SupplierCheckEmailForm'));
            $form = new CustomerAcademyStudentUserCheckEmailForm($request->getPostParameter('EmailChecker'));
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


