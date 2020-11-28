<?php


class employers_ajaxDeleteMyAvatarAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
              if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $this->getUser()->getGuardUser()->getAvatar()->remove(); 
            
            $response=array('action'=>'DeleteMyAvatar');                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


