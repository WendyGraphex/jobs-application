<?php

require_once __DIR__."/../locales/Forms/Menu/CmsMenuPageNodeNewForm.class.php";
require_once __DIR__."/../locales/Forms/Menu/CmsMenuNodeForm.class.php";

class cms_pages_ajaxSaveNewMenuI18nAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();               
        $form=new CmsMenuNodeForm($request->getPostParameter('CmsMenu'));
        $form->bind($request->getPostParameter('CmsMenu'));   
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
         //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialMenu');  
        }
        try
        {
            $this->node =$form->getNode();       
            $this->item_i18n=new CmsMenuI18n();        
            $this->form = new CmsMenuPageNodeNewForm($form->getLanguage(),$request->getPostParameter('CmsMenuPageI18n'));                      
            $this->form->bind($request->getPostParameter('CmsMenuPageI18n'));               
            if ($this->form->isValid())       
            {
                $this->item_i18n->getMenu()->add($this->form->getValuesForMenu());
                if ($this->item_i18n->getMenu()->isExist())
                    throw new mfException(__('Menu item already exists.'));
                
                var_dump($this->form->hasPage());
                if ($this->form->hasPage()) 
                {                                     
                     $this->item_i18n->getMenu()->getPage()->add($this->form->getValuesForPage()); 
                     $this->item_i18n->getMenu()->getPage()->getI18n()->add($this->form->getValuesForPageI18n());                
                     if ($this->item_i18n->getMenu()->getPage()->isExist() ||  $this->item_i18n->getMenu()->getPage()->getI18n()->isExist())
                         throw new mfException(__('Page already exists.'));    
                     $this->item_i18n->getMenu()->getPage()->save(); 
                     $this->item_i18n->getMenu()->getPage()->getI18n()->set('page_id',$this->item_i18n->getMenu()->getPage());
                     $this->item_i18n->getMenu()->getPage()->getI18n()->save();
                }
               
                $this->item_i18n->getMenu()->at($this->node)->asFirstChild();
                $this->item_i18n->getMenu()->set('page_id',$this->form->hasPage()?$this->item_i18n->getMenu()->getPage():null);
                $this->item_i18n->getMenu()->save(); 
                $this->item_i18n->set('menu_id',$this->item_i18n->getMenu());
                $this->item_i18n->add($this->form->getValuesForMenuI18n())->save();

                $messages->addInfo(__('Menu and page item has been created.'));
                $request->addRequestParameter('node', $this->node);
                $this->forward($this->getModuleName(),'ajaxListPartialMenu');  
            }     
            else
            {
                $messages->addError(__('Form has some errors.'));
                $this->item_i18n->add($this->form->getValuesForMenuI18n()); 
                $this->item_i18n->getMenu()->add($this->form->getValuesForMenu()); 
                $this->item_i18n->getMenu()->getPage()->add($this->form->getValuesForPage()); 
                $this->item_i18n->getMenu()->getPage()->getI18n()->add($this->form->getValuesForPageI18n()); 
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }
    
      
}


