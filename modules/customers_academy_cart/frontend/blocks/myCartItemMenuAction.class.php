<?php

class customers_academy_cart_myCartItemMenuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       if (!$this->getUser()->isStudentUser())        
            return mfView::NONE;       
    } 
    
    
}
