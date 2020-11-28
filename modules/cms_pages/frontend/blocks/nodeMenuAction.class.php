<?php

class cms_pages_nodeMenuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {      
        // display node and its children
        $this->node=new CmsMenu($this->getParameter('node','root'));       
        $this->children=$this->node->getChildrenI18n($this->getUser()->getLanguage());   
        $this->tpl=$this->getParameter('tpl','default.tpl');   
    } 
    
    
}