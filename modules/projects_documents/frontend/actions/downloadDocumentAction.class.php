<?php


class projects_documents_downloadDocumentAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();                             
        $document= new ProjectDocument($request->getRequestParameters(array('file','id')),$this->getUser()->isAuthenticated() && ($this->getUser()->isEmployee() || $this->getUser()->isEmployerUser())?$this->getUser()->getGuardUser():null);               
        if ($document->isNotLoaded())
            $this->forward404File(); 
        if (!$document->getFile()->isReadable())
            $this->forward404File();  
        $response=$this->getResponse();
        $response->setHttpHeader('Cache-Control: no-cache, must-revalidate');             
        $response->setHeaderFile($document->getFile()->getFilename());
        $response->sendHttpHeaders();    
        readfile($document->getFile()->getFilename());        
        $handle = fopen($document->getFile()->getFilename(), "rb");
        while (!feof($handle))            
            echo fread($handle, 10 *1024 *1024);      
        fclose($handle);
        die();
        return mfView::NONE;       
    }
    
   
}


