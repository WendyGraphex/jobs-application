<?php

require_once dirname(__FILE__)."/../locales/Forms/Page/CmsPageI18nNewForm.class.php";

class cms_pages_ajaxSaveNewPageI18nAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();          
        try
        {
            $this->page_i18n = new CmsPageI18n();       
            $this->form=new CmsPageI18nNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CmsPageI18n')); 
            $this->form->bind($request->getPostParameter('CmsPageI18n'));               
            if ($this->form->isValid())
            {                             
                  $this->page_i18n->add($this->form['page_i18n']->getValues());
                 $this->page_i18n->getPage()->add($this->form['page']->getValues()); 
                 $this->page_i18n->getPage()->save();
                 $this->page_i18n->set('page_id',$this->page_i18n->getPage());
                 $this->page_i18n->save();
                 $messages->addInfo(__("Page [%s] has been created.",$this->page_i18n->getFormatter()->getIdentity()));
                 $request->addRequestParameter('lang',$this->page_i18n->get('lang'));
                 $this->forward($this->getModuleName(),'ajaxListPartialPage');
            }
            else
            {
              //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
                $messages->addError(__('Form has some errors.'));                    
               $this->page_i18n->add($this->form['page_i18n']->getValue()); 
               $this->page_i18n->getPage()->add($this->form['page']->getValue()); 
            }    
        }
        catch (mfException $e)
        {
             $messages->addError($e);
        }
    }
    
      
}

