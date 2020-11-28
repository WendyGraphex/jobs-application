<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchFilterParameters.class.php";

class employees_letterCityAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();    
        
        $cities = EmployeeSearchCityLetter::getCitiesByLetter($request->getRequestParameter('letter'));        
        $search = new EmployeeSearchFilterParameters();
        $search->begin()->set('city',$request->getRequestParameter('letter'));     
        $search->getSearches()->push(__('Cities begins by "%s": %s',[$request->getRequestParameter('letter'), $cities->implode(', ')]));       
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'employees'); 
    }
}

