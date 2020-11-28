<?php

class cms_pages_menuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
        $this->node=new CmsMenu($this->getParameter('node','root'));         
        $this->tpl=$this->getParameter('tpl','default');
        //var_dump($this->node->getChildren());
    } 
    
    
}