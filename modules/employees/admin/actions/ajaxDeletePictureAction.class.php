<?php


class employees_ajaxDeletePictureAction extends mfAction {
    
    
  function execute(mfWebRequest $request) {     
    $messages = mfMessages::getInstance(); 
    $current_user=$this->getUser()->getGuardUser(); // get current user 
    try 
    {          
        $employees=new mfValidatorInteger();
        $employee_id=$employee->isValid($request->getPostParameter('Employee'));
        $employee= new Employee($employee_id);
        if ($employee->get('picture') && $employee->isLoaded())
        {   
          $employee->deletePicture();
          $response = array("action"=>"DeletePicture","id" =>$employee->get('id'));
        }  
    } 
    catch (mfException $e) {
        $messages->addError($e);
    }
    return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
  }


}