<?php
 
class site_gallery_pictureActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {          
         
        $this->picture=new SitePicture(array('name'=>$this->getParameter('picture')));
        $this->tpl=$this->getParameter('tpl');
    }
    
}    