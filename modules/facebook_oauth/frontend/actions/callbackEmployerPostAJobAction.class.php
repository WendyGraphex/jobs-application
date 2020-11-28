<?php

/*
 * https://www.project55.net/facebook/oauth/callback/employer/post-a-job
 * http://www.project55.net/facebook/oauth/callback/employer/post-a-job
 * TODO
 * - FacebookPicture                          OK
 * - Test de connection => callbackError      Presque
 * - email                                    OK
 * - picture                                  OK
 * - customer uploadAvatarFromUrl             OK
 */

class facebook_oauth_callbackEmployerPostAJobAction extends mfAction
{

    function execute(mfWebRequest $request)
    {      
        $_SERVER['HTTPS']=1;
        $_SERVER['HTTP_SSL_HTTPS']=1;        
        $messages = mfMessages::getInstance();                               
    //      echo "<pre>";  var_dump($_SESSION); die(__METHOD__);             
        try 
        {          
            
           
                $fb=new FacebookOauth(new FacebookOauthSettings());  
                           
                $accessToken = $fb->getRedirectLoginHelper()->getAccessToken($fb->getEmployerPostAJobUrlCallBack());                   
                if (!$accessToken) 
                    throw new mfException(__('Error auth'));          
                $fb->setDefaultAccessToken($accessToken);                                                   
                
                $employer = new EmployerUser($fb->getUser()->getEmail());
                $employer->add(array(
                    'firstname'=>$fb->getUser()->getFirstName(),                       
                    'lastname'=>$fb->getUser()->getLastName(),  
                    'is_locked'=>'NO'
                ))->validate();
                $employer->uploadAvatarFromUrl(new FacebookPicture($fb->getUser()->getPicture()));   
                $this->getUser()->getStorage()->write('post_a_job_employer_user',$employer);                                                                     
                $this->getUser()->getStorage()->write('post_a_job_employer_user_callback',true);  
            }             
            catch (Exception $e) {     
                 // $messages->addError($e);       
                   //   echo "<!-- ".$e->getMessage()." -->";
            }                                           
            $this->redirect("/");   
    }

}


