<?php

require_once __DIR__."/../locales/Forms/EmployerSigninForm.class.php";

class employers_ajaxSigninAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();                     
         try 
      {         
            if (!$request->isMethod('POST') || !$request->getPostParameter('Signup'))
            {                
                 $this->getController()->setRenderMode(mfView::RENDER_JSON);
                 $this->forwardTo401Action();
            }             
            $form=new EmployerSigninForm();
            $form->bind($request->getPostParameter('Signup'));
            if ($form->isValid())
            {              
                $employer_user=new EmployerUser();
                $employer_user->add($form->getValues());
                $employer_user->create();
                
                $engine_email=new EmployerUserEmailEngine($employer_user);
                $engine_email->sendValidation();                
                return ;
            }
            else 
            {              
               //  $response['errors']=$form->getErrorSchema()->getCodes();
                 $response = array("action"=>"Signin",
                                   'errors'=>$form->getErrorSchema()->getErrorsMessage(),
                                    );                  
            }                      
      } 
      catch (mfException $e) {         
          $messages->addError($e);
      }
      $this->getController()->setRenderMode(mfView::RENDER_JSON);
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


