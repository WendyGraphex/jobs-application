<?php

class linkedin_oauth_oauthBtnEventUserActionComponent extends mfActionComponent  {

    function execute(mfWebRequest $request) {    
        try
        {
              $this->target=$this->getParameter('target');             
        } 
        catch (Exception $ex) {
            $this->error=$ex->getMessage();
        }
    }
}

