<?php

/*
 * TODO
 * - FacebookPicture                          OK
 * - Test de connection => callbackError      Presque
 * - email                                    OK
 * - picture                                  OK
 * - customer uploadAvatarFromUrl             OK
 */

class facebook_oauth_callbackAction extends mfAction
{

    function execute(mfWebRequest $request)
    {      
        $_SERVER['HTTPS']=1;
        $_SERVER['HTTP_SSL_HTTPS']=1;        
        $messages = mfMessages::getInstance();
        // echo "<pre>";  var_dump($_SESSION); die(__METHOD__);             
        try 
        {               
                $fb=new FacebookOauth(new FacebookOauthSettings());  
                //var_dump($fb->getException());               
                 $accessToken = $fb->getRedirectLoginHelper()->getAccessToken($fb->getUrlCallBack());                   
                if (!$accessToken) 
                    throw new mfException(__('Error auth'));
                $fb->setDefaultAccessToken($accessToken);                                      
                $customer = new CustomerUser($fb->getUser()->getEmail());
                $customer->add(array(
                    'firstname'=>$fb->getUser()->getFirstName(),                       
                    'lastname'=>$fb->getUser()->getLastName(),                  
                ))->save();
                $customer->uploadAvatarFromUrl(new FacebookPicture($fb->getUser()->getPicture()));      
                             
                $this->getUser()->signin($customer,$request->getIp());
             //   $this->getEventDispather()->notify(new mfEvent($customer, 'customer.connected'));                   
              //  $this->redirect(to_link_i18n(mfConfig::get('mf_customer_redirect_account')));   
            }             
            catch (Exception $e) {     
                  $messages->addError($e);                  
            }
            $this->forward($this->getModuleName (), 'callbackError');                          
    }

}


