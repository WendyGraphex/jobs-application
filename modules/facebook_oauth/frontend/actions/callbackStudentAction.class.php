<?php

/*
 * https://www.project55.net/facebook/oauth/callback/employer
 * TODO
 * - FacebookPicture                          OK
 * - Test de connection => callbackError      Presque
 * - email                                    OK
 * - picture                                  OK
 * - employer uploadAvatarFromUrl             OK
 */

class facebook_oauth_callbackStudentAction extends mfAction
{

    function execute(mfWebRequest $request)
    {      
         
        $_SERVER['HTTPS']=1;
        $_SERVER['HTTP_SSL_HTTPS']=1;        
        $messages = mfMessages::getInstance();
        // echo "<pre>";  var_dump($_SESSION); die(__METHOD__);             
        try 
        {                          
            $fb=new FacebookOauth();                              
            $accessToken = $fb->getRedirectLoginHelper()->getAccessToken($fb->getStudentUrlCallBack());                   
            if (!$accessToken) 
                throw new mfException(__('Error auth'));
            $fb->setDefaultAccessToken($accessToken);                                      
            $student = new CustomerAcademyStudentUser($fb->getUser()->getEmail());

            $student->add(array(
                'firstname'=>$fb->getUser()->getFirstName(),                       
                'lastname'=>$fb->getUser()->getLastName(),  
                'is_locked'=>'NO'
            ))->validate();

            $student->uploadAvatarFromUrl(new FacebookPicture($fb->getUser()->getPicture()));                                 
            $this->getUser()->signin($student,$request->getIp());

            $this->getEventDispather()->notify(new mfEvent($student, 'customers_academy_student.user.connected'));                   
            $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_student_redirect_account')));   
        }             
        catch (Exception $e) {     
              $messages->addError($e);  
                  echo "<!-- ".$e->getMessage()." -->";
        }
        $this->forward($this->getModuleName (), 'callbackError');                            
    }

}


