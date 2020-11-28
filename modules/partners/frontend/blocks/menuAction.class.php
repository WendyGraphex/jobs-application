<?php

class partners_menuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
        $this->node=new PartnerWorkCategoryMenu($this->getParameter('node','root'));                 
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}