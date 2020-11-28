<?php


class customers_blog_pathActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {
        $this->user=$this->getUser();
        $this->class=$this->getParameter('class');
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}

