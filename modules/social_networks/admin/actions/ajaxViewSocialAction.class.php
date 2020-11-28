<?php


class social_networks_ajaxViewSocialAction extends mfAction {
    
        
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();
        $this->form = new SocialNetworkViewForm();
        $this->item=new SocialNetwork($request->getPostParameter('SocialNetwork'));                             
   }

}

