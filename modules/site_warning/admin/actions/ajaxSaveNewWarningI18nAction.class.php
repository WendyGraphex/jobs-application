<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteWarningNewForm.class.php";

class site_warning_ajaxSaveNewWarningI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new SiteWarningNewForm($this->getUser()->getLanguage(),$request->getPostParameter('SiteWarningI18n'));             
            $this->item_i18n=new SiteWarningI18n();
            $this->form->bind($request->getPostParameter('SiteWarningI18n'),$request->getFiles('SiteWarningI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getWarning()->add($this->form['warning']->getValues());
                $this->item_i18n->add($this->form['warning_i18n']->getValues());
                 if ($this->item_i18n->getWarning()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getWarning()->setIcon($this->form->getIcon());                
                $this->item_i18n->getWarning()->save();                                                                      
                $this->item_i18n->set('warning_id',$this->item_i18n->getWarning());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Warning has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialWarning');
            }   
            else
            {               
                // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['warning_i18n']->getValues());
                $this->item_i18n->getWarning()->add($this->form['warning']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
