<?php


class employers_resourcesActionComponent extends mfActionComponent {
     
   
    
    function execute(mfWebRequest $request) 
    {                                   
          if (!$this->getUser()->isEmployerUser()) 
              return mfView::NONE;
          $this->user=$this->getUser();          
          $this->_request=$request;
          $this->settings=new UtilsNodeJsSettings();
    }    
                    
}    