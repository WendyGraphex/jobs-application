<?php

require_once __DIR__."/../locales/FormFilters/EmployeeSkillsControllerFormFilter.class.php";             
require_once __DIR__."/../locales/Pagers/EmployeeSkillsControllerPager.class.php";


class employees_skillsAction extends mfAction {
        
    function execute(mfWebRequest $request) {              
        $this->user=$this->getUser();
        $messages = mfMessages::getInstance();              
         $this->formFilter= new EmployeeSkillsControllerFormFilter($request->getRequestParameter('search'),$request->getPostParameter('filter'));                                     
        $this->pager=new EmployeeSkillsControllerPager($this->formFilter);
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                 // echo $this->formFilter->getQuery();
                 //  echo $this->formFilter['nbitemsbypage'];
                    $this->pager->setQuery($this->formFilter->getQuery()); 
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);   
                    $this->pager->setParameter('lang',$this->getUser()->getLanguage());                                     
                    $this->pager->setPage($request->getGetParameter('page'));
                    $this->pager->execute();    
                    
                  //  echo $this->formFilter['nbitemsbypage'];
                    
             //   echo mfSiteDatabase::getInstance()->getQuery();
               }               
               else
               {
                 // var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
                   $messages->addError(__("Filter has errors."));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        } 
        
        
    }
}


