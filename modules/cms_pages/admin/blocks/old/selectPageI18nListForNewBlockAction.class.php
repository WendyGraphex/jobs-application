<?php



class cms_pages_selectPageI18nListForNewBlockActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {    
        $lang=$this->getParameter('lang');
        $this->block=$this->getParameter('block');
        $this->pager=new Pager(array('CmsPageI18n','cmsPage'));  
        $this->formFilter= new selectPageI18nListForNewBlockFormFilter(array('lang'=>$lang));                                                                        
        $this->pager->setQuery($this->formFilter->getQuery());
        $this->pager->setParameter("id",$this->block->get('id'));
        $this->pager->setParameter("lang",(string)$this->formFilter['lang']);
        $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
        $this->pager->setPage($request->getGetParameter('page'));
        $this->pager->executeSite();           
    
    } 
    
    
}