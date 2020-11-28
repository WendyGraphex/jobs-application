<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertCommentSendForm.class.php";

class employers_comment_addAdvertCommentActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                      
      if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            return mfView::NONE;
      $this->form= new EmployerAdvertCommentSendForm($this->getUser());     
      $this->tpl=$this->getParameter('tpl','default');      
      $this->max_characters=500;
    } 
    
    
}
