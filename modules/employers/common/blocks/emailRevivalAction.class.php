<?php


class employers_emailRevivalActionComponent extends mfActionComponent {
    
             
    function execute(mfWebRequest $request) {                         
         $this->_request=$request;
         $this->advert_i18n=$this->getParameter('advert_i18n')->getFormatter()->toArrayForEmail();
    }
    
   
}

