<?php

require_once __DIR__."/../locales/FormFilters/EmployeeInvitationFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeInvitationPager.class.php";

class employees_invitation_ajaxListPartialInvitationAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new EmployeeInvitationFormFilter($this->user);                  
        $this->pager=new EmployeeInvitationPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                     
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
               }
               else
               {
                   var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                   $messages->addError(__('Filter has an errors.'));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }
    
}
