<?php

require_once __DIR__."/../locales/Forms/EmployerSearchFilterParameters.class.php";

class employers_advertsCityAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();        
        $country=new SiteCountry(array('lang'=>$this->getUSer()->getLanguage(),'title'=>$request->getRequestParameter('country')));        
        $search = new EmployerSearchFilterParameters();
        $search->search()->set('city',$request->getRequestParameter('city'));     
        $search->equal()->set('country',$country->get('code'));     
        $search->getSearches()->push(__('City "%s-%s"',[$request->getRequestParameter('country'),$request->getRequestParameter('city')]));     
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts'); 
    }
}


