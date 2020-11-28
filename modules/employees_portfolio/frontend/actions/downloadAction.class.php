<?php


class employees_portfolio_downloadAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
       /* if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();      */
                        
        $file=new EmployeePortfolioDocument(array('file'=>new mfFilename($request->getRequestParameter('file')),
                                                   'employee'=>$request->getRequestParameter('employee')),
                                                $this->getUser()->isAuthenticated()?$this->getUser()->getGuardUser():null);                    
      //  echo "<pre>"; var_dump($file);
        if ($file->isNotLoaded())
            $this->forward404File();               
        if (!$file->getFileManager()->isReadable())
            $this->forward404File();        
        $response=$this->getResponse();
        $response->setHttpHeader('Cache-Control: no-cache, must-revalidate');             
        $response->setHeaderFile($file->getFileManager()->getFilename());
        $response->sendHttpHeaders();        
        $handle = fopen($file->getFileManager()->getFilename(), "rb");
        while (!feof($handle))            
            echo fread($handle, 10 *1024 *1024);      
        fclose($handle);
        die();
        return mfView::NONE;
    }
    
   
}


