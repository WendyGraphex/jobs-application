<?php


class employees_invitation_ajaxDeleteInvitationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new EmployeeInvitation(array('id'=>$validator->isValid($request->getPostParameter('EmployeeInvitation'))));
          if ($contact->isNotLoaded())
              throw new mfException(__('Invitation is invalid'));
            $contact->delete();
            $response = array("action"=>"DeleteInvitation","id" =>$contact->get('id'));
           
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
