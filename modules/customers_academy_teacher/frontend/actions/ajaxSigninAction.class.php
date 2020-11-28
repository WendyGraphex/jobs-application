<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyTeacherUserSigninForm.class.php";

class customers_academy_teacher_ajaxSigninAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();                     
         try 
      {         
            if (!$request->isMethod('POST') || !$request->getPostParameter('Signup'))
            {                
                 $this->getController()->setRenderMode(mfView::RENDER_JSON);
                 $this->forwardTo401Action();
            }             
            $form=new CustomerAcademyTeacherUserSigninForm();
            $form->bind($request->getPostParameter('Signup'));
            if ($form->isValid())
            {                              
                $user=new CustomerAcademyTeacherUser();
                $user->add($form->getValues());
                $user->save();
                
                $engine_email=new CustomerAcademyTeacherUserEmailEngine($user);
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


