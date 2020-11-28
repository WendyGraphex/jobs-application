<li class="nav-item dropdown mr-1">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
              <i class="mdi mdi-message-text mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="messageDropdown">
                <p class="mb-0 font-weight-normal float-left dropdown-header">{__('%s messages',$messages->count())}</p>
              {foreach $messages as $message}
                  <a class="dropdown-item UnreadMessages">
                <div class="item-thumbnail">
                    {*<img src="{url('images/faces/face4.jpg','picture')}" alt="image" class="profile-pic"> *}
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">
                     {if !$message->isSender()}{if $message->hasEmployerUser()}{$message->getEmployerUser()->getFormatter()->getFirstname()->ucfirst()} {$message->getEmployerUser()->getFormatter()->getlastname()->ucfirst()}
                     {else}{__('Administrator')}{/if}    
                     {/if}  
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                      {$message->get('subject')|escape|truncate:40}
                  </p>
                </div>
              </a>
              {/foreach}    
             {* <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="{url('images/faces/face4.jpg','picture')}" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">David Grey
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    The meeting is cancelled
                  </p>
                </div>
              </a>
              *}
            </div>
          </li>

          <script type="text/javascript">
          
            $(function()
            {
                 $(".UnreadMessages").click(function () { 
                       return $.ajax2({                                
                                             url: "{url_to('employees_messager_ajax',['action'=>'ListMessage'])}", 
                                             target: "#page-wrapper",
                                             success : function () { 
                                                    $(".nav-item").removeClass('active');
                                                    $(".nav-item[id=800_employee_mymessages]").addClass('active'); 
                                                }
                       });
                 });
                
            }); 
    
        </script> 