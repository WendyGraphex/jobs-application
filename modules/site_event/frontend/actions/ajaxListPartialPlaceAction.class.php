<?php

require_once __DIR__."/../locales/FormFilters/SiteEventPlaceFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SiteEventPlacePager.class.php";

class site_event_ajaxListPartialPlaceAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();      
         if (!$this->getUser()->isEventUser())             
           $this->forwardTo401Action();       
        $this->formFilter= new SiteEventPlaceFormFilter($this->getUser()->getGuardUser());                  
        $this->pager=new SiteEventPlacePager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                     
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->setParameter('event_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->execute();              
               }             
               else
               {
                   $messages->addError(__('Filter has errors.'));
                 //  var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}