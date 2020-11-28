<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchFilterParameters.class.php";

class employees_letterAdvertCountryAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();    
        
        $countries = EmployeeAdvertSearchCountryLetter::getCountriesByLetter($request->getRequestParameter('letter'));
        $search = new EmployeeSearchFilterParameters();
        $search->in()->set('country',$countries->getKeys()->toArray());     
        $search->getSearches()->push(__('Country begins by "%s": %s',[$request->getRequestParameter('letter'), $countries->implode(', ')]));       
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts'); 
    }
}

