<?php


class cms_pages_selectListFilterPageI18nActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
       $messages = mfMessages::getInstance();               
       $this->formFilter=new selectListFilterPageI18nFormFilter($this->getParameter('language',$this->getUser()->getCountry()));          
       $this->formFilter->setDefault('selected',$this->getParameter('selected'));
       $this->pager=new Pager(array('cmsPage','CmsPageI18n'));
       try
       {                             
               $this->pager->setQuery($this->formFilter->getQuery()); 
               $this->pager->setNbItemsByPage((string)$this->formFilter['nbitemsbypage']);                                  
               $this->pager->setParameter('lang',(string)$this->formFilter['lang']);                
               $this->pager->setPage($request->getGetParameter('page'));
               $this->pager->execute();              
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
      //  var_dump($this->pager[0]); return mfView::NONE;
    }     
    
}