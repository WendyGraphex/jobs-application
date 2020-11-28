<?php

 
 class EmployerAdvertPopularViewForm extends EmployerAdvertPopularBaseForm {
     

    function configure()
    {     
        parent::configure();
        unset($this['id']);
    }
 }

