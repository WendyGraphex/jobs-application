<?php

class site_cookie_panelActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {           
        if ($this->getUser()->getStorage()->read('cookie_ok',false))
            return mfView::NONE;      
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
