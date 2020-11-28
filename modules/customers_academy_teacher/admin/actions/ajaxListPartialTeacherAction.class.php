<?php

require_once __DIR__."/../locales/FormFilters/CustomerAcademyTeacherUserFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CustomerAcademyTeacherUserPager.class.php";

class customers_academy_teacher_ajaxListPartialTeacherAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->formFilter= new CustomerAcademyTeacherUserFormFilter($this->user);                  
        $this->pager=new CustomerAcademyTeacherUserPager();
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
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
       // var_dump($this->pager[0]);
     
    }
    
}