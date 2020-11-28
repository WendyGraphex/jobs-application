<?php

require_once __DIR__."/../locales/Forms/Menu/CmsMenuNodeNewForm.class.php";
require_once __DIR__."/../locales/Forms/Menu/CmsMenuNodeForm.class.php";

class cms_pages_ajaxSaveNewNodeI18nAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();               
        $form=new CmsMenuNodeForm($request->getPostParameter('CmsMenuNode'));
        $form->bind($request->getPostParameter('CmsMenuNode'));   
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
         //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialMenu');  
        }
        try
        {
          //  $post=array('menu'=>array('name'=>'','awe'=>''),'token'=>mfForm::getToken('CmsMenuNodeNewForm'));
            $this->node =$form->getNode();       
            $this->item_i18n=new CmsMenuI18n();                
            $this->form = new CmsMenuNodeNewForm($form->getLanguage()); //,$request->getPostParameter('CmsMenuI18n'));                      
            $this->form->bind($request->getPostParameter('CmsMenuI18n'));               
            if ($this->form->isValid())       
            {
                $this->item_i18n->getMenu()->add($this->form->getValuesForMenu());
                if ($this->item_i18n->getMenu()->isExist())
                    throw new mfException(__('Menu item already exists.'));      
              //  echo "<pre>"; var_dump($this->form->getValues());
                 $this->item_i18n->getMenu()->at($this->node)->asFirstChild();            
                $this->item_i18n->getMenu()->save(); 
                $this->item_i18n->set('menu_id',$this->item_i18n->getMenu());
                $this->item_i18n->add($this->form->getValuesForMenuI18n())->save(); 

                $messages->addInfo(__('Menu item has been created.'));
                $request->addRequestParameter('node', $this->node);
                $this->forward($this->getModuleName(),'ajaxListPartialMenu');  
            }     
            else
            {
                $messages->addError(__('Form has some errors.'));
                $this->item_i18n->add($this->form->getValuesForMenuI18n()); 
                $this->item_i18n->getMenu()->add($this->form->getValuesForMenu());             
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }
    
      
}


