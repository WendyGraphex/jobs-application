<?php


require_once __DIR__."/../locales/FormFilters/ProjectDocumentForTaskEmployerFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/ProjectDocumentForTaskEmployerPager.class.php";


class projects_documents_ajaxListPartialDocumentForTaskForEmployerAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $this->task=$request->getRequestParameter('task',new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser()));    
        if ($this->task->isNotLoaded())
            return ;
        $this->formFilter= new ProjectDocumentForTaskEmployerFormFilter($this->project,$request->getRequestParameter('filter',$request->getPostParameter('filter')));                  
        $this->pager=new ProjectDocumentForTaskEmployerPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);  
                $this->pager->setParameter('lang',$this->getUser()->getLanguage()); 
                $this->pager->setParameter('task_id',$this->task->get('id'));
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
        
    }
    
}

