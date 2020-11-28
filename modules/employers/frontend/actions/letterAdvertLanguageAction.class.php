<?php

require_once __DIR__."/../locales/Forms/EmployerSearchFilterParameters.class.php";

class employers_letterAdvertLanguageAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();    
        
        $languages = EmployerAdvertSearchLanguageLetter::getLanguagesByLetter($request->getRequestParameter('letter'));
        $search = new EmployerSearchFilterParameters();
        $search->in()->set('lang',$languages->getKeys()->toArray());     
        $search->getSearches()->push(__('Languages begins by "%s": %s',[$request->getRequestParameter('letter'), $languages->implode(', ')]));       
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts'); 
    }
}

