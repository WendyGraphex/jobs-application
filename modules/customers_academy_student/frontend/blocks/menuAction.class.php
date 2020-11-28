<?php

class customers_academy_student_menuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
       $this->menu= MenuManager::getInstance('academy_student.user.dashboard')->getMenu();     
       $this->user=$this->getUser();
       $this->url_selected=$request->getURI();  
    // echo "<pre>"; var_dump($this->menu); echo "</pre>";
    } 
    
    
}