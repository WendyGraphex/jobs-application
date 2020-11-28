<?php

class employers_shareAdvertLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       $this->max_characters=500;
       $this->text=new mfString(__("Spread the word about this advert on Graphex"));
    } 
    
    
}