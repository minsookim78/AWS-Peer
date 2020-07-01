#alb-launch.tf

resource "aws_launch_configuration" "ns08014-east-web80" {
  name_prefix = "ns08014-east-autoscaling-web80"

  image_id = var.amazon_linux_east
  instance_type = "t2.nano"
  key_name = "ns08014"
  security_groups = [
    "${aws_security_group.ns08014-east-alb-SG.id}",
    "${aws_default_security_group.ns08014-east-vpc_SG_DFT.id}",
  ]
  associate_public_ip_address = true
    
  user_data = <<USER_DATA
#!/bin/bash
yum update
yum -y install httpd
echo "<html>" > /var/www/html/index.html
echo "Hello-80" >> /var/www/html/index.html
echo "<img src=\"http://"${aws_cloudfront_distribution.images_cdn.domain_name}"/image.jpg\">" >> /var/www/html/index.html
echo "</html>" >> /var/www/html/index.html
systemctl start httpd.service
systemctl enable httpd.service
  USER_DATA

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "ns08014-east-web8080" {
  name_prefix = "ns08014-east-autoscaling-web8080"

  image_id = var.amazon_linux_east
  instance_type = "t2.nano"
  key_name = "ns08014"
  security_groups = [
    "${aws_security_group.ns08014-east-alb-SG.id}",
    "${aws_default_security_group.ns08014-east-vpc_SG_DFT.id}",
  ]
  associate_public_ip_address = true
    
  user_data = <<USER_DATA
#!/bin/bash
yum update
yum -y install httpd
echo "<html>" > /var/www/html/index.html
echo "Hello-8080" >> /var/www/html/index.html
echo "<img src=\"http://"${aws_cloudfront_distribution.images_cdn.domain_name}"/image.jpg\">" >> /var/www/html/index.html
echo "</html>" >> /var/www/html/index.html
sudo service httpd start
sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
sudo service httpd restart

  USER_DATA

  lifecycle {
    create_before_destroy = true
  }
}
