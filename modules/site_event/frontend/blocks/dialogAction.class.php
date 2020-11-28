<?php

class site_event_dialogActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                    
       $this->user=$this->getUser();
       $this->max_characters=500;
    } 
    
    
}