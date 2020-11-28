<?php


class site_event_ajaxPublicDocumentEventAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
            if (!$this->getUser()->isEventUser())             
                $this->forwardTo401Action();
            $item = new SiteEventDocument($request->getPostParameter('SiteEventDocument'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Document is invalid.'));
            $item->opened();
            
            $response=array('action'=>'PublicDocumentEvent',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


