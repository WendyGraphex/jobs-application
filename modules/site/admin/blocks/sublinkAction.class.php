<?php

class site_sublinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
   {                       
          $this->sublinks=MenuManager::getInstance('site.dashboard')->getMenu()->getSublinks($request->getParameter('route_full'),$request->isXmlHttpRequest());       
    }
    
}
