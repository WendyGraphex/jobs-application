<?php


class customers_academy_teacher_ajaxDeleteCustomerAcademyTeacherUserAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $employee= new CustomerAcademyTeacherUser(array('id'=>$validator->isValid($request->getPostParameter('CustomerAcademyTeacherUser'))));
          if ($employee->isLoaded())
          {    
            $employee->set('status','DELETE');
            $employee->delete();
            $response = array("action"=>"DeleteCustomerAcademyTeacherUser","id" =>$employee->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
