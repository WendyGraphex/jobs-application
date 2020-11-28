<?php

require_once __DIR__."/../locales/Forms/EmployeeSigninForm.class.php";

class employees_ajaxSigninAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();                     
         try 
      {         
            if (!$request->isMethod('POST') || !$request->getPostParameter('Signup'))
            {                
                 $this->getController()->setRenderMode(mfView::RENDER_JSON);
                 $this->forwardTo401Action();
            }             
            $form=new EmployeeSigninForm();
            $form->bind($request->getPostParameter('Signup'));
            if ($form->isValid())
            {              
                $employee=new Employee();
                $employee->add($form->getValues());
                $employee->create();
                
                $engine_email=new EmployeeEmailEngine($employee);
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


