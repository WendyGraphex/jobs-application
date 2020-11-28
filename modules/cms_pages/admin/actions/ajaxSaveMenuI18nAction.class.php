<?php

require_once __DIR__."/../locales/Forms/Menu/CmsMenuPageNodeViewForm.class.php";

require_once __DIR__."/../locales/Forms/Menu/CmsMenuI18nNodeForm.class.php";
   

class cms_pages_ajaxSaveMenuI18nAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                      
        try
        {
            $form= new CmsMenuI18nNodeForm();
            $form->bind($request->getPostParameter('CmsMenuI18n'));
            if (!$form->isValid())
               return ;    
            $this->item_i18n=$form->getMenuI18n();    
            $this->form = new CmsMenuPageNodeViewForm($this->item_i18n,$request->getPostParameter('CmsMenuPageI18n'));                      
            $this->form->bind($request->getPostParameter('CmsMenuPageI18n'));               
            if ($this->form->isValid())       
            {
                $this->item_i18n->getMenu()->add($this->form->getValuesForMenu());
                if ($this->item_i18n->getMenu()->isExist())
                    throw new mfException(__('Menu item already exists.'));
                if ($this->form->hasPage()) 
                {                                   
                     $this->item_i18n->getMenu()->getPage()->add($this->form->getValuesForPage()); 
                     $this->item_i18n->getPageI18n()->add($this->form->getValuesForPageI18n());                      
                     if ($this->item_i18n->getMenu()->getPage()->isExist() ||  $this->item_i18n->getPageI18n()->isExist())
                         throw new mfException(__('Page already exists.'));                        
                     $this->item_i18n->getMenu()->getPage()->save(); 
                     $this->item_i18n->getPageI18n()->set('page_id',$this->item_i18n->getMenu()->getPage());
                     $this->item_i18n->getPageI18n()->save();
                     $this->item_i18n->getMenu()->set('page_id',$this->item_i18n->getMenu()->getPage());
                }
                                            
                $this->item_i18n->getMenu()->save(); 
                $this->item_i18n->set('menu_id',$this->item_i18n->getMenu());
                $this->item_i18n->add($this->form->getValuesForMenuI18n())->save();
 
                $messages->addInfo(__('Menu and page item has been updated.'));
                $request->addRequestParameter('node', $this->item_i18n->getMenu()->getFather());
                $this->forward($this->getModuleName(),'ajaxListPartialMenu');   
            }     
            else
            {
                $messages->addError(__('Form has some errors.'));
                $this->item_i18n->add($this->form->getValuesForMenuI18n()); 
                $this->item_i18n->getMenu()->add($this->form->getValuesForMenu()); 
                $this->item_i18n->getMenu()->getPage()->add($this->form->getValuesForPage()); 
                $this->item_i18n->getPageI18n()->add($this->form->getValuesForPageI18n()); 
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }
    
      
}


