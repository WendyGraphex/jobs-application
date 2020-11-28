<?php

class cms_pages_listActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
       // echo "coucou";
       // return mfView::NONE;
       // $this->titi="titi";
       // var_dump($this->getParameter('page'));
        $this->page=$this->getParameter('page');
    } 
    
    
}