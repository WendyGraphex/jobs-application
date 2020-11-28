<?php


class employees_portfolio_downloadPicturesAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
       /* if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();      */
                        
        $file=new EmployeePortfolioDocument(array('file'=>new mfFilename($request->getRequestParameter('file')),
                                                  'employee'=>$request->getRequestParameter('employee')),$this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);                            
        if ($file->isNotLoaded())
            $this->forward404File();               
        if (!$file->getFileManager()->getImages()->getPictureByType($request->getRequestParameter('type'))->isExist() || !$file->getFileManager()->isPicture())
            $this->forward404File();            
        $response=$this->getResponse();
        $response->setHttpHeader('Cache-Control: no-cache, must-revalidate');             
        $response->setHeaderFile($file->getFileManager()->getImages()->getPictureByType($request->getRequestParameter('type'))->getFile());
        $response->sendHttpHeaders();       
        $handle = fopen($file->getFileManager()->getImages()->getPictureByType($request->getRequestParameter('type'))->getFile(), "rb");
        while (!feof($handle))            
            echo fread($handle, 10 *1024 *1024);      
        fclose($handle);
        die();
        return mfView::NONE;
    }
    
   
}


