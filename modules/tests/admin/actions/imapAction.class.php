<?php


class tests_imapAction extends mfAction {
    
   
 
    function execute(mfWebRequest $request) {                                  
        echo __METHOD__;
        try
        {
   //   $mailbox=new RecruitmentMailboxEmailServer();
   //   $mailbox->connect();
   //   $mailbox->setMailBox("Archives.2018.02");
    // var_dump($mailbox->numMessages());
     
     
     // var_dump($mailbox->getUidByIndex(2));
    //  var_dump($mailbox->createMailBox(imap_utf7_encode("Archives.2018")));
    //  var_dump($mailbox->subscribeMailBox(imap_utf7_encode("Archives.2018")));
     // echo "OK";
   //   $mailbox->deleteMailBox($mailbox->getServerString().".testimap");
  // echo "<pre>"; // var_dump($mailbox->getServerSpecification()); 
 //  $message = new MailBoxEmailMessageImap(921, $mailbox);   
  // var_dump($message->moveToMailBox(imap_utf7_encode("Archives.2018")));
  // var_dump($mailbox->getMailBoxDetails("Archives.2018.02"));
        }
        catch (Exception $e)
        {
            echo $e->getMessage();
        }
       return mfView::NONE;
        
    } 
}

