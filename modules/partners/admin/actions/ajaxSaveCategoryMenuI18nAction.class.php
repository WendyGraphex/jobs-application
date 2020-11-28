<?php


 require_once dirname(__FILE__)."/../locales/Forms/PartnerWorkCategoryMenuViewForm.class.php";
 
class  partners_ajaxSaveCategoryMenuI18nAction extends mfAction {
    
   
        
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();    
              
        $this->form = new PartnerWorkCategoryMenuViewForm($request->getPostParameter('PartnerWorkCategoryMenuI18n'));                    
        try
        {            
            $this->item_i18n=new PartnerWorkCategoryMenuI18n($this->form->getDefault('menu_i18n'));               
            $this->form->bind($request->getPostParameter('PartnerWorkCategoryMenuI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form['menu_i18n']->getValues());
                $this->item_i18n->getMenu()->add($this->form['menu']->getValues());
               // var_dump($this->item_i18n->getCategory()->isExist(),$this->item_i18n->isExist());
                if ($this->item_i18n->getMenu()->isExist())
                            throw new mfException (__("Menu item already exists"));     
          //      $this->item_i18n->getCategory()->set('number_of_products',$this->form->getPartnerWorkCategories()->count());
                $this->item_i18n->getMenu()->save();
                $this->item_i18n->save();
           //     $this->item_i18n->getCategory()->updatePartnerWorks($this->form->getPartnerWorkCategories());           
                $messages->addInfo(__('Menu item  has been saved.'));
                $request->addRequestParameter('node',$this->item_i18n->getMenu()->getFather());
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCategoryMenu');
            }   
            else
            {                    
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getMenu()->add($this->form['menu']->getValues());
               $this->item_i18n->add($this->form['menu_i18n']->getValues());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

