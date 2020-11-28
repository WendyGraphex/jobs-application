<?php

 
 class EmployerCompanyNewForm extends EmployerCompanyBaseForm {
     

    function configure()
    {     
       
        parent::configure();
        unset($this['id']);
    }
    function getLogo()
    {
        //return $this['company']['logo']->getValue();
        return $this['logo']->getValue();
    }
    function getPictureCompany()
    {
        return $this['picture']->getValue();
       // return $this['company']['picture']->getValue();
    }
    function hasLogo()
    {
        //return $this['company']['logo']->hasValue();
        return $this['logo']->hasValue();
    }
    function hasPictureCompany()
    {
        return $this['company']['picture']->hasValue();
    }

 }

