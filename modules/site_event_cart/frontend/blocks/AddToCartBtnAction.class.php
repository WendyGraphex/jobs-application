<?php

class site_event_cart_AddToCartBtnActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request)
    {                         
        $this->tpl=$this->getParameter('tpl','default');
                              
    } 
    
    
}
