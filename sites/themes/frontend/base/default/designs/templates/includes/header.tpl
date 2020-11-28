 <div class="collapse navbar-collapse" id="ftco-nav">
    <ul class="navbar-nav ml-auto">
    {* <li class="nav-item active"><a href="/" class="nav-link">{__('Home')}</a></li>
       <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
      <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>   *} 
      {*component name="/customers_contact/contactLink" tpl="top"*}
        <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
        <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
        <li class="nav-item active"><a href="blog.html" class="nav-link">Blog</a></li>
        <li class="nav-item"><a href="about.html" class="nav-link">Academy</a></li>
        <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
        {component name="/employers/myaccountLink"}
        {component name="/employees/myaccountLink"}      
        {component name="/employers/postMissionLink" tpl="postMissionHeader"}
        {component name="/employees/wantMissionLink" tpl="wantMissionHeader"}          
 
        <div class="languagesAndCurrency">
            <div class="languages-new-class">
                {component name="/site_languages/list"}
            </div>
            <div class="devises-new-class">
                <i class="mdi mdi-currency-eur"></i>
            </div>
        </div>
    </ul>
            
            
            
            {*<div>
                        <ul class="navbar-nav ml-auto SecondUl">
                            <li class="nav-item"><a href="index.html" class="nav-link">Ftyers</a></li>
                            <li class="nav-item"><a href="about.html" class="nav-link">Loho</a></li>
                            <li class="nav-item"><a href="blog.html" class="nav-link">Illustration</a></li>
                            <li class="nav-item"><a href="contact.html" class="nav-link">Web dev</a></li>
                            <li class="nav-item"><a href="contact.html" class="nav-link">Mobile dev</a></li>
                            <li class="nav-item"><a href="contact.html" class="nav-link">WordPress</a></li>
                            <li class="nav-item"><a href="contact.html" class="nav-link">Translation</a></li>
                        </ul>
                    </div>*}
  </div>
{*include file="./tpl/`$tpl`.tpl"*}

