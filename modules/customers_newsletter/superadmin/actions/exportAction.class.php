<?php

class customers_newsletter_exportAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
     
    function execute(mfWebRequest $request) {   
         // Rien renvoyer 
       $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);
       if (!$site) {
            //$messages = mfMessages::getInstance();
            mfMessages::getInstance()->addInfo(__("thanks to select a site"));
            $this->forward("sites","Admin");
       } 
       $type=$request->getGetParameter('type');
       if ($type=='csv')
       {
           $export=new newsletterCSVExport(array("lang"=>$this->getUser()->getLanguage()));
           $export->output();
       }    
       elseif ($type=='pdf')
       {
              $newsletter_pdf = new newsletterPDF(array("lang"=>$this->getUser()->getLanguage()));
              //  $newsletter_pdf->debug();
              $newsletter_pdf->output();
       }    
       die();
       return mfView::NONE;       
    }

}

