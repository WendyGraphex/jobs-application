<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteShopNewForm.class.php";

class site_shop_ajaxSaveNewShopI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new SiteShopNewForm($this->getUser()->getLanguage(),$request->getPostParameter('SiteShopI18n'));             
            $this->item_i18n=new SiteShopI18n();
            $this->form->bind($request->getPostParameter('SiteShopI18n'),$request->getFiles('SiteShopI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getShop()->add($this->form['shop']->getValues());
                $this->item_i18n->add($this->form['shop_i18n']->getValues());               
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Shop already exists"));                                       
                $this->item_i18n->getShop()->setIcon($this->form->getIcon());                
                $this->item_i18n->getShop()->setFavicon($this->form->getFavicon());                
                $this->item_i18n->getShop()->setLogo($this->form->getLogo());                
                $this->item_i18n->getShop()->save();                                                                      
                $this->item_i18n->set('shop_id',$this->item_i18n->getShop());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Shop has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialShop');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['shop_i18n']->getValues());
                $this->item_i18n->getShop()->add($this->form['shop']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
