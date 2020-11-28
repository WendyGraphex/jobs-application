<?php


class customers_academy_student_ajaxDeleteCustomerAcademyStudentUserAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $employee= new CustomerAcademyStudentUser(array('id'=>$validator->isValid($request->getPostParameter('CustomerAcademyStudentUser'))));
          if ($employee->isLoaded())
          {    
            $employee->set('status','DELETE');
            $employee->delete();
            $response = array("action"=>"DeleteCustomerAcademyStudentUser","id" =>$employee->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
