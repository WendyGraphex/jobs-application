<?php


class employees_ajaxDeleteSearchAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $contact= new EmployeeSearch($validator->isValid($request->getPostParameter('EmployeeSearch')));
          if ($contact->isNotLoaded())
                 throw new mfException(__('Search is invalid.'));
            $contact->delete();
            //$response = array("action"=>"DeleteSearch","id" =>$contact->get('id'));
            $response = array("action"=>"DeleteSearch","id" =>$id,"info"=>__("Search has been deleted."));
         
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
