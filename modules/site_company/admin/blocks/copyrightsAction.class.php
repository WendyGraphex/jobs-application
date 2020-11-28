<?php

class site_company_copyrightsActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    { 
          $this->day=new Day();
          $this->company= SiteCompany:: getSiteCompany();
    } 
    
   
}

