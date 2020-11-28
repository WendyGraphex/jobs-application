<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteHelpNewForm.class.php";

class site_help_ajaxSaveNewHelpI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new SiteHelpNewForm($this->getUser()->getLanguage(),$request->getPostParameter('SiteHelpI18n'));             
            $this->item_i18n=new SiteHelpI18n();
            $this->form->bind($request->getPostParameter('SiteHelpI18n'),$request->getFiles('SiteHelpI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getHelp()->add($this->form['help']->getValues());
                $this->item_i18n->add($this->form['help_i18n']->getValues());
                 if ($this->item_i18n->getHelp()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getHelp()->setIcon($this->form->getIcon());                
                $this->item_i18n->getHelp()->save();                                                                      
                $this->item_i18n->set('help_id',$this->item_i18n->getHelp());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Help has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialHelp');
            }   
            else
            {               
                // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['help_i18n']->getValues());
                $this->item_i18n->getHelp()->add($this->form['help']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
