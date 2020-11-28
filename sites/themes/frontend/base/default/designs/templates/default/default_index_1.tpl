<!DOCTYPE html>
<html class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths" lang=""><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
          <title>MediConnect - Home</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <meta name="apple-mobile-web-app-capable" content="no">

        {*  <link rel="apple-touch-icon" href="http://medica10.ewebsolutionskech-dev.com/images/icons/Icon60.png">
        <link rel="apple-touch-icon" sizes="76x76" href="http://medica10.ewebsolutionskech-dev.com/images/icons/Icon76.png">
        <link rel="apple-touch-icon" sizes="120x120" href="http://medica10.ewebsolutionskech-dev.com/images/icons/Icon60@2x.png">
        <link rel="apple-touch-icon" sizes="152x152" href="http://medica10.ewebsolutionskech-dev.com/images/icons/Icon76@2x.png"> *}
        <!-- Place favicon.ico in the root directory -->
        
        
        
         <link rel="stylesheet" media="all" href="{url('css/bootstrap.min.css','web','frontend')}">
         <link rel="stylesheet" media="all" href="{url('js/bootstrap.min.js','web','frontend')}">
         <link rel="stylesheet" media="all" href="{url('css/font-awesome/css/font-awesome.min.css','web','frontend')}">
         <link rel="stylesheet" media="all" href="{url('css/app_medicatablet.css','web','frontend')}"> 
         <link rel="stylesheet" media="all" href="{url('css/mystyle.css','web','frontend')}">
         <script src="{url('js/jquery.js','web','frontend')}"></script>
        
         {*<link rel="stylesheet" media="all" href="{url('css/style.css','web','frontend')}">*}
         

          {* <link rel="stylesheet" media="all" href="MediConnect%20-%20Home_fichiers/app_medicatablet.css"> *}
          <!--<link rel="stylesheet" type="text/css" href="MediConnect%20-%20Home_fichiers/bootstrap.css">-->     
         
        {* <script src="MediConnect%20-%20Home_fichiers/jquery_ujs.js"></script>
        <script src="MediConnect%20-%20Home_fichiers/modernizr-2.js"></script>
        <script src="MediConnect%20-%20Home_fichiers/main.js"></script>
        <script src="MediConnect%20-%20Home_fichiers/map.js"></script>
        <script src="MediConnect%20-%20Home_fichiers/app.js"></script> *}
        
    </head>
    <body cz-shortcut-listen="true" style="background:#fff;">
  {* <script src="MediConnect%20-%20Home_fichiers/jquery-3.js" data-turbolinks-track="true"></script> *}
    
   

   {* <script src="MediConnect%20-%20Home_fichiers/script.js" data-turbolinks-track="true"></script> *}

   

<!--------------------------header------------------------>
<!--------------------------header------------------------>

<header id="menu" class="header">
            <div class="mctx">
                <div class="navbar-header nav-top">
                    <div class="logo mlogo">
                        <div class="logo-img">
                          
                           <a href="http://medica10.ewebsolutionskech-dev.com/patient">
                               <img src="{url('css/images/logo-5f39a5c9bc03a9322ca6723415553deb98659b530e8d4c558774a1a.PNG','web','frontend')}" alt="Logo">
                           </a> 
                        </div>
                    </div>
                    <div class="search">
                        <div class="search-icon">
                          
                            <img class="img-search" src="{url('css/images/search-9da07c445e954b831233f0223d284667991fb5e5f880c54c7914e.PNG','web','frontend')}" alt="Search">

                        </div>
                        <input type="text" name="name" class="txt-search" placeholder="Recherche..." autocomplete="off">
                      <div class="search-results">
                      </div>
                    </div>
                    <div class="nav-notification">
                        <div class="notif">
                            <div class="header-icon notif-icon">
                            
                              <a href="" title="List of your favorite content" class="">
                                  <img src="{url('css/images/like.png','web','frontend')}" alt="Like">
                              </a>
                                
                            </div>
                            <div class="header-icon contact-icon">
                                <img src="{url('css/images/notification.PNG','web','frontend')}" alt="Contact">
                            </div>
                            <div class="header-icon profil-icon">
                                <div class="profil-icon-container">
                                    <div class="profil">
                                      <img src="{url('css/images/profil.PNG','web','frontend')}" alt="Profil">
                                    </div>
                                </div>
                            </div>
                             <div class="txt-profile">
                                        <a href="http://medica10.ewebsolutionskech-dev.com/app" class="txt-profile-connexion">Connexion</a><br>
                                        <a href="http://med4.ewebsolutionskech-dev.com/utilisateurs/compte/nouveau" class="txt-profile-addAcount">Créer un compte</a>
                             </div>
                        </div>
                    </div>
<div class="div-right" >
    <div class="container-right">
        <div class="dropbtn">
            <img onclick="" src="{url('css/images/be-1184aa887fa22c51a08515bc8ee4676b6e12c795da03a5ec2cbd3c765.png','web','frontend')}" alt="Be" id="ShowCountries" class="ShowCountries">
              <div class="dropbtn-title" data-lang="" id="dropbtn-title" onclick="">
                FR
            </div>
            <div class="dropdown"  style="">
            <div id="myDropdown" class="dropdown-content">
                <input type="text" placeholder="Recherch.." id="myInput" onkeyup="filterFunction()">
                <ul class="mdropdown-menu menuCol3">
                    <!-- ================country========================= -->
              <!-- Begin nav notification -->
              <li class="dropdown dropCountries">
                <a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown">
                  <span class="dropdown-title"></span>
                </a>
                <ul class="square with-triangle">
                  <li>
                    <div class="nav-dropdown-content scroll-nav-dropdown">
                      <ul class="test">
                         <li class="unread">
                            <a href="http://medica10.ewebsolutionskech-dev.com/">
                              <img src="{url('css/images/ma.PNG','web','frontend')}" alt="ma">
                              <label>Morocco</label>
                            </a>
                          </li>
                          <li class="unread">
                            <a href="http://medica10.ewebsolutionskech-dev.com/">
                              <img src="{url('css/images/fr.PNG','web','frontend')}" alt="fr">
                              <label>France</label>
                            </a>
                          </li>
                          <li class="unread">
                            <a href="http://medica10.ewebsolutionskech-dev.com/">
                              <img src="{url('css/images/eg.PNG','web','frontend')}" alt="eg">
                              <label>Egypt</label>
                            </a>
                          </li>
                           <li class="unread">
                            <a href="http://medica10.ewebsolutionskech-dev.com/">
                              <img src="{url('css/images/ma.PNG','web','frontend')}" alt="ma">
                              <label>Morocco</label>
                            </a>
                          </li>
                          <li class="unread">
                            <a href="http://medica10.ewebsolutionskech-dev.com/">
                              <img src="{url('css/images/fr.PNG','web','frontend')}" alt="fr">
                              <label>France</label>
                            </a>
                          </li>
                          <li class="unread">
                            <a href="http://medica10.ewebsolutionskech-dev.com/">
                              <img src="{url('css/images/eg.PNG','web','frontend')}" alt="eg">
                              <label>Egypt</label>
                            </a>
                          </li>       
                      </ul>
                    </div><!-- /.nav-dropdown-content scroll-nav-dropdown -->
                  </li>
                </ul>
              </li>
              <!-- End nav notification -->
                  

                </ul>
            </div>
          <!----------------Language-------------------->
          <!----------------Language-------------------->
<div id="myDropdown-title" class="dropdown-title-content main-navigation">
                <ul class="dropdown-title-menu" data-lang="fr">
            <li class="">
        <a href="http://medica10.ewebsolutionskech-dev.com/">
        <p class="dropdown-title">French</p>
        </a>
      </li>
    
                      
      <li class="">
        <a href="http://medica10.ewebsolutionskech-dev.com/">
        <p class="dropdown-title">Dutch</p>
      </a>
      </li>
    
                      
      <li class="">
        <a href="http://medica10.ewebsolutionskech-dev.com/">
        <p class="dropdown-title">English</p>
      </a>
      </li>
    
                      
      <li class="">
        <a href="http://medica10.ewebsolutionskech-dev.com/">
        <p class="dropdown-title">Russian</p>
      </a>
      </li>
    
                           
   </ul>
   </div>
          <!----------------Language-------------------->
          <!----------------Language-------------------->
                      </div>

           <!-- <img onclick="CountryFunction()" src="patient/country/usa.png"> -->
        </div>

        
                            <div class="div-medecin">
                                <div class="div-medecin-container">
                                    <div class="div-medecin-mouse">
                                        <div class="btn-medecin">
                                            <button href="#">Professionnel<br> de la santé?<br>C’est par ici !</button>
                                            <!--<img src="img/button.PNG" alt=""/>-->
                                        </div>
                                        <div class="mouse">
                                            <!--<img src="patient/mouse.PNG" alt=""/>-->
                                            <img src="{url('css/images/mouse-6ec64af25b008798307f19204ab966c6038cff7ea2a63e3938c4b0.PNG','web','frontend')}" alt="Mouse">
                                        </div>
                                    </div>
                                    <div class="icon-medecin">
                                        <!--<img src="img/photo.PNG" alt=""/>-->
                                    </div>
                                </div>
                            </div>
                              <div class="imag-medecin"> 
                          <!--  <img src="patient/photo.png" alt=""/>-->
                          <img src="{url('css/images/photo-ac030807a4a94874c8c31d6d26abee106be3561031e61cf54976dd.png','web','frontend')}" alt="Photo" style="width: 100%;">

                        </div>
                        </div>
                      
                    </div><!--End languages-->
                </div>
            </div>
        </header>
<!--------------------------header------------------------>
<!--------------------------header------------------------>
       
<!-- Latest compiled and minified JavaScript -->
<script src="MediConnect%20-%20Home_fichiers/bootstrap.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <script src="{url('css/images/app-4ca33f1f6b96be43223cc753512a78abb4fc0105da9c1583a6df0865.htm','web','frontend')}"></script>

<div class="container-page4">  
 <div class="navbar nav-bottom row">
                <nav class="navbar-nav navbar-expand-lg navbar-light bg-light">
                    <button class="navbar-toggler" type="button">
                        <span class="navbar-toggler-icon">&#9776;</span>
                    </button>
                    <div class="navbar-collapse" id="navbarSupportedContent" >
                        <button class="col-sm items" id="favbtn">Mes favoris</button>
                        <button class="col-sm items">Questionnaires de mon médecin</button>
                        <button class="col-sm items">Conseillés par des médecins</button>
                        <button class="col-sm items">Pages les plus consultée</button>
                        <button class="col-sm items">A propos de MediConnect.World</button>
                        <button class="col-sm items">Nos partenaires</button>
                        <button id="test-btn" class="col-sm items">Contact</button>
                    </div>
                </nav>
  </div>
<main id="view-home">
  <div class="lists-scrollable">
    <nav class="column-left">
      <!-- before=> root_item.children.first -->
      <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36534" title="Prévention" class="content-group" style="">
        <div class="image" style="">
          <img alt="" src="{url('css/images/Info.htm','web','frontend')}">
        </div>
        <section class="title">
          <h1 class="">Prévention</h1>
            <p>test santé, cancer, tabac, alcool,...</p>
        </section>
        <p class="arrow" style="">Arrow</p>
      </a>
      <!-- before=> root_item.children.first -->
      <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35951" title="News" class="content-group" style="border-color:;">
        <div class="image" style="border-color:;">
          <img alt="" src="MediConnect%20-%20Home_fichiers/01-actuality.htm">
        </div>
        <section class="title  ">
          <h1 class="">News</h1>
            <p>autorités, scientifiques, presse médicale</p>
        </section>
        <p class="arrow" style="background-color:;">Arrow</p>
      </a>
      <!-- before=> root_item.children.first -->
      <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36528" title="Accès aux soins de santé" class="content-group" style="border-color:;">
        <div class="image" style="border-color:;">
          <img alt="" src="">
        </div>
        <section class="title  ">
          <h1 class="">Accès aux soins de santé</h1>
            <p>questionnaire, médecins, hôpitaux, pharmacie de garde</p>
        </section>
        <p class="arrow" style="background-color:;">Arrow</p>
      </a>
      <!-- before=> root_item.children.first -->
      <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36571" title="Infos classées par maladie/pathologie" class="content-group" style="border-color:;">
        <div class="image" style="border-color:;">
          <img alt="" src="">
        </div>
        <section class="title  ">
          <h1 class="centered">Infos classées par maladie/pathologie</h1>
        </section>
        <p class="arrow" style="">Arrow</p>
      </a>
      <!-- before=> root_item.children.first -->
      <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35964" title="Médicaments et traitements" class="content-group" style="border-color:;">
        <div class="image" style="border-color:;">
          <img alt="" src="MediConnect%20-%20Home_fichiers/producten_copie.htm">
        </div>
        <section class="title  ">
          <h1 class="">Médicaments et traitements</h1>
            <p>prix, pharmacovigilance, notices scientifiques, remboursement</p>
        </section>
        <p class="arrow" style="background-color:;">Arrow</p>
      </a>
      <!-- before=> root_item.children.first -->
      <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35977" title="Liens utiles et pratiques" class="content-group" style="border-color:#29af27;">
        <div class="image" style="border-color:#29af27;">
          <img alt="" src="MediConnect%20-%20Home_fichiers/05-web.htm">
        </div>
        <section class="title  ">
          <h1 class="centered">Liens utiles et pratiques</h1>
        </section>
        <p class="arrow" style="background-color:#29af27;">Arrow</p>
      </a>
    </nav>
    <div class="column-right">
      <div class="row-scrollable">
        <div class="scroll" style="width: 2628px;">
        
<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36534" title="Test santé" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Test santé</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36534"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35992" title="Cancer" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/oncologie.htm">
    </div>
    <section class="title ">
      <h1>Cancer</h1>
      <p>dépistage, signaux, examens,...</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35992"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35988" title="Tabac" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Tabagisme.htm">
    </div>
    <section class="title ">
      <h1>Tabac</h1>
      <p>sevrage, aide,...</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35988"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35989" title="Alcool" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Alcool</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35989"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35990" title="MST et IST" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>MST et IST</h1>
      <p>Maladie sexuellement transmissible</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35990"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36525" title="Diabète" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Diabète</h1>
      <p>régime</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36525"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36526" title="Vaccination" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Injection.htm">
    </div>
    <section class="title ">
      <h1>Vaccination</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36526"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36548" title="Cardio-vasculaire" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Cardiology.htm">
    </div>
    <section class="title ">
      <h1>Cardio-vasculaire</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36548"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36552" title="Burn-out" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Burn-out</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36552"></a>
</section>

        </div>
      </div>
      <div class="row-scrollable">
        <div class="scroll" style="width: 2920px;">
        
<section class="content-cell" style="border-color:;">
  <a href="https://www.sciensano.be/fr" title="Toute une vie en bonne santé" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Sciensano.htm">
    </div>
    <section class="title long-name">
      <h1>Toute une vie en bonne santé</h1>
      <p>multitude d’informations de santé</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35951"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://www.vivasante.be/" title="Viva Santé" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Viva_Sant.htm">
    </div>
    <section class="title ">
      <h1>Viva Santé</h1>
      <p> journal du patient</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35953"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://www.msdmanuals.com/fr/Les" title="Manuels MSD" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Manuels_MSD.htm">
    </div>
    <section class="title ">
      <h1>Manuels MSD</h1>
      <p>la médecine la plus puissante est la connaissance</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36614"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://www.pharmacie.be/actualites" title="Pharmacie.be" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Pharmacie.htm">
    </div>
    <section class="title ">
      <h1>Pharmacie.be</h1>
      <p>actualités</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35967"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://www.apb.be/fr/corp/Pages/default.aspx" title="Association Pharmaceutique Belge" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/A.htm">
    </div>
    <section class="title long-name">
      <h1>Association Pharmaceutique Belge</h1>
      <p>développer, valoriser et soutenir l'expertise du pharmacien </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35969"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://www.ehealth.fgov.be/fr/patients" title="e-Santé" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/eSant.htm">
    </div>
    <section class="title ">
      <h1>e-Santé</h1>
      <p>portail des services de l'e-Santé</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35970"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://www.ssmg.be/actualites/" title="Les dernières actus de la SSMG" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/SSMG.htm">
    </div>
    <section class="title long-name">
      <h1>Les dernières actus de la SSMG</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36553"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://lepatient.ca/index.php" title="Le Patient" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Le_Patient.htm">
    </div>
    <section class="title ">
      <h1>Le Patient</h1>
      <p>magazine de tous les professionnels de la santé</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36645"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://fr.medipedia.be/" title="MediPedia" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/MEDIPEDIA.htm">
    </div>
    <section class="title ">
      <h1>MediPedia</h1>
      <p>actualités pour les patients</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36868"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://www.vulgaris-medical.com/actualite-sante" title="Vulgaris Médical" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/vulgaris-medical.htm">
    </div>
    <section class="title ">
      <h1>Vulgaris Médical</h1>
      <p>connaissance médicale dans un langage accessible à tous</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="37099"></a>
</section>

        </div>
      </div>
      <div class="row-scrollable">
        <div class="scroll" style="width: 1168px;">
        
<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36528" title="Questionnaire médicaux" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title long-name">
      <h1>Questionnaire médicaux</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36528"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36529" title="Médecins" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Médecins</h1>
      <p>prise de rendez-vous, diagnostic online</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36529"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36531" title="Hôpitaux" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Hôpitaux</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36531"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://www.pharmacie.be/" title="Pharmacie de garde" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Pharmacie de garde</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36530"></a>
</section>

        </div>
      </div>
      <div class="row-scrollable">
        <div class="scroll" style="width: 3212px;">
        
<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36571" title="Cardiologie" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Cardiology.htm">
    </div>
    <section class="title ">
      <h1>Cardiologie</h1>
      <p>AVC, angine de poitrine, arythmie,...</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36571"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36573" title="Neurologie" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/neurologie.htm">
    </div>
    <section class="title ">
      <h1>Neurologie</h1>
      <p>Epilepsies, Parkinson, Alzheimer,...</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36573"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36574" title="Dermatologie" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Dermatologie.htm">
    </div>
    <section class="title ">
      <h1>Dermatologie</h1>
      <p>Mycoses, herpès, eczéma,...</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36574"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36622" title="Gastroentérologie" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Gastrology.htm">
    </div>
    <section class="title ">
      <h1>Gastroentérologie</h1>
      <p>syndrome du côlon irritable, maladie de Crohn, Gastro-entérite,...</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36622"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36625" title="Gynécologie" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/mithraHygieneIntime.htm">
    </div>
    <section class="title ">
      <h1>Gynécologie</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36625"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36967" title="Hépatologie" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Hépatologie</h1>
      <p>hépatite, cirrhose, jaunisse, calcul biliaire,...</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36967"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36626" title="Pneumologie" class="item" target="_self">
    <div class="image" style="">
      <img alt="" src="MediConnect%20-%20Home_fichiers/pneumologie.htm">
    </div>
    <section class="title ">
      <h1>Pneumologie</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36626"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36623" title="Ophtalmologie" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Ophtalmologie</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36623"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36581" title="Maladies rares" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>Maladies rares</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36581"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36635" title="Cancer" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/oncologie.htm">
    </div>
    <section class="title ">
      <h1>Cancer</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36635"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36637" title="ORL" class="item" target="_self">
    <div class="image" style="border-color:;">
      <img alt="" src="">
    </div>
    <section class="title ">
      <h1>ORL</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36637"></a>
</section>

        </div>
      </div>
      <div class="row-scrollable">
        <div class="scroll" style="width: 1460px;">
        
<section class="content-cell" style="border-color:;">
  <a href="https://www.afmps.be/fr/usage_humain" title="Agence Fédérale des Médicaments et des Produits de Santé" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/afmps.htm">
    </div>
    <section class="title long-name">
      <h1>Agence Fédérale des Médicaments et de...</h1>
      <p>vos médicaments et produits de santé</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35964"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://www.cbip.be/fr/start" title="Centre belge d'information pharmacothérapeutique" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/cbip.htm">
    </div>
    <section class="title long-name">
      <h1>Centre belge d'information pharmacoth...</h1>
      <p>prix des médicaments</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35980"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://www.pharmacie.be/medicaments" title="Pharmacie.be" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Pharmacie.htm">
    </div>
    <section class="title ">
      <h1>Pharmacie.be</h1>
      <p>généralités </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35981"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="http://www.riziv.fgov.be/fr/professionnels/autres/mutualites/Pages/contactez-mutualites.aspx#.VfGGv2S8PGc" title="Les caisses d'assurance maladie" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/06-RIZIV-INAMI.htm">
    </div>
    <section class="title long-name">
      <h1>Les caisses d'assurance maladie</h1>
      <p> remboursements</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="35947"></a>
</section>

<section class="content-cell" style="border-color:;">
  <a href="https://www.e-notice.be/" title="e-notice.be" class="item" target="_blank">
    <div class="image" style="border-color:;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/e-notice.htm">
    </div>
    <section class="title ">
      <h1>e-notice.be</h1>
      <p>tout sur le médicament recherché</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: " data-id="36564"></a>
</section>

        </div>
      </div>
      <div class="row-scrollable">
        <div class="scroll" style="width: 1460px;">
        
<section class="content-cell" style="border-color:#29af27;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35977" title="Associations de patients" class="item" target="_self">
    <div class="image" style="border-color:#29af27;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/gynaecologie_copie.htm">
    </div>
    <section class="title long-name">
      <h1>Associations de patients</h1>
      <p>Ligue</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: #29af27" data-id="35977"></a>
</section>

<section class="content-cell" style="border-color:#29af27;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35975" title="Renseignements pratiques" class="item" target="_self">
    <div class="image" style="border-color:#29af27;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Farmacy.htm">
    </div>
    <section class="title long-name">
      <h1>Renseignements pratiques</h1>
      <p>hôpitaux, assurance, aides,...</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: #29af27" data-id="35975"></a>
</section>

<section class="content-cell" style="border-color:#29af27;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35976" title="Autorités " class="item" target="_self">
    <div class="image" style="border-color:#29af27;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/mutualiteiten.htm">
    </div>
    <section class="title ">
      <h1>Autorités </h1>
      <p>en matière de soins</p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: #29af27" data-id="35976"></a>
</section>

<section class="content-cell" style="border-color:#29af27;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/35978" title="Numéros d'urgence" class="item" target="_self">
    <div class="image" style="border-color:#29af27;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/Contact.htm">
    </div>
    <section class="title ">
      <h1>Numéros d'urgence</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: #29af27" data-id="35978"></a>
</section>

<section class="content-cell" style="border-color:#29af27;">
  <a href="http://medica10.ewebsolutionskech-dev.com/patient/items/36556" title="Mutuelles" class="item" target="_self">
    <div class="image" style="border-color:#29af27;">
      <img alt="" src="MediConnect%20-%20Home_fichiers/mutualiteiten_002.htm">
    </div>
    <section class="title ">
      <h1>Mutuelles</h1>
      <p> </p>
    </section>
  </a>
  <a href="#" class="favorite icon-icon-favorite " style="color: #29af27" data-id="36556"></a>
</section>

        </div>
      </div>
    </div>
  </div>

 <!-- <select>
 <option value=""></option> 
  </select>

  <select>
  <option value=""></option> 
  </select>

<select>
  
  <option value=""></option>

</select> -->
  

<footer class="sticky-footer">
<!--
  <ul>
  </ul> -->
  
<!-- Begin Collapse menu nav -->
   <!--   <div class="collapse navbar-collapse" id="main-fixed-nav">
        <ul class="nav navbar-nav navbar-left">
          <!-- Begin nav notification -->
      <!--    <li class="dropdown">
            <a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown">
              <span class="dropdown-title"></span>
            </a>
            <ul class="dropdown-menu square with-triangle">
              <li>
                <div class="nav-dropdown-heading">
                  Select country
                </div><!-- /.nav-dropdown-heading -->
         <!--       <div class="nav-dropdown-content scroll-nav-dropdown">
                  <ul>
                  </ul>
                </div><!-- /.nav-dropdown-content scroll-nav-dropdown -->
        <!--      </li>
            </ul>
          </li>
          <!-- End nav notification -->
          
         
          
          <!-- Begin nav notification -->
     <!--     <li class="dropdown">
            <a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown">
              <span class="dropdown-title"></span>
            </a>
            <ul class="dropdown-menu square with-triangle">
              <li>
                <div class="nav-dropdown-heading">
                  Select language
                </div><!-- /.nav-dropdown-heading -->
            <!--    <div class="nav-dropdown-content scroll-nav-dropdown">
                  <ul>
                  </ul>
                </div><!-- /.nav-dropdown-content scroll-nav-dropdown -->
          <!--    </li>
            </ul>
          </li>
          <!-- End nav notification -->
    <!--    </ul>
      </div> --><!-- /.navbar-collapse -->
      <!-- End Collapse menu nav -->
    <section id="list-icons">
    </section>
    <div id="banners">
</div>

  
 </footer>

 <script type="text/javascript">
    
    </script>

</main>
        

        {* <script src="MediConnect%20-%20Home_fichiers/jquery.js"></script>
<script src="MediConnect%20-%20Home_fichiers/jquery_ujs.js"></script>
<script src="MediConnect%20-%20Home_fichiers/modernizr-2.js"></script>
<script src="MediConnect%20-%20Home_fichiers/main.js"></script>
<script src="MediConnect%20-%20Home_fichiers/map.js"></script>
<script src="MediConnect%20-%20Home_fichiers/app.js"></script> *}
    

</body></html>
