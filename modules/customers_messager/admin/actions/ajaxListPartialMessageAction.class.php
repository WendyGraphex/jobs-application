<?php

require_once __DIR__."/../locales/FormFilters/CustomerMessageFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CustomerMessagePager.class.php";

class customers_messager_ajaxListPartialMessageAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new CustomerMessageFormFilter($this->user);                  
        $this->pager=new CustomerMessagePager();
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
