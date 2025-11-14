# ICT171 Cloud Server Project Setup
# Student: Abhan Aziz

# 1. SSH into the VM
`chmod 600 assignment2_key.pem`
`ssh -i "assignment2_key.pem" azureuser@4.247.144.67`

# 2. Update and Upgrade Ubuntu
`sudo apt update`
`sudo apt upgrade -y`

# 3. Install Apache2 Web Server
`sudo apt install apache2 -y`
`sudo systemctl enable apache2`
`sudo systemctl start apache2`
`sudo systemctl status apache2`

# 4. Deploy Website HTML Files
# Option A: Edit directly
`sudo nano /var/www/html/index.html`
# Paste your HTML code here

# Option B: Copy from local machine to VM
`scp -i assignment2_key.pem -r website/* azureuser@4.247.144.67:/var/www/html/`

# Set permissions
`sudo chown -R www-data:www-data /var/www/html`
`sudo chmod -R 755 /var/www/html`

# 5. Install Snap & Certbot for SSL
`sudo apt install snapd -y`
`sudo snap install core`
`sudo snap refresh core`
`sudo snap install --classic certbot`
`sudo ln -s /snap/bin/certbot /usr/bin/certbot`

# 6. Enable SSL Module in Apache
`sudo a2enmod ssl`
`sudo systemctl restart apache2`
`sudo apache2ctl configtest`

# 7. Obtain SSL Certificate with Certbot
`sudo certbot --apache`

# 8. Verify SSL & Restart Apache
`sudo apache2ctl configtest`
`sudo systemctl restart apache2`

# Test automatic renewal
`sudo certbot renew --dry-run`

# 9. Optional: Manual SSL Configuration
`sudo nano /etc/apache2/sites-available/abhansworkshop-ssl.conf`
# Paste the following:
# <VirtualHost *:443>
#     ServerName abhansworkshop.com
#     ServerAlias www.abhansworkshop.com
#     DocumentRoot /var/www/html
# 
#     SSLEngine on
#     SSLCertificateFile /etc/letsencrypt/live/abhansworkshop.com/fullchain.pem
#     SSLCertificateKeyFile /etc/letsencrypt/live/abhansworkshop.com/privkey.pem
# </VirtualHost>

`sudo a2ensite abhansworkshop-ssl.conf`
`sudo systemctl reload apache2`
`sudo systemctl status apache2`

# 10. Troubleshooting Commands
# View Apache logs
`sudo tail -f /var/log/apache2/error.log`

# List enabled sites
`sudo ls /etc/apache2/sites-enabled/`

# Check SSL certificate folder
`ls -l /etc/letsencrypt/live/abhansworkshop.com/`

# 11. DNS Verification (Optional)
`ping abhansworkshop.com`
`nslookup abhansworkshop.com`

# END OF SCRIPT
