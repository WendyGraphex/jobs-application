<?php

class customers_newsletter_exportAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
       $type=$request->getGetParameter('type');
       if ($type=='csv')
       {
           $export=new newsletterCSVExport(array("lang"=>$this->getUser()->getLanguage()));
           $export->output();
       }    
       elseif ($type=='pdf')
       {
//              $newsletter_pdf = new newsletterPDF(array("lang"=>$this->getUser()->getLanguage()));
              //  $newsletter_pdf->debug();
//              $newsletter_pdf->output();
       }    
       die();
       return mfView::NONE;       
    }

}

