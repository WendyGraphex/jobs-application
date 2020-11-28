 <div class="collapse navbar-collapse" id="ftco-nav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item"><a href="/" class="nav-link">{__('Home')}</a></li>
      <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
      <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>    
      {component name="/customers_contact/contactLink" tpl="top"}
      {component name="/recruiters/postJobLink"}
      {component name="/candidates/wantJobLink"}            
      {component name="/candidates/loginLink" tpl="default"}
      {component name="/candidates/signinLink" tpl="defaultSignIn"}
    </ul>
  </div>
{*include file="./tpl/`$tpl`.tpl"*}