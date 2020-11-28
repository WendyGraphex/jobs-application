<?php


class employees_downloadDocumentPictureAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();            
        $this->user=$this->getUser();                
        $document= new EmployeeAdvertDocument($request->getRequestParameters(array('file','id')),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);
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


