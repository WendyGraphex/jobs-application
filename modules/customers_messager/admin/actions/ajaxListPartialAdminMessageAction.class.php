<?php

require_once __DIR__."/../locales/FormFilters/CustomerAdminMessageFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CustomerAdminMessagePager.class.php";

class customers_messager_ajaxListPartialAdminMessageAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new CustomerAdminMessageFormFilter($this->user);                  
        $this->pager=new CustomerAdminMessagePager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
              //     echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);                     
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
    // var_dump($this->formFilter['sender']->getValue());
    }
    
}
