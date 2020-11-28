<?php


class employers_ajaxDeleteAvatarAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
              if (!$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $this->getUser()->getGuardUser()->getAvatar()->remove(); 
            
            $response=array('action'=>'DeleteAvatar');                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


