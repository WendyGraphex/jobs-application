<?php


 require_once dirname(__FILE__)."/../locales/Forms/PartnerWorkCategoryViewForm.class.php";
 
class  partners_ajaxSaveCategoryI18nAction extends mfAction {
    
   
        
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();    
              
        $this->form = new PartnerWorkCategoryViewForm($request->getPostParameter('PartnerWorkCategoryI18n'));                    
        try
        {            
            $this->item_i18n=new PartnerWorkCategoryI18n($this->form->getDefault('category_i18n'));               
            $this->form->bind($request->getPostParameter('PartnerWorkCategoryI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form['category_i18n']->getValues());
                $this->item_i18n->getCategory()->add($this->form['category']->getValues());
               // var_dump($this->item_i18n->getCategory()->isExist(),$this->item_i18n->isExist());
                if ($this->item_i18n->getCategory()->isExist() || $this->item_i18n->isExist())
                            throw new mfException (__("Category already exists"));     
          //      $this->item_i18n->getCategory()->set('number_of_products',$this->form->getPartnerWorkCategories()->count());
                $this->item_i18n->getCategory()->save();
                $this->item_i18n->save();
           //     $this->item_i18n->getCategory()->updatePartnerWorks($this->form->getPartnerWorkCategories());           
                $messages->addInfo(__('Category has been saved.'));
                $request->addRequestParameter('node',$this->item_i18n->getCategory()->getFather());
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCategory');
            }   
            else
            {                    
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getCategory()->add($this->form['category']->getValues());
               $this->item_i18n->add($this->form['category_i18n']->getValues());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

