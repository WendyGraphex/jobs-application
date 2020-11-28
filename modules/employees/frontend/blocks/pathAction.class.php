<?php

class employees_pathActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {
        $this->user=$this->getUser();
       
    } 
    
    
}

