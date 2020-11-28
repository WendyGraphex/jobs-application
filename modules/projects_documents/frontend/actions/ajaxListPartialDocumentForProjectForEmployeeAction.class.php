<?php


require_once __DIR__."/../locales/FormFilters/ProjectDocumentForProjectEmployeeFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/ProjectDocumentForProjectEmployeePager.class.php";

class projects_documents_ajaxListPartialDocumentForProjectForEmployeeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        if (!$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $this->project=$request->getRequestParameter('project',new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser()));    
        if ($this->project->isNotLoaded())
            return ;
        $this->formFilter= new ProjectDocumentForProjectEmployeeFormFilter($this->project,$request->getRequestParameter('filter',$request->getPostParameter('filter')));                  
        $this->pager=new ProjectDocumentForProjectEmployeePager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);  
                $this->pager->setParameter('lang',$this->getUser()->getLanguage()); 
                $this->pager->setParameter('project_id',$this->project->get('id'));
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
