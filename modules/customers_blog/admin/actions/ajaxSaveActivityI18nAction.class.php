<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerBlogActivityViewForm.class.php";
 
class  customers_blog_ajaxSaveActivityI18nAction extends mfAction {
    
   
        
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();    
              
        $this->form = new CustomerBlogActivityViewForm($request->getPostParameter('CustomerBlogActivityI18n'));                    
        try
        {            
            $this->item_i18n=new CustomerBlogActivityI18n($this->form->getDefault('activity_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerBlogActivityI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form['activity_i18n']->getValues());
                $this->item_i18n->getActivity()->add($this->form['activity']->getValues());
               // var_dump($this->item_i18n->getActivity()->isExist(),$this->item_i18n->isExist());
                if ($this->item_i18n->getActivity()->isExist() || $this->item_i18n->isExist())
                            throw new mfException (__("Activity already exists"));     
          //      $this->item_i18n->getActivity()->set('number_of_products',$this->form->getPartnerWorkActivities()->count());
                $this->item_i18n->getActivity()->save();
                $this->item_i18n->save();
           //     $this->item_i18n->getActivity()->updatePartnerWorks($this->form->getPartnerWorkActivities());           
                $messages->addInfo(__('Activity has been saved.'));
                $request->addRequestParameter('node',$this->item_i18n->getActivity()->getFather());
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialActivity');
            }   
            else
            {                    
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getActivity()->add($this->form['activity']->getValues());
               $this->item_i18n->add($this->form['activity_i18n']->getValues());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

