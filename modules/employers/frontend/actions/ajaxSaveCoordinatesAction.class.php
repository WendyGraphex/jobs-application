<?php

require_once __DIR__."/../locales/Forms/EmployerPostMissionForm.class.php";

class employers_ajaxSaveCoordinatesAction extends mfAction
{

    function execute(mfWebRequest $request)
    {              
        $messages = mfMessages::getInstance();         
        $form=new EmployerPostMissionForm($this->getUser(),$request->getPostParameter('EmployerCoordinates'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerCoordinates'))
                return ;
        try
        {
            $form->bind($request->getPostParameter('EmployerCoordinates'));
            if ($form->isValid())
            {
                $employer=new EmployerUser();
                $employer->add($form->getValues());
                $employer->create();
                $this->getUser()->write('employer',$employer);
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
                $this->getUser()->getStorage()->write('employer',new EmployerUser(1));
                $this->getUser()->getStorage()->write('step','adverts'); 
                $response = array("action"=>"WantJob","next"=>true);  
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}



