<?php

require_once __DIR__."/../locales/Forms/EmployerPostAJobForm.class.php";
 

class employers_ajaxSavePostAJobProfileAction extends mfAction {
    
    
    
    function execute(\mfWebRequest $request) {
        $messages = mfMessages::getInstance();                  
        try
        {
            $employer_user=$this->getUser()->getStorage()->read('post_a_job_employer_user',new EmployerUser());
            $form=new EmployerPostAJobForm($employer_user,$request->getPostParameter('EmployerPostAJob'));
            $form->bind($request->getPostParameter('EmployerPostAJob'));
            if ($form->isValid())
            {      
                
                $employer_user->add($form->getValues());                
                $employer_user->create();
                if ($this->getUser()->getStorage()->read('post_a_job_employer_user')==null)
                {    
                    $engine_email=new EmployerUserEmailEngine($employer_user);
                    //$engine_email->sendValidation();          
                                        
                    $this->getUser()->getStorage()->write('post_a_job_employer_user',$employer_user);
                }
                $this->forward($this->getModuleName(), 'ajaxPostAJobAdvert');                
            }    
            $response=array('action'=>'PostAJobProfile','errors'=>$form->getErrorSchema()->getCodes());
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        } 
        $this->getController()->setRenderMode(mfView::RENDER_JSON);          
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
