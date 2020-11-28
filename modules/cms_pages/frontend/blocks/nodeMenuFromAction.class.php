<?php

class cms_pages_nodeMenuFromActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {             
        $this->node=new CmsMenu($this->getParameter('node','root'));            
        $this->menu_id=$this->getParameter('id');           
        $this->children=$this->node->getChildrenI18nFromNode($this->getUser()->getLanguage());        
        $this->separator=$this->getParameter('separator');   
        $this->tpl=$this->getParameter('tpl','default.tpl');                 
    } 
    
    
}