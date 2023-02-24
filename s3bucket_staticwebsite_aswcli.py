1  aws configure #configuring the cli credentials
3  aws s3api create-bucket --bucket bucketneuefische1234567 --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2 #create bucket with the name "--bucket ***" and specifiy region "--region ***" and config "--create-bucket-configuration ***"
5  aws iam create-user --user-name awsS3user #create User with Username
6  aws iam create-login-profile --user-name awsS3user --password Training123! #create login profile for user x and with password ***
7  aws iam list-policies --query "Policies[?contains(PolicyName,'S3')]" #search for possible policys wich include "S3"
8  aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --user-name awsS3user #give user xy the specified policies
9  cd ~/sysops-activity-files # change directory
10  tar xvzf static-website-v2.tar.gz #unpack tar
12  cd static-website #change directory
18  aws s3 website s3://bucketneuefische1234567/ --index-document index.html # "website" tell s3 to host a static website in specified bucket; "--index-document" specifies wich document the website should use for index
19  aws s3 cp /home/ec2-user/sysops-activity-files/static-website/ s3://bucketneuefische1234567/ --recursive --acl public-read #"cp" copy from first dir to second; "--recursive" include everything in the specified directory; "--acl ***" specifies the policies who can read or write
21  aws s3 ls bucketneuefische1234567 #list all files in the bucket
24  touch update-website.sh #create file
26  vi update-website.sh #edit file in vi editor
27  chmod +x update-website.sh #make the file an executable batch file
29  ./update-website.sh #run the batch file