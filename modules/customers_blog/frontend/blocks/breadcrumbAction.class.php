<?php

 

class customers_blog_breadcrumbActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
         $this->node=$this->getParameter('node');
         $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}



