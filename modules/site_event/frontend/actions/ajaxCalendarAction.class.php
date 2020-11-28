<?php

require_once __DIR__."/../locales/FormFilters/CalendarFormFilter.class.php";
 
class site_event_ajaxCalendarAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {                    
          
        $messages = mfMessages::getInstance();        
        $this->user=$this->getUser();       
        $this->formFilter= new CalendarFormFilter($this->getUser(),$request->getPostParameter('filter'));                                       
        try
        {
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid() || $request->getPostParameter('filter')==null)
            {                     
                $this->formFilter->execute();
            }
            else
            {
                $messages->addErrors(__('Filter has some errors.')); 
            }    
            // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }   
    }

}
