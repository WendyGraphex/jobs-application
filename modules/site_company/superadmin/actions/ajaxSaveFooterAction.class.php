<?php

require_once __DIR__."/../locales/Forms/CompanyFooterForm.class.php";

class site_company_ajaxSaveFooterAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
       
    function execute(mfWebRequest $request) {     
        $messages = mfMessages::getInstance();
        try
        {
            if (!$this->getUser()->hasCredential(array(array('superadmin','admin_company'))))
               $this->forwardTo401Action(); 
            $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);
            if (!$site) 
                throw new mfException(__("thanks to select a site"));
            $form = new CompanyFooterForm();
            $form->bind($request->getPostParameter('Company'),$request->getFiles('Company'));
            $response=null;
            if ($form->isValid())
            {    
                $site_company=new SiteCompany($form['id'],$site);
                if ($form->hasValue('footer') && $site_company->isLoaded())
                {  
                    $file=$form->getValue('footer');
                    $file->setFilename($site_company->getNameForFooter());
                    $file->save($site_company->getFooter()->getPath());
                    $site_company->set('footer',$file->getFilename());
                    $site_company->save();
                    $response=array("footer"=>$site_company->get('footer'),"id"=>$site_company->get('id'));
                }  
            }            
        }
        catch (mfException $e)
        {
           $messages->addError($e);
        }  
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;        
    }

}
