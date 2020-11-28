<?php


class customers_newsletter_academySignInActionComponent extends mfActionComponent {

    function execute(mfWebRequest $request)
    {        
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}