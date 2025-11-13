# Abhan’s Workshop Cloud Server Project

Student Name: Abhan Aziz  
Student ID: 34840078  
Unit Code: ICT171  
Server IP: 4.247.144.67  
Domain Name: abhansworkshop.com 

## 1. Overview
This project sets up a cloud-based web server on Microsoft Azure running Ubuntu 22.04, with Apache and SSL enabled using Let's Encrypt.

## 2. Steps to Create and Configure the Server

### Step 1 — Create Azure VM
I created an Ubuntu Linux VM on Microsoft Azure to host my ICT171 Cloud Server Project. The server is a static HTML website deployed on Apache2, and is configured with HTTPS using certbot and LetsEnrypt. Here are the steps to run the server on Microsoft Azure.

 - Logged in to the Azure Portal
- Clicked Create a resource → Compute → Virtual Machine
- Chose the following configuration:
  - Subscription: Student subscription
  - Resource group: Assignment2Group
  - Virtual machine name: Assignment2
  - Region: Central India (Recommended with the Subscription)
  - Image: Ubuntu Server 22.04 LTS
  - Size: Standard_B1s (1 vCPU, 1 GB RAM)
  - Set Authentication type to SSH public key
  - Uploaded the key file assignment2_key.pem
  - Allowed inbound ports:
    - HTTP (port 80)
    - HTTPS (port 443)
    - SSH (port 22)
- Clicked Review + Create, then Create to deploy the VM

### Step 2 — SSH into VM 
  *`chmod 600 assignment2_key.pem`
  *`ssh -i "assignment2_key.pem" azureuser@4.247.144.67`

### Step 3 — Install Apache2
  *`sudo apt update`
  *`sudo install Apache2 -y`
To verify Apache was running, I entered the my IP address on a browser to see the default Apache2 page

### Step 4 - Add Website Content
  1. Navigate to the default web directory and edit the main HTML file
       *`sudo nano /var/www/html/index.html`
  2. Add HTML content
       *The HTML files are available in this repository under the website/ folder

### Step 5 - SSL Certificate/HTTPS setup
  1. Install Snapd and Certbot
       *`sudo apt update`
       *`sudo apt update`
       *`sudo apt install snapd`
       *`sudo snap install core`
       *`sudo snap refresh core`
       *`sudo snap install --classic certbot`
       *`sudo ln -s /snap/bin/certbot /usr/bin/certbot`
  2. Enable SSL module in Apache
       *`sudo a2enmod ssl`
       *`sudo systemctl restart apache2`
  3. Install Certificate
       *`sudo certbot --apache`
       *when prompted to enter domain name:
       *`abhansworkshop.com www.abhansworkshop.com`
  4. Verify Certificate Installation
       *`sudo apache2ctl configtest`
       *`sudo systemctl restart apache2`
  The website should show a secure connection
  
             
