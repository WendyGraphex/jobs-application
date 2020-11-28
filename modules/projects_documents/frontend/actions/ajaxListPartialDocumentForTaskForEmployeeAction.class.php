<?php


require_once __DIR__."/../locales/FormFilters/ProjectDocumentForTaskEmployeeFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/ProjectDocumentForTaskEmployeePager.class.php";


class projects_documents_ajaxListPartialDocumentForTaskForEmployeeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        if (!$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $this->task=$request->getRequestParameter('task',new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser()));    
        if ($this->task->isNotLoaded())
            return ;
        $this->formFilter= new ProjectDocumentForTaskEmployeeFormFilter($this->project,$request->getRequestParameter('filter',$request->getPostParameter('filter')));                  
        $this->pager=new ProjectDocumentForTaskEmployeePager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);  
                $this->pager->setParameter('lang',$this->getUser()->getLanguage()); 
                $this->pager->setParameter('task_id',$this->task->get('id'));
                $this->pager->setParameter('employee_user_id',$this->getUser()->getGuardUser()->get('id'));
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

