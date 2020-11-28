<?php

require_once __DIR__."/../locales/Forms/EmployerSearchFilterParameters.class.php";

class employers_letterCityAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();    
        
        $cities = EmployerSearchCityLetter::getCitiesByLetter($request->getRequestParameter('letter'));        
        $search = new EmployerSearchFilterParameters();
        $search->begin()->set('city',$request->getRequestParameter('letter'));     
        $search->getSearches()->push(__('Cities begins by "%s": %s',[$request->getRequestParameter('letter'), $cities->implode(', ')]));       
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'employers'); 
    }
}

