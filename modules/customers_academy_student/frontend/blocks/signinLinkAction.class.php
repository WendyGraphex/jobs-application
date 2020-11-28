<?php

class customers_academy_student_signinLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
        $this->tpl=$this->getParameter('tpl','default');
     
    } 
    
    
}
