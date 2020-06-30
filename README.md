# terraform-cloudflare-template
A terraform template for managing Cloudflare DNS

Places in the code that have "1domain1" can to be replaced with your actual domain name if you are going to be managing multiple domains. Most things can use the variable file to get the domain name, but a few places require hard coded input.  I found it easier to just have a DNS folder and then a folder for each domain to manage them separetly as there is not many times when I need to make changes to many at once, even if I did, it would not take long to just run through each one. That is up to your personal situation, though. 

It is named 1domain1 so that you can quickly do a replace-all and insert your domain in it's place!

---

Everything else is pretty self explanitory. A single root host "A" record is setup and will be populated by the variables.tfvars cloudflare_domain= entry. A CNAME of www is setup as well.  
If you need additional entries, you can just copy the current ones and change the necessary values to suit your needs.  
The MX records are set to Google Gmail records, but can simply be changed / modified to fit your requirements.

To use, fill out the necessary values, make sure you have [Terraform installed](https://learn.hashicorp.com/terraform/getting-started/install.html), then from the root of the folder type in:

    terraform init 
    
which will download the Cloudflare plugin and get things setup initially. Then you can type in: 

    terraform plan --var-file=variables.tfvars

If the changes look like what you are expecting, you can finalize and perform the actions by using:

    terraform apply --var-file=variables.tfvars

Do note that the first time you run apply it will create the DNS zone within Cloudflare but will not apply the zone records. You may have to wait a few minutes for everything to be created on their side. Once the domain zone is created, go look at your Cloudflare account for the new domain and open it's dashboard. It will give you your assigned DNS Nameservers. These will need to be input into your domains registrar to point your name to Cloudflare. Once this is completed you should be able to run ```terraform apply``` again for it to create the actual records.

Thanks!

---

To find your Cloudflare API Key, you will need to go from your main dashboard to the top right corner and click on the account dropdown and select "Profile":

![alt text](https://i.imgur.com/hglP3Nh.png "Account Profile")

Then scroll down to the bottom of the profile page to the API Keys section and press the "View" button:


![alt text](https://i.imgur.com/2ORo5OT.png "API Key View")

From there it will ask for your password to verify you are you. It will then show you your API Key. Copy this key and place it into the variables.tfvars file in the cloudflare_apikey= section.

![alt text](https://i.imgur.com/1rBXN5a.png "API Key")

----


![alt text](https://i.imgur.com/cg5ow2M.png "API Key")
