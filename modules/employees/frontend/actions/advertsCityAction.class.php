<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchFilterParameters.class.php";

class employees_advertsCityAction extends mfAction {
        
    function execute(mfWebRequest $request) {        
        $messages = mfMessages::getInstance();        
        $country=new SiteCountry(array('lang'=>$this->getUSer()->getLanguage(),'title'=>$request->getRequestParameter('country')));        
        $search = new EmployeeSearchFilterParameters();
        $search->search()->set('city',$request->getRequestParameter('city'));     
        $search->equal()->set('country',$country->get('code'));     
         $search->getSearches()->push(__('City "%s-%s"',[$request->getRequestParameter('country'),$request->getRequestParameter('city')]));     
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts'); 
    }
}


