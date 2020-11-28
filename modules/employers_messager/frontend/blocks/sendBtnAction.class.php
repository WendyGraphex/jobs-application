<?php

class employers_messager_sendBtnActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       $this->max_characters=500;
    } 
    
    
}