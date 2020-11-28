<?php

//require_once __DIR__."/../locales/FormFilters/EmployerProjectDialogFormFilter.class.php";
//require_once __DIR__."/../locales/Pagers/EmployerProjectDialogPager.class.php";


class employers_project_ListProjectsDialogActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {            
        $this->user=$this->getUser()->getGuardUser();
      /*  if ($this->user->getNumberOfProjects() <= 1)
        {
            $this->project= new EmployerProject($this->user);       
        }  */          
      /*  $this->formFilter= new EmployerProjectDialogFormFilter($this->getUser());                  
        $this->pager=new EmployerProjectDialogPager();                          
        $this->pager->setQuery($this->formFilter->getQuery()); 
        $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
       // $this->pager->setParameter('lang',$this->getUser()->getLanguage());
        $this->pager->setParameter('employer_user_id',$this->getUser()->getGuardUser()->get('id'));
        $this->pager->setPage($request->getGetParameter('page'));
        $this->pager->execute();     */                                                      
    } 
    
    
}