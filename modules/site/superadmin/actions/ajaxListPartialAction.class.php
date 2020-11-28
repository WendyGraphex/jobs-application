<?php

require_once __DIR__."/../locales/Pagers/SitePager.class.php";
require_once __DIR__."/../locales/FormFilters/SitesFormFilter.class.php";

class site_ajaxListPartialAction extends mfAction {
    
   
    
    function execute(mfWebRequest $request)
    {           
        $messages=mfMessages::getInstance();  
        $this->formFilter= new SitesFormFilter();
        $this->pager=new SitePager();     
        try 
        {
            $this->formFilter->bind($request->getPostParameter('filter'));           
            if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
            {
                $this->pager->setQuery($this->formFilter->getQuery());               
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                $this->pager->setPage($this->request->getGetParameter('page'));
                $this->pager->executeSuperAdmin();
            } 
            else
            {
                
            }    
        }
        catch (mfException $e)
        {
              $messages->addError($e);
        }
        $this->action_item=ActionsManager::getInstance("sites.list.action_item")->getActions();  
        $this->actions=ActionsManager::getInstance("sites.list.actions")->getActions();              
    }
    
    
 
	
	
}

