<html class="" lang="">
    <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
          <title>MediConnect - Home</title>
          <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta name="apple-mobile-web-app-capable" content="no">

        {*<link rel="apple-touch-icon" href="http://medica10.ewebsolutionskech-dev.com/images/icons/Icon60.png">
        <link rel="apple-touch-icon" sizes="76x76" href="http://medica10.ewebsolutionskech-dev.com/images/icons/Icon76.png">
        <link rel="apple-touch-icon" sizes="120x120" href="http://medica10.ewebsolutionskech-dev.com/images/icons/Icon60@2x.png">
        <link rel="apple-touch-icon" sizes="152x152" href="http://medica10.ewebsolutionskech-dev.com/images/icons/Icon76@2x.png">
        <!-- Place favicon.ico in the root directory -->
         <link rel="stylesheet" media="all" href="{url('css/bootstrap/4.1.3/bootstrap.min.css','web')}">
         <link rel="stylesheet" media="all" href="MediConnect%20-%20Home_fichiers/css/awesome/4.7.0/css/font-awesome.css">
*}
        {*  <link rel="stylesheet" media="all" href="MediConnect%20-%20Home_fichiers/app_medicatablet.css">*}
          <!--<link rel="stylesheet" type="text/css" href="MediConnect%20-%20Home_fichiers/bootstrap.css">-->
    {*    <meta name="csrf-param" content="authenticity_token">
        <meta name="csrf-token" content="BWECtajvAX+MbqLrBudYlxB5hH+7eL/jsyfSulQbFD16EJ8VoN3+dhMD1hhbz5Soap3mkzsBBIpWYIQUSoTjrQ==">
        <script src="MediConnect%20-%20Home_fichiers/jquery.js"></script>
        <script src="MediConnect%20-%20Home_fichiers/jquery_ujs.js"></script>
        <script src="MediConnect%20-%20Home_fichiers/modernizr-2.js"></script>
        <script src="MediConnect%20-%20Home_fichiers/main.js"></script>
        <script src="MediConnect%20-%20Home_fichiers/map.js"></script>
        <script src="MediConnect%20-%20Home_fichiers/app.js"></script>*}
        
        
        
        <link rel="stylesheet" media="all" href="{url('css/bootstrap/4.1.3/bootstrap.min.css','web')}">
        <link rel="stylesheet" href="css/glyphicons.css">
         <link rel="stylesheet" href="{url('css/awesome/5.7.2/css/all.css','web')}">
        <script src="{url('js/jquery/3.3.1/jquery-3.3.1.min.js','web')}"></script>
        <script src="{url('js/bootstrap/4.1.3/bootstrap.min.js','web')}"></script>
        <link rel="stylesheet" media="all" href="{url('css/style.css','web','admin')}">
        
    </head>
    <body>
    <div class="">
     <header id="menu" class="login-navbar w-100">
        <table class="w-100">
            <tr>
                <td class="pl-3 pb-2">
                  <a href="" title="Return to home page" class="home"><img src="{url("/pictures/icon/home.png","web")}"></a>
                </td>
                <td class="w-25 hide-xs pb-1">  
                   <a href="" ><img alt="" class="logo"  src="{url("/pictures/Cardio-Connect-logo-480x80.png","web")}"></a>
                </td>
                <td class="text-light"> 
                    <a href="" ><span class="input-group-text icon text-light far fa-heart border-0 change-content position-absolute" id="basic-addon1" ></span></a>
                    <form class="search d-inline-block ml-5 mr-3 w-50" action="#" method="post">
                          <div class="input-group">
                              <input class="form-control form-search input-sm text-black border-0 pl-5" style="" type="text" name="name" placeholder="Search colleagues, link or content" autocomplete="off"  aria-describedby="basic-addon1">
                          </div>
                          <div class="search-results"></div>
                    </form>
                    <div class="notification-icon d-inline-block" id="btnnotif">
                      <span class="text-light  border-0 p-3" id="basic-addon1" style="background: transparent url(web/pictures/icon/notification.png) no-repeat center center;width: 32px;
                      height: 32px;cursor:pointer;"></span>
                      <section class="dropdown-box hide" id="notif">
                        <div class="dropdown">
                          <header>
                            {__('Notifications')}
                          </header>
                          <p class="loader">{__('loader')}</p>
                        </div>
                      </section>
                    </div>
                </td>                
                <td class="text-light hide-xs" >
                    <span class="settings-icon float-right pr-1 user-name">
                      <p id="showlist">aziz aziz</p>
                      <div class="dropdown-box2 hide" id="dropdown-box2">
                          <ul class="dropdown2">
                              <li><a href="{url('/','','admin')}" class="link-banner">{__('Admin')}</a></li>
                            <li><a href="" class="link-banner">{__('Profile')}</a></li>
                            <li><a rel="nofollow" data-method="delete" href="{url('/','','admin')}logout" class="link-banner">{__('Log out')}</a></li>
                          </ul>
                      </div>
                    </span>
                </td>
            </tr>   
        </table>
   </header>
    
<div class="container1 mt-5">
    <div class="row sectionContents pt-1 pl-1 ml-2" style="overflow:hidden;">
        <div class="col-lg-4  col-md-4 col-sm-4 col-xs-12 Sec1 border-1 heightLeftSection section pl-0">
          <a href="" title="Cardiologue" class="content-group title-link">
            <div class="cardiologue">
                    <div class="image float-left w-25 mr-3">
                      <img alt="" class="h-100 border-right" src="{url("/pictures/cardiologue.png","web")}">
                    </div>
                    <section class="title h6 pt-3 h-100">
                        Cardiologue
                        <small><p>infos et services concernant votre spécialité</p></small> 
                    </section>
                    <p class="arrow float-right position-absolute h-100 text-center">
                        <img src="{url("/pictures/icon/row-right1.png","web")}" class="mt-4">
                    </p>
            </div>    
          </a>
        </div>
        <div class="col-lg-8  col-md-8 col-sm-8 Sec2 hide-xs" >
          <div  class="row-scrollable">
          <table>
            <tr>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group title-link" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-right" src="{url("/pictures/actuality.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group" style="">
                              <div class="image float-left w-25 mr-3">
                                <img alt="" class="h-100 border-right" src="{url("/pictures/LienNeuro.png","web")}">
                              </div>
                              <section class="title h6 pt-3 float-left">
                                  Actualités
                                  <small><p>presse scientifique</p></small> 
                              </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group" style="">
                              <div class="image float-left w-25 mr-3">
                                <img alt="" class="h-100 border-right" src="{url("/pictures/calendar.png","web")}">
                              </div>
                              <section class="title h6 pt-3 float-left">
                                  Actualités
                                  <small><p>presse scientifique</p></small> 
                              </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td >
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-1" src="pictures/cardiologue.png">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
            </tr> 
          </table>
          </div>
        </div>
    </div>
<!-- row 2 -->
    <div class="row sectionContents pt-1 pl-1 ml-2" style="overflow:hidden;">
        <div class="col-lg-4  col-md-4 col-sm-4 col-xs-12 Sec1 border-1 heightLeftSection section pl-0">
          <a href="" title="Cardiologue" class="content-group title-link">
            <div class="cardiologue">
                    <div class="image float-left w-25 mr-3">
                      <img alt="" class="h-100 border-right" src="{url("/pictures/cardiologue.png","web")}">
                    </div>
                    <section class="title h6 pt-3 h-100">
                        Cardiologue
                        <small><p>infos et services concernant votre spécialité</p></small> 
                    </section>
                    <p class="arrow float-right position-absolute h-100 text-center">
                        <img src="{url("/pictures/icon/row-right1.png","web")}" class="mt-4">
                    </p>
            </div>    
          </a>
        </div>
        <div class="col-lg-8  col-md-8 col-sm-8 Sec2 hide-xs" >
          <div  class="row-scrollable">
          <table>
            <tr>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group title-link" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-right" src="{url("/pictures/actuality.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group" style="">
                              <div class="image float-left w-25 mr-3">
                                <img alt="" class="h-100 border-right" src="{url("/pictures/LienNeuro.png","web")}">
                              </div>
                              <section class="title h6 pt-3 float-left">
                                  Actualités
                                  <small><p>presse scientifique</p></small> 
                              </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group" style="">
                              <div class="image float-left w-25 mr-3">
                                <img alt="" class="h-100 border-right" src="{url("/pictures/calendar.png","web")}">
                              </div>
                              <section class="title h6 pt-3 float-left">
                                  Actualités
                                  <small><p>presse scientifique</p></small> 
                              </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td >
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
            </tr> 
          </table>
          </div>
        </div>
    </div>
    <!-- row 3 -->
    <div class="row sectionContents pt-1 pl-1 ml-2" style="overflow:hidden;">
        <div class="col-lg-4  col-md-4 col-sm-4 col-xs-12 Sec1 border-1 heightLeftSection section pl-0">
          <a href="" title="Cardiologue" class="content-group title-link">
            <div class="cardiologue">
                    <div class="image float-left w-25 mr-3">
                      <img alt="" class="h-100 border-right" src="{url("/pictures/cardiologue.png","web")}">
                    </div>
                    <section class="title h6 pt-3 h-100">
                        Cardiologue
                        <small><p>infos et services concernant votre spécialité</p></small> 
                    </section>
                    <p class="arrow float-right position-absolute h-100 text-center">
                        <img src="{url("/pictures/icon/row-right1.png","web")}" class="mt-4">
                    </p>
            </div>    
          </a>
        </div>
        <div class="col-lg-8  col-md-8 col-sm-8 Sec2 hide-xs" >
          <div  class="row-scrollable">
          <table>
            <tr>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group title-link" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-right" src="{url("/pictures/actuality.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group" style="">
                              <div class="image float-left w-25 mr-3">
                                <img alt="" class="h-100 border-right" src="{url("/pictures/LienNeuro.png","web")}">
                              </div>
                              <section class="title h6 pt-3 float-left">
                                  Actualités
                                  <small><p>presse scientifique</p></small> 
                              </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group" style="">
                              <div class="image float-left w-25 mr-3">
                                <img alt="" class="h-100 border-right" src="{url("/pictures/calendar.png","web")}">
                              </div>
                              <section class="title h6 pt-3 float-left">
                                  Actualités
                                  <small><p>presse scientifique</p></small> 
                              </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td >
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25 mr-3">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
            </tr> 
          </table>
          </div>
        </div>
    </div>

        <!-- row 3 -->
   <div class="row sectionContents pt-1 pl-1 ml-2" style="overflow:hidden;">
        <div class="col-lg-4  col-md-4 col-sm-4 col-xs-12 Sec1 border-1 heightLeftSection section pl-0">
          <a href="" title="Cardiologue" class="content-group title-link">
            <div class="cardiologue">
                    <div class="image float-left w-25">
                      <img alt="" class="h-100 border-right" src="{url("/pictures/cardiologue.png","web")}">
                    </div>
                    <section class="title h6 pt-3 h-100">
                        Cardiologue
                        <small><p>infos et services concernant votre spécialité</p></small> 
                    </section>
                    <p class="arrow float-right position-absolute h-100 text-center">
                        <img src="{url("/pictures/icon/row-right1.png","web")}" class="mt-4">
                    </p>
            </div>    
          </a>
        </div>
        <div class="col-lg-8  col-md-8 col-sm-8 Sec2 hide-xs" >
          <div  class="row-scrollable">
          <table>
            <tr>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group title-link" style="">
                            <div class="image float-left w-25">
                              <img alt="" class="h-100 border-right" src="{url("/pictures/actuality.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group" style="">
                              <div class="image float-left w-25">
                                <img alt="" class="h-100 border-right" src="{url("/pictures/cardiologue.png","web")}">
                              </div>
                              <section class="title h6 pt-3 float-left">
                                  Actualités
                                  <small><p>presse scientifique</p></small> 
                              </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                      <div class="cardiologue">
                            <a href="" title="Cardiologue" class="content-group" style="">
                              <div class="image float-left w-25">
                                <img alt="" class="h-100 border-right" src="{url("/pictures/cardiologue.png","web")}">
                              </div>
                              <section class="title h6 pt-3 float-left">
                                  Actualités
                                  <small><p>presse scientifique</p></small> 
                              </section>
                            </a>
                            <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                      </div>    
                  </div>
                </td >
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
                <td>
                  <div class="border-1 sizeSection section ml-2">
                    <div class="cardiologue">
                          <a href="" title="Cardiologue" class="content-group" style="">
                            <div class="image float-left w-25">
                              <img alt="" class="h-100 border-1" src="{url("/pictures/cardiologue.png","web")}">
                            </div>
                            <section class="title h6 pt-3 float-left">
                                Actualités
                                <small><p>presse scientifique</p></small> 
                            </section>
                          </a>
                          <a href="" class="float-right icon-link"><span class="input-group-text icon far fa-heart border-0 icon-heart change-content" id="basic-addon1" style="color:#f294cd;"></span></a>
                    </div>    
                  </div>
                </td>
            </tr> 
          </table>
          </div>
        </div>
    </div>
    </div>
</div>
    <footer class="fixed-bottom home-footer">
      <section id="list-icons" class="text-center m-3">
        <!-- lien med3 -->
        <a href="" class="icon">
          <img src="{url("/pictures/logo_new_Daiichi-Sankyo.png","web")}" class="w-100" alt="Logo new daiichi sankyo">
        </a>
        <!-- lien med3 -->
        <a href="" class="icon">
          <img src="{url("/pictures/BSC_Logo.png","web")}" alt="Bsc logo" class="w-100">
        </a>
        <!-- lien med3 -->
        <a href="" class="icon">
          <img src="{url("/pictures/Pubmedhealth.png","web")}" alt="Pubmedhealth" class="w-100">
        </a>
        <!-- lien med3 -->
        <a href="" class="icon" target="_blank">
          <img src="{url("/pictures/bcfi.png","web")}" alt="Bcfi" class="w-100">
        </a>
        <!-- lien med3 -->
        <a href="" class="icon">
          <img src="{url("/pictures/Logo-MediConnect-2.png","web")}" alt="Logo mediconnect 2" class="w-100">
        </a>
      </section>
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block w-100" src="{url("/pictures/2016-10-Daiichi-Banner-Lixiana-DEF2.png","web")}" alt="">
          </div>
          <div class="carousel-item">
            <a href="" class="link-banner" target="_blank">2018 09 banner asean congres 2018</a>
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="{url("/pictures/2016-10-Daiichi-Banner-Lixiana-DEF2.png","web")}" alt="">
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="{url("/pictures/2017-08-Banner-Info_CardioConnect_FR.png","web")}" alt="">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <button id="prev_image" class="previous_btn border-0">❮</button>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <button id="next_image" class="next_btn border-0" >❯</button>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </footer>
</div>
</body>
</html>


    <script type="text/javascript">

  $(document).ready(function() {

      $( ".change-content" )
        .mouseenter(function() {
          $(this).removeClass('far');
             
            }, function() {
               $(this).addClass('fa');
            })
        .mouseleave(function() {
           $(this).removeClass('fa');
            })

      $('#btnnotif').click(
             function(){ $("#notif").toggle();
              });
      $('#showlist').click(
             function(){ $("#dropdown-box2").toggle();
              });

});
    </script>