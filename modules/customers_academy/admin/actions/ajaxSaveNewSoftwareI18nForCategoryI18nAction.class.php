<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademySoftwareForCategoryI18nNewForm.class.php";

class customers_academy_ajaxSaveNewSoftwareI18nForCategoryI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->category_i18n=new CustomerCourseCategoryI18n($request->getPostParameter('CustomerCourseCategoryI18n')); 
            if ($this->category_i18n->getCategory()->isNotLoaded())
                return ;
            $this->form= new CustomerAcademySoftwareForCategoryI18nNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CustomerAcademySoftwareI18n'));             
            $this->item_i18n=new CustomerAcademySoftwareI18n();
            $this->form->bind($request->getPostParameter('CustomerAcademySoftwareI18n'),$request->getFiles('CustomerAcademySoftwareI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getSoftware()->add($this->form['software']->getValues());
                $this->item_i18n->getSoftware()->set('category_id',$this->category_i18n->getCategory());
                $this->item_i18n->add($this->form['software_i18n']->getValues());
                 if ($this->item_i18n->getSoftware()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getSoftware()->setIcon($this->form->getIcon());                
                $this->item_i18n->getSoftware()->save();                                                                      
                $this->item_i18n->set('software_id',$this->item_i18n->getSoftware());                                                                                                                                                                                  
                $this->item_i18n->save(); 
                $messages->addInfo(__("Academy Software has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $request->addRequestParameter('node',$this->category_i18n->getCategory());                
                $this->forward($this->getModuleName(),'ajaxListPartialSoftwareForCategoryI18n');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['software_i18n']->getValues());
                $this->item_i18n->getSoftware()->add($this->form['software']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
