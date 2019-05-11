# terraform-cloudflare-template
A terraform template for managing Cloudflare DNS

Places in the code that have "1domain1" need to be replaced with your actual domain name. Most things can use the variable file to get the domain name, but a few places require it to be hard coded. 

It is named 1domain1 so that you can quickly do a replace-all and insert your domain in it's place!

To find your Cloudflare API Key, you will need to go from your main dashboard to the top right corner and click on the account dropdown and select "Profile":

![alt text](https://i.imgur.com/hglP3Nh.png "Account Profile")

Then scroll down to the bottom of the profile page to the API Keys section and press the "View" button:


![alt text](https://i.imgur.com/2ORo5OT.png "API Key View")

From there it will ask for your password to verify you are you. It will then show you your API Key. Copy this key and place it into the variables.tfvars file in the cloudflare_apikey= section.

![alt text](https://i.imgur.com/1rBXN5a.png "API Key")

----
Everything else is pretty self explanitory. A single root host "A" record is setup and will be populated by the variables.tfvars cloudflare_domain= entry. A CNAME of www is setup as well.  
If you need additional entries, you can just copy the current ones and change the necessary values to suit your needs.  
The MX records are set to Google Gmail records, but can simply be changed / modified to fit your requirements.

To use, fill out the necessary values, make sure you have [Terraform installed](https://learn.hashicorp.com/terraform/getting-started/install.html), then from the root of the folder type in:

    terraform init 
    
which will download the Cloudflare plugin and get things setup initially. Then you can type in: 

    terraform plan -var-file=variables.tfvars

If the changes look like what you are expecting, you can finalize and perform the actions by using:

    terraform apply -var-file=variables.tfvars

Thanks!