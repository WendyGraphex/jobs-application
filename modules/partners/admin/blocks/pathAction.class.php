<?php


class partners_pathActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {
        $this->user=$this->getUser();
        $this->class=$this->getParameter('class');
    } 
    
    
}

