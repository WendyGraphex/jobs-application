<?php


class customers_newsletter_pdfExportAction extends mfAction {
    
     const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) {      
        $this->site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);
        $this->newsletters=newsletterUtils::getNewsletters($site);
        
        //var_dump($this->newsletter);
    }
}

