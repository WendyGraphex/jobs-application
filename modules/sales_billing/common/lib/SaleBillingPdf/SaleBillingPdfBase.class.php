<?php

class SaleBillingPdfBase extends wkhtmltopdf {
    
    protected $billing=null,$model=null;
    
    function __construct(SaleBilling $billing,$options=array())
    {        
       $this->billing=$billing;       
       parent::__construct($options, null);    
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new SaleBillingSettings():$this->settings;
    }
    function getBilling()
    {
        return $this->billing;
    }
    
    function getModel()
    {
         return $this->model=$this->model===null?$this->getSettings()->getSaleBillingModel():$this->model;
    }
    
    
    function hasModel()
    {
        return $this->getSettings()->hasSaleBillingModel();
    }
    
   /* function getFilename()
    {                         
        return $this->getSalary()->getFile();
    }
    
    function getName()
    {
        return $this->getFile()->getName();
    }
    
    function getFile()
    {
        return new File($this->getFilename());
    }*/
    
    
    function configure()
    {            
        $this->setOption('filename',$this->getBilling()->getPdf());       
        /* $this->setOption('orientation','P');  */        
        parent::configure(); 
    }
    
    function isReadable()
    {
        return $this->getSalary()->getPdf()->isExist();
    }
    
   function output()
    {       
       $this->setOption('debug',true);        
       $this->create();            
       readfile($this->getTemplateFile());      
    }
    
   
    function save()
    {               
        $this->create();         
      //  parent::save();       
    }
    
    function forceOutput()
    {
        $this->create();           
        
       // die(__METHOD__);
       /* mfContext::getInstance()->getResponse()
             ->setHttpHeader('Cache-Control: no-cache, must-revalidate')          
             ->sendFile($this->getSalary()->getPdf()->getFilename());     */
         mfContext::getInstance()->getResponse() 
             ->setHttpHeader('Cache-Control: no-cache, must-revalidate')
             ->setHttpHeader('Content-disposition: filename="'.$this->getBilling()->getPdf()->getName().'"')
             ->sendFile($this->getBilling()->getPdf()->getFile());          
        return $this;
    } 
    
    function create()
    {                   
       //  $this->debug();
         $orientation = $this->hasModel() && $this->getModel()->hasOrientation()?"--orientation ".$this->getModel()->get('orientation'):"";  
         $this->setOption("options",$orientation." --enable-javascript --margin-bottom 0.0 --margin-left 0.0 --margin-right 0.0 --margin-top 0.0")
             ->createPDF('sales_billing','pdf',array('billing'=>$this->billing,'model'=>$this->model));                          
    }
}

