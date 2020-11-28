<?php


class employees_ajaxListPartialCategoryAction extends mfAction  {

    
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();   
        $this->node_i18n=new EmployeeWorkCategoryI18n(array('url'=>new mfString($request->getPostParameter('url')),'lang'=>$request->getForcedLanguage()));                    
        if ($this->node_i18n->isNotLoaded())
            $this->node=new EmployeeWorkCategory('root');
    }
            
}

