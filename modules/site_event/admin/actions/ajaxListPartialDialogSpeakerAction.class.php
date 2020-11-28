<?php

require_once __DIR__."/../locales/FormFilters/SiteEventSpeakerUserDialogFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SiteEventSpeakerUserDialogPager.class.php";

class site_event_ajaxListPartialDialogSpeakerAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {       
           
        $messages = mfMessages::getInstance();                      
        $this->formFilter= new SiteEventSpeakerUserDialogFormFilter();                  
        $this->pager=new SiteEventSpeakerUserDialogPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                   // echo $this->formFilter->getQuery();
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                  //  echo mfSiteDatabase::getInstance()->getQuery();
               }      
               else
               {
                   $messages->addError(__('Filter has some errors.'));
                  //   var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
       //  var_dump((string)$this->formFilter->getLanguage());
       
    }
    
}
