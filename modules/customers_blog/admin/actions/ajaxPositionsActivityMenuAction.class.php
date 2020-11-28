<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerBlogActivityMenuPositionsForm.class.php";


class customers_blog_ajaxPositionsActivityMenuAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
        $this->user=$this->getUser();       
     //   $this->form = new CustomerBlogActivityViewForm();
        $this->item_i18n=new CustomerBlogActivityMenuI18n($request->getPostParameter('CustomerBlogActivityMenuI18n'));              
        $this->form=new CustomerBlogActivityMenuPositionsForm($request->getPostParameter('CustomerBlogActivityMenuPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerBlogActivityMenuPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('CustomerBlogActivityMenuPositions'));
        if ($this->form->isValid())
        {           
           // PartnerWorkFeature::updatePositions($this->form->getPositions());
            
          //  var_dump($this->form->getPositions());
            
            $messages->addInfo(__('Menu  have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialActivityMenu');
        }  
        else 
        {
            //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        } 
    }
    
}