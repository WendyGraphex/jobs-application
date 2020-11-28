<?php

require_once __DIR__."/../locales/Forms/EmployeeWantMissionForm.class.php";

class employees_ajaxSaveCoordinatesAction extends mfAction
{

    function execute(mfWebRequest $request)
    {              
        $messages = mfMessages::getInstance();         
        $form=new EmployeeWantMissionForm($this->getUser(),$request->getPostParameter('EmployeeCoordinates'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeCoordinates'))
                return ;
        try
        {
            $form->bind($request->getPostParameter('EmployeeWantMissionForm'));
            if ($form->isValid())
            {
                $employee=new Employee();
                $employee->add($form->getValues());
                $employee->create();
                $this->getUser()->write('employee',$employee);
             //   $engine_email=new CandidateEmailEngine($candidate_user);
              //  $engine_email->sendValidation(); 
                
                // $response = array("action"=>"WantJob","next"=>true);   
                return ;
            }   
            else
            {
              /*  $response = array("action"=>"WantJob",
                          //        'errors'=>$form->getErrorSchema()->getErrorsMessage(),                   
                                 );   */
                $this->getUser()->getStorage()->write('employee',new Employee(1));
                $this->getUser()->getStorage()->write('step','adverts'); 
                $response = array("action"=>"WantMission","next"=>true);  
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}



