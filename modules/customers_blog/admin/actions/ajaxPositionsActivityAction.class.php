<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerBlogActivityPositionsForm.class.php";


class customers_blog_ajaxPositionsActivityAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        $this->user=$this->getUser();       
     //   $this->form = new CustomerBlogActivityViewForm();
        $this->item_i18n=new CustomerBlogActivityI18n($request->getPostParameter('CustomerBlogActivityI18n'));              
        $this->form=new CustomerBlogActivityPositionsForm($request->getPostParameter('CustomerBlogActivityPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerBlogActivityPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('CustomerBlogActivityPositions'));
        if ($this->form->isValid())
        {           
           // PartnerWorkFeature::updatePositions($this->form->getPositions());
            
            var_dump($this->form->getPositions());
            
            $messages->addInfo(__('Activities have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialActivity');
        }  
        else 
        {
            //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        } 
    }
    
}