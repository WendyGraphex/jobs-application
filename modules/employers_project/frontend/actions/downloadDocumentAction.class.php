<?php

// http://www.project55.net/employer/projects/document/8/Graphex%20welcome%20Message5.png
class employers_project_downloadDocumentAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();      
        if (!$this->getUser()->isEmployerUser() && !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();               
        $document= new EmployerProjectDocument($request->getRequestParameters(array('file','id')),$this->getUser()->getGuardUser());       
        if ($document->isNotLoaded())
            $this->forward404File();  
        if (!$document->getFile()->isReadable())
            $this->forward404File();  
        $response=$this->getResponse();
        $response->setHttpHeader('Cache-Control: no-cache, must-revalidate');             
        $response->setHeaderFile($document->getFile()->getFilename());
        $response->sendHttpHeaders();        
        $handle = fopen($document->getFile()->getFilename(), "rb");
        while (!feof($handle))            
            echo fread($handle, 10 *1024 *1024);      
        fclose($handle);
        die();
        return mfView::NONE;       
    }
    
   
}


