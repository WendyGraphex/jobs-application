<?php

require_once __DIR__."/../locales/Forms/EmployerSearchFilterParameters.class.php";

class employers_letterAdvertCountryAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();    
        
        $countries = EmployerAdvertSearchCountryLetter::getCountriesByLetter($request->getRequestParameter('letter'));
        $search = new EmployerSearchFilterParameters();
        $search->in()->set('country',$countries->getKeys()->toArray());     
        $search->getSearches()->push(__('Country begins by "%s": %s',[$request->getRequestParameter('letter'), $countries->implode(', ')]));       
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts'); 
    }
}

