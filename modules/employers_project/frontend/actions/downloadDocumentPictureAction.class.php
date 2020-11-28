<?php

// http://www.project55.net/employer/projects/document/pictures/6/small/Graphex%20welcome%20Message5.png
class employers_project_downloadDocumentPictureAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {       
         
        $messages = mfMessages::getInstance();      
         if (!$this->getUser()->isEmployerUser() && !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();               
        $document= new EmployerProjectDocument($request->getRequestParameters(array('file','id')),$this->getUser()->getGuardUser());           
        if ($document->isNotLoaded())
            $this->forward404File();              
        if (!$document->getFile()->getImages()->getPictureByType($request->getRequestParameter('type'))->isExist())
            $this->forward404File();          
        $response=$this->getResponse();
        $response->setHttpHeader('Cache-Control: no-cache, must-revalidate');             
        $response->setHeaderFile($document->getFile()->getImages()->getPictureByType($request->getRequestParameter('type'))->getFilename());
        $response->sendHttpHeaders();        
        $handle = fopen($document->getFile()->getImages()->getPictureByType($request->getRequestParameter('type'))->getFilename(), "rb");
        while (!feof($handle))            
            echo fread($handle, 10 *1024 *1024);      
        fclose($handle);
        die();
        return mfView::NONE;       
    }
    
   
}


