<?php

 
class social_networks_OneSocialNetworkDisplayActionComponent extends mfActionComponent {
        
    function execute(mfWebRequest $request) {  
         if (!$this->getParameter('network'))
             return mfView::NONE;
         $this->network=new SocialNetwork($this->getParameter('network'));  
         if ($this->network->isNotLoaded() || $this->network->get('is_active')!='YES')
             return mfView::NONE;
    }
    
}    