<?php

class site_event_cart_AddToCartBtnActionsActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request)
    {                         
        $this->tpl=$this->getParameter('tpl','default');
                              
    } 
    
    
}
