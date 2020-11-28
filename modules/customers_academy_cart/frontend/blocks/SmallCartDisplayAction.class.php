<?php

class customers_academy_cart_SmallCartDisplayActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request)
    {                         
        $this->tpl=$this->getParameter('tpl','default');
        $this->cart=$this->getUser()->getStorage()->read('academy_cart');                       
    } 
    
    
}
