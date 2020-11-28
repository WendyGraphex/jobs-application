<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchFilterParameters.class.php";

class employees_letterAdvertTitleAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();    
                 
        $search = new EmployeeSearchFilterParameters();
        $search->begin()->set('title',$request->getRequestParameter('letter'));     
        $search->getSearches()->push(__('Adverts begins by "%s"',$request->getRequestParameter('letter')));       
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts'); 
    }
}

