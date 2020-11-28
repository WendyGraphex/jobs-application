<?php

// www.project55.net/event/toto.html
class site_event_eventAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {                    
        $this->event_i18n= new SiteEventI18n(array('url'=>new mfString($request->getRequestParameter('url')),'lang'=>$this->getUser()->getLanguage()));               
        $this->forwardIf($this->event_i18n->isNotLoaded(),$this->getModuleName(), 'event404');
      /*  $search = new EmployeeSearchFilterParameters();
        $search->in()->set('skill_id',$this->skill_i18n->getSkill()->get('id'));          
        $request->addRequestParameter('search', $search); */ 
        
      //  $this->article_i18n->set('number_of_views',$this->article_i18n->getNumberOfViews() + 1)->save(); 
    }

}
