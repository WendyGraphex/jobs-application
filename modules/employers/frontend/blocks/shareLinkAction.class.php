<?php

class employers_shareLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       $this->max_characters=500;
        $this->employer_user=$this->getParameter('employer_user');
        $this->text=new mfString(__("Spread the word about this employer on Graphex"));
    } 
    
    
}