<?php

 
class social_networks_SocialNetworksDisplayActionComponent extends mfActionComponent {

    
    
    function execute(mfWebRequest $request) {        
         $this->networks=SocialNetworkUtils::getCollectionByPosition();                 
         $this->tpl=$this->getParameter('tpl','default');
    }
    
}    