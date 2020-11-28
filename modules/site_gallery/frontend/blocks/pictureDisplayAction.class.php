<?php
 
class site_gallery_pictureDisplayActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {          
         
        $this->tpl=$this->getParameter('tpl','default');               
        $this->picture= new SitePicture(array('name'=>$this->getParameter('picture')));          
        if ($this->picture->isNotLoaded())
             return mfView::NONE;
    }
    
}    