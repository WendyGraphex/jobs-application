<?php

class cart_SmallCartDisplayActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request)
    {                         
        $this->tpl=$this->getParameter('tpl','default');
        $this->cart=$this->getUser()->getStorage()->read('cart');                       
    } 
    
    
}
