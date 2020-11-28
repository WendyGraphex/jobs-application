<?php


class customers_blog_activitiesLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {             
       $this->tpl=$this->getParameter('tpl','default');
       
    }         
}

