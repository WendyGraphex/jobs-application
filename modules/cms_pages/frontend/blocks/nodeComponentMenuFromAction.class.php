<?php

class cms_pages_nodeComponentMenuFromActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {             
        $this->node=new CmsMenu($this->getParameter('node'));                    
        $this->menu_id=$this->getParameter('id');           
        $this->children=$this->node->getChildrenI18nFromNode($this->getUser()->getLanguage());       
        $this->separator=$this->getParameter('separator');  
        $this->component=$this->getParameter('component');
        $this->options=$this->getParameter('options');       
    } 
    
    
}