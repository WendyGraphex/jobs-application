<?php

class partners_categoriesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                     
        $this->forward($this->getModuleName(),$request->getRequestParameter('type')=='employer'?'':'');
    }         
}

