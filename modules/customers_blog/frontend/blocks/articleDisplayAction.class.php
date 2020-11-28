<?php


class customers_blog_articleDisplayActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {             
        $this->tpl=$this->getParameter('tpl','default');
        
    }         
}

