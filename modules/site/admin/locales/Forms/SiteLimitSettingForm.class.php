<?php

class SiteLimitSettingForm extends mfForm {
     
    protected $settings=null,$components=null;
            
      function __construct($settings=null,$defaults = array()) {
          $this->settings=$settings;
          parent::__construct($defaults);
      }
      
      function getSettings()
      {
          return $this->settings;
      }
      
       function getComponents()
      {
          return $this->components=$this->components===null?new mfArray():$this->components;
      }
      
      function getBlocks()
      {
           if ($this->blocks === null)
               $this->blocks=new mfArray();           
           return $this->blocks;
      }
}

