<?php

require_once __DIR__."/../locales/Forms/EmployerSearchQueryForm.class.php";

class employers_findWorkPanelActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
          $this->form= new  EmployerSearchQueryForm();     
     //echo "<pre>"; var_dump($this->form->category->getChoices());
    } 
    
    
}
