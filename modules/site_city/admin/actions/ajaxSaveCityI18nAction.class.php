<?php


 require_once dirname(__FILE__)."/../locales/Forms/SiteCityViewForm.class.php";
 
class  site_city_ajaxSaveCityI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new SiteCityViewForm($request->getPostParameter('SiteCityI18n'));                 
        try
        {   
                     
            $this->item_i18n=new SiteCityI18n($this->form->getDefault('city_i18n'));               
            $this->form->bind($request->getPostParameter('SiteCityI18n'),$request->getFiles('SiteCityI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForCityI18n());
                $this->item_i18n->getCity()->add($this->form->getValuesForCity());  
                if ($this->item_i18n->getCity()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" City already exists"));                 
                $this->item_i18n->getCity()->setIcon($this->form->getIcon());             
                $this->item_i18n->getCity()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('City has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCity');
            }   
            else
            {                    
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getCity()->add($this->form->getValuesForCity());
               $this->item_i18n->add($this->form->getValuesForCityI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

