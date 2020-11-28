{component name="/dashboard/sublink"}
{messages}
<h3>{__("Information")}</h3>
<div>
{__('Site space')}:{format_size($system_site->getFolderSize())}
</div>
<div>
{__('Database space')}:{format_size($system_site->getDatabaseSize())}
</div>