<?php


class employers_ajaxDeleteEmployerAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
        try 
        {         
              $item=new mfValidatorInteger();
              $id=$item->isValid($request->getPostParameter('Employer'));          
              $item= new EmployerUser($id);           
              $item->delete();              
              $response = array("action"=>"DeleteEmployer","id" =>$id,"info"=>__("Employer has been deleted."));
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
