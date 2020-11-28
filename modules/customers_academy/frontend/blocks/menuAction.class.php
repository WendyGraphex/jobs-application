<?php

class customers_academy_menuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
        $this->node=new CustomerCourseCategory($this->getParameter('node','root'));                 
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}