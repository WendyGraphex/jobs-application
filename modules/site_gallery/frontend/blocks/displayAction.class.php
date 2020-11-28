<?php
 
class site_gallery_displayActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {          
         
        $this->tpl=$this->getParameter('tpl','default');               
        $this->gallery= new SiteGallery($this->getParameter('gallery'),$this->getUser()->getLanguage());              
        if ($this->gallery->isNotLoaded())
             return mfView::NONE;
    }
    
}    