<?php

require_once __DIR__."/../locales/FormFilters/SitesFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/SitePager.class.php";

class site_sitesListActionComponent extends mfActionComponent {
    
   
    
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
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->executeSuperAdmin();
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

