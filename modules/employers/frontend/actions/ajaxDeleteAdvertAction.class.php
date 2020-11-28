<?php


class employers_ajaxDeleteAdvertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
              if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $item = new EmployerAdvert($request->getPostParameter('EmployerAdvert'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteAdvert',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


