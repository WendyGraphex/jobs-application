<?php


class cms_pages_pathActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {
        $this->user=$this->getUser();      
    } 
    
    
}

