# M2 Homework - Working in the Console

## 1. Create users

sudo useradd -m -c "ProjectX Developer" developer
sudo passwd developer

sudo useradd -m -c "ProjectX Manager" manager
sudo passwd manager

## 2. Create group

sudo groupadd -g 3000 projectxyz

## 3. Add users to group

sudo usermod -aG projectxyz developer
sudo usermod -aG projectxyz manager

## 4. Create directory structure

sudo mkdir -p /shared/projects/projectXYZ/Stage{1..3}/{DOCUMENTS,BUDGET}

## 5. Create document files

sudo touch /shared/projects/projectXYZ/Stage{1..3}/DOCUMENTS/document{1..5}.doc

## 6. Create budget files

sudo touch /shared/projects/projectXYZ/Stage{1..3}/BUDGET/readme_{en,bg,de}.txt


## 7. Change ownership

sudo chown -R manager /shared/projects/projectXYZ

## 8. Change group ownership

sudo chgrp -R projectxyz /shared/projects/projectXYZ

## 9. Set directory permissions

sudo find /shared/projects/projectXYZ -type d -exec chmod 2770 {} \;

## 10. Set file permissions

sudo find /shared/projects/projectXYZ -type f -exec chmod 660 {} \;
