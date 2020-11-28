<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertI18nMultipleNewForm.class.php";

class employers_ajaxSavePostAJobAdvertProfileAction extends mfAction {
    
    
    
    function execute(\mfWebRequest $request) {
        $messages = mfMessages::getInstance();         
        $employer_user=$this->getUser()->getStorage()->read('post_a_job_employer_user');        
        if (!$employer_user && !$this->getUser()->isEmployerUser())
            $this->forwardTo401Action();
        if (!$employer_user)
           $employer_user = $this->getUser()->isEmployerUser();         
        try
        {                       
            $form = new EmployerAdvertI18nMultipleNewForm($employer_user,$request->getPostParameter('EmployerAdvertMultiple'));      
            $form->bind($request->getPostParameter('EmployerAdvertMultiple'));
            if ($form->isValid())
            {      
                $form->getAdvert()->create();           
                $engine = new EmployerAdvertEmailEngine($form->getAdvert());
                $engine->sendCreated();

                $this->getEventDispather()->notify(new mfEvent($form->getAdvert(), 'employer.advert.create'));  
                $this->getUser()->getStorage()->remove('post_a_job_employer_user');    
            }       
            else
            {                    
                $this->getController()->setRenderMode(mfView::RENDER_JSON);
                $response=array('action'=>'SavePostAJobAdvertProfile');
                $response['errors']=$form->getErrorSchema()->getCodes();               
                return $response;
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }       
         
    }
}
