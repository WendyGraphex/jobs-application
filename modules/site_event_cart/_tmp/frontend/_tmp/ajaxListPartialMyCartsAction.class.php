<?php

require_once __DIR__."/../locales/FormFilters/MyCartsFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/MyCartsPager.class.php";
require_once __DIR__."/../locales/Forms/CartEventCreateForm.class.php";
class cart_ajaxListPartialMyCartsAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new MyCartsFormFilter();                  
        $this->pager=new MyCartsPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                $this->pager->setParameter('customer_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();   
                
              
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}
