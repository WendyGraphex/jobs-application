<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteCityNewForm.class.php";

class site_city_ajaxSaveNewCityI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new SiteCityNewForm($this->getUser()->getLanguage(),$request->getPostParameter('SiteCityI18n'));             
            $this->item_i18n=new SiteCityI18n();
            $this->item=new SiteCityBase();
            
            $this->form->bind($request->getPostParameter('SiteCityI18n'),$request->getFiles('SiteCityI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getCity()->add($this->form['city']->getValues());
                $this->item_i18n->add($this->form['city_i18n']->getValues());
                 if ($this->item_i18n->getCity()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getCity()->setIcon($this->form->getIcon());                
                $this->item_i18n->getCity()->save();                                                                      
                $this->item_i18n->set('city_id',$this->item_i18n->getCity());
                $this->item->setIcon($this->form->getIcon());
                
                
                
                $this->item_i18n->save();
                $messages->addInfo(__("Contract City has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCity');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['city_i18n']->getValues());
                $this->item_i18n->getCity()->add($this->form['city']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
