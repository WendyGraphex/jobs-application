<?php


class services_smsbox_callback_linkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {
         if (!$this->getUser()->hasCredential(array(array('superadmin'))))
             return mfView::NONE;
    } 
    
    
}

