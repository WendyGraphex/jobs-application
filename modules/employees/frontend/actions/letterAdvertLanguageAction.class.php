<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchFilterParameters.class.php";

class employees_letterAdvertLanguageAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();    
        
        $languages = EmployeeAdvertSearchLanguageLetter::getLanguagesByLetter($request->getRequestParameter('letter'));
        $search = new EmployeeSearchFilterParameters();
        $search->in()->set('lang',$languages->getKeys()->toArray());     
        $search->getSearches()->push(__('Languages begins by "%s": %s',[$request->getRequestParameter('letter'), $languages->implode(', ')]));       
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts'); 
    }
}

