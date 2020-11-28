<?php

require_once dirname(__FILE__)."/../locales/Forms/Page/CmsPageI18nViewForm.class.php";

class cms_pages_ajaxSavePageI18nAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                       
        $this->form=new CmsPageI18nViewForm($request->getPostParameter('PageI18n'));               
        $this->form->bind($request->getPostParameter('PageI18n'));      
        $this->page_i18n=new CmsPageI18n($this->form->getDefault('page_i18n'));         
        if ($this->page_i18n->getPage()->isNotLoaded())
           return ;
        if ($this->form->isValid())       
        {
            $this->page_i18n->add($this->form['page_i18n']->getValues());
            $this->page_i18n->save();
            $this->page_i18n->getPage()->add($this->form['page']->getValues());
            $this->page_i18n->getPage()->save();  
            $messages->addInfo(__("Page [%s] has been saved.",(string)$this->page_i18n->getFormatter()->getIdentity()));
            $request->addRequestParameter('lang',$this->page_i18n->get('lang'));
            $this->forward($this->getModuleName(),'ajaxListPartialPage');
        }   
        else
        {  // Repopulate
           // echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));                   
             $this->page_i18n->add($this->form['page_i18n']->getValues()); 
             $this->page_i18n->getPage()->add($this->form['page']->getValues());               
        }               
    }
    
      
}

