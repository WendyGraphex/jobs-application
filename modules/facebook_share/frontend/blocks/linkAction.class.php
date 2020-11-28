<?php

class facebook_share_linkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();    
       $this->text=$this->getParameter('text');
       $this->url=new mfString((string)$this->getParameter('url'));
       $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}