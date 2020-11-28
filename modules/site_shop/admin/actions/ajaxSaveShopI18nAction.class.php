<?php


 require_once dirname(__FILE__)."/../locales/Forms/SiteShopViewForm.class.php";
 
class  site_shop_ajaxSaveShopI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new SiteShopViewForm($request->getPostParameter('SiteShopI18n'));                 
        try
        {   
                     
            $this->item_i18n=new SiteShopI18n($this->form->getDefault('shop_i18n'));               
            $this->form->bind($request->getPostParameter('SiteShopI18n'),$request->getFiles('SiteShopI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForShopI18n());
                $this->item_i18n->getShop()->add($this->form->getValuesForShop());  
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Shop already exists"));                 
                $this->item_i18n->getShop()->setIcon($this->form->getIcon()); 
                $this->item_i18n->getShop()->setFavicon($this->form->getFavicon());                
                $this->item_i18n->getShop()->setLogo($this->form->getLogo());     
                $this->item_i18n->getShop()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Shop has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialShop');
            }   
            else
            {                    
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getShop()->add($this->form->getValuesForShop());
               $this->item_i18n->add($this->form->getValuesForShopI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

