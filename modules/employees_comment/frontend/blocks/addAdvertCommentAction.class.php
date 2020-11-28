<?php

require_once __DIR__."/../locales/Forms/EmployeeAdvertCommentSendForm.class.php";

class employees_comment_addAdvertCommentActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                      
      if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
            return mfView::NONE;
      $this->form= new EmployeeAdvertCommentSendForm($this->getUser());     
      $this->tpl=$this->getParameter('tpl','default');     
      $this->max_characters=500;
    } 
    
    
}
