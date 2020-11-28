<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Graphex Academy</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' href="{url('/css/academy/main.css','web')}">    
        <link rel="stylesheet" href="{url('/css/bootstrap/4.5.0/bootstrap.min.css','web')}">        
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet"> 
        <script src="https://use.fontawesome.com/9f6e65beb0.js"></script>
    </head>
    <body>
        <!--Main Navigation-->
        <header>
            <div class="nav-top">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-sm-6 col-md-6 col-12">
                            <a class="navbar-brand" href="#"><img cclass="img-responsive" src="{url('/pictures/academy/logo.jpg','web')}">Graphex Academy</a>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-md-6 col-12">
                            <form class="form-inline">
                                <div class="input-group search-bar">
                                    <input id="search" type="text" placeholder=" &#xF002; Enter keyword" class="form-control">
                                    <button class="btn btn-primary ml-2 my-sm-0" type="submit">Search</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-4 col-sm-6 col-md-6 col-12 buttons">
                            <ul class="links">
                                {component name="/cms_pages/nodeUrl" page="academy_home_learn"}
                                {component name="/cms_pages/nodeUrl" page="academy_home_teach"}
                            </ul>
                        </div>
                        <div class="col-lg-2 col-sm-6 col-md-6 col-12 buttons">
                            <ul class="button-group">
                                <li>
                                    <button class="btn btn-primary rounded-button" type="submit">Log In </button>
                                </li>
                                <li>
                                    <button class="btn btn-primary rounded-button" type="submit">Sign Up</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <nav class="navbar navbar-expand-lg navbar-light navbar-bg">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse bordred-nav" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Development</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"> IT & Software </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"> Design </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"> Photography </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"> Videography </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"> Marketing </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"> Business </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- End Main Navigation-->

         <section class="ftco-section bg-light sectionMarginTop">
            <div class="page-wrap d-flex flex-row align-items-center">
                <div class="container">
                    {eval $page_i18n->get('content')}                                                 
                </div>   
            </div>
        </section>
         

        <!-- Unlimited Access -->
        {component name="/cms_pages/pageDisplay" page="academy_home_offers"}

       
         
        <!--Reviews-->
        <section class="reviews">
            <div class="container-fluid">
                <h2>Reviews</h2>
                <div class="row review">
                    <div class="col-lg-4 col-sm-12 mb-5">
                        <div class="review-box">
                            <p>“ I have only scratched the surface
                                in this ever evolving field
                                but know that
                                the technological potential is limitless.”</p>
                            <h3>Adam Smith</h3>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 mb-5">
                        <div class="review-box">
                            <p>“ I have only scratched the surface
                                in this ever evolving field
                                but know that
                                the technological potential is limitless.”</p>
                            <h3>Adam Smith</h3>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 mb-5">
                        <div class="review-box">
                            <p>“ I have only scratched the surface
                                in this ever evolving field
                                but know that
                                the technological potential is limitless.”</p>
                            <h3>Adam Smith</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Reviews-->

        <!--Suscribe-->
        {component name="/customers_newsletter/academySignIn"}
        <!-- End Suscribe-->

        <!-- Footer -->
        <footer>

            {include file="./../includes/footer-academy.tpl"}



            {**}
        </footer>
        <!-- End Footer -->

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

