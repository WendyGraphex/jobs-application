<?php


class employers_ajaxPrivateAdvertDocumentAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
              if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $item = new EmployerAdvertDocument($request->getPostParameter('EmployerAdvertDocument'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item->privated();
            
            $response=array('action'=>'PrivateAdvertDocument',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


