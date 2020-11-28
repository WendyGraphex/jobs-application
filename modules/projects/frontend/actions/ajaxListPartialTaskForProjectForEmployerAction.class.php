<?php


require_once __DIR__."/../locales/FormFilters/ProjectTaskForProjectEmployerFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/ProjectTaskForProjectEmployerPager.class.php";


class projects_ajaxListPartialTaskForProjectForEmployerAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $this->project=$request->getRequestParameter('project',new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser()));    
        if ($this->project->isNotLoaded())
            return ;
        $this->formFilter= new ProjectTaskForProjectEmployerFormFilter($this->project,$request->getRequestParameter('filter',$request->getPostParameter('filter')));                  
        $this->pager=new ProjectTaskForProjectEmployerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);  
                $this->pager->setParameter('lang',$this->getUser()->getLanguage()); 
                $this->pager->setParameter('project_id',$this->project->get('id'));
                $this->pager->setParameter('employer_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
               }   
               else
               {
                  $messages->addError(__('Filter has some errors.'));
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }         
        $this->states=ProjectTaskState::getStatesForSelect();
    }
    
}
