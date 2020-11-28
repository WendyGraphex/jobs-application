<?php


class site_warning_warningActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {
         $this->user=$this->getUser();         
         $this->tpl=$this->getParameter('tpl');
         $this->warning_i18n=new SiteWarningI18n(array('name'=>$this->getParameter('warning'),'lang'=>$this->getUSer()->getLanguage()));    
         if ($this->warning_i18n->isNotLoaded())
             return mfView::NONE;
    } 
    
    
}

