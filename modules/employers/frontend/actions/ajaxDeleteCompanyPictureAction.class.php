<?php


class employers_ajaxDeleteCompanyPictureAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
             if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
             if (!$this->getUser()->getGuardUser()->isAdmin())
                 $this->forwardTo401Action();     
            $this->getUser()->getGuardUser()->getCompany()->getPicture()->remove(); 
            
            $response=array('action'=>'DeleteCompanyPicture');                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


