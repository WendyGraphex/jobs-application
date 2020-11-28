<?php


class employers_ajaxDeletePictureAction extends mfAction {
    
    
  function execute(mfWebRequest $request) {     
    $messages = mfMessages::getInstance(); 
    $current_user=$this->getUser()->getGuardUser(); // get current user 
    try 
    {          
        $employers=new mfValidatorInteger();
        $employer_id=$employer->isValid($request->getPostParameter('Employer'));
        $employer= new Employer($employer_id);
        if ($employer->get('picture') && $employer->isLoaded())
        {   
          $employer->deletePicture();
          $response = array("action"=>"DeletePicture","id" =>$employer->get('id'));
        }  
    } 
    catch (mfException $e) {
        $messages->addError($e);
    }
    return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
  }


}