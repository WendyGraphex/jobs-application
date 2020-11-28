<?php

class employers_postAJobMenuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                         
        $this->user=$this->getUser();
    } 
    
    
}
