<?php


class customers_academy_newsletter_signinActionComponent extends mfActionComponent {

    function execute(mfWebRequest $request)
    {        
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}