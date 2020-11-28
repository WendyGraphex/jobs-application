<?php


class projects_documents_ajaxDeleteDocumentAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
            if (!$this->getUser()->isEmployee() && !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $item = new ProjectDocument($request->getPostParameter('ProjectDocument'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Document is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteDocument',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


