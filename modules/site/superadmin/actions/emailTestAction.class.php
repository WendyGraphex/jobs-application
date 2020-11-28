<?php


class site_emailTestAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {
        $this->host=$request->getSite()->getSite()->getHost();
        $this->parametersToVariables(); 
    }
}

