# Static Website Portfolio

- Provision an EC2 instance on AWS.
- Install Apache Server.
- Configure the server to serve the static website.

***

## 1. Provision an EC2 instance on AWS

- Create an account on **AWS**.

- Choose a **region** according to your preference.
    
![alt text](/assets/img/region.png "Region")
    
- Go to Search Bar and search for **EC2**, then click on **EC2**.

![alt text](/assets/img/select.png "Select")

- After that go to **Instances** and click on **Launch Instance**.

![alt text](/assets/img/instance.png "Instance")

- Select **Amazon Linux 2** as ami and **t2.micro** as instance type (Free Tier eligible).

![alt text](/assets/img/ami.png "Ami and Instance type")

- After that select **Create Security Group Option** and **Allow SSH from My IP**, then click on **Create new key pair**.

![alt text](/assets/img/security-group.png "Security group")

- Give a name to your key pair and choose the **Key Pair type** and **Private Key file format** according to your preference and click on **Create Key Pair**. A .pem file will be downloaded in your computer copy that file and paste it into .ssh folder.

![alt text](/assets/img/key-pair.png "Key Pair")

- Finally, Click **Launch Instance**.

***

## 2. Install Apache Server

- Open a **terminal**, and type

> ssh -i ~/.ssh/{key-pair-name}.pem ec2-user@{public-ip-of-your-ec2-instance}

![alt text](/assets/img/security-group-2.png "Security Group")

- Install the **apache** server.

> sudo yum install httpd -y

- Start the **apache** server.

> sudo service httpd start

***

## 3. Configure the server to serve the Static Website

- Install **git** on your EC2 instance.

> sudo yum install git

- **Clone** the repository where you have your static website.

> git clone https://github.com/akshatoxy/Static-Portfolio-Website.git

- After that **copy** the contents of the clone folder to apache html location.

> cp -r Static-Portfolio-Website/* /var/www/html/

- Now the server is serving our static website but we won't be able to access it because the security group has no such inbound rule. So, to access the website we have to add the inbound rule to the security group.

- In the **Instances** tab select **Networking** to view the security groups attached to the instance. After that click on the id.

![alt text](/assets/img/security-group-2.png "Security group")

- Click on **Edit Inbound Rules**.

![alt text](/assets/img/inbound-rules.png "Inbound Rules")

- Select type as **HTTP** and source as **My IP** and click **Save rules**.

- Copy the **Public IP** and paste it into a browser. You should be able to see your website.

***