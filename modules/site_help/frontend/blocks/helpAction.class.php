<?php


class site_help_helpActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {
         $this->user=$this->getUser();         
         $this->tpl=$this->getParameter('tpl');
         $this->help_i18n=new SiteHelpI18n(array('name'=>$this->getParameter('help'),'lang'=>$this->getUSer()->getLanguage()));    
         if ($this->help_i18n->isNotLoaded())
             return mfView::NONE;
    } 
    
    
}

