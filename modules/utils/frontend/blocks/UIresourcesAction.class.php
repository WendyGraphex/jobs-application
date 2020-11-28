<?php

 // www.project55.net/web/js/ui/i18n/jquery.ui.datepicker-en.js
class utils_UIresourcesActionComponent extends mfActionComponent {

    function preExecute() {
        $this->addJavascript('ui/i18n/jquery.ui.datepicker-'.str_replace('_','-',$this->getUser()->getCulture()).'.js');       
     }
    
    function execute(mfWebRequest $request) {       
         $this->version=$this->getParameter('version','1.11.3');
    }
    
}    