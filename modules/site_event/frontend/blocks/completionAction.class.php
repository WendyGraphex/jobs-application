<?php

require_once __DIR__."/../locales/Forms/SiteEventUserCompletionForm.class.php";


class site_event_completionActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();       
       $this->event_user=$this->getUser()->getGuardUser();
       $this->form=new SiteEventUserCompletionForm($this->event_user);
       $this->is_block=true;
    } 
    
    
}