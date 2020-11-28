<?php


 
class payments_ajaxNewTextI18nAction extends mfAction {

     const SITE_NAMESPACE = 'system/site';
     
    function execute(mfWebRequest $request) {    
           
        $messages = mfMessages::getInstance();
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);        
        $this->forwardIf(!$site,"sites","ajaxAdmin"); 
        $class="payment".ucfirst(strtolower($request->getRequestParameter('payment')))."TextI18n";
        if (!class_exists($class))
            $this->forward404();                   
        $this->payment=strtolower($request->getRequestParameter('payment'));
        try 
        {
            $this->form = new paymentTextI18nForm($request->getPostParameter('textI18n',array('lang'=>$this->getUser()->getLanguage())));           
            $this->item=new $class(null,$site);
            if ($request->getPostParameter('textI18n'))
            {    
                $this->form->bind($request->getPostParameter('textI18n'));
                if ($this->form->isValid())
                {
                    $this->item->add($this->form->getValues());
                    if ($this->item->isExist())
                        throw new mfException(__('this text already exists'));
                    $this->item->save();
                    $messages->addInfo(__('text is saved.'));                   
                    $this->forward('payments','ajaxListTextI18n');        
                }
                else
                {                    
                    $this->item->add($request->getPostParameter('textI18n'));                    
                }    
            }                            
        } 
        catch (mfException $e)
        {          
           $messages->addError($e);
        }   
        $this->language=(string)$this->form['lang'];          
    //    return mfView::NONE;
    }

}