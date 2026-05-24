#!/bin/bash
# סקריפט התקנה ראשוני לשרת EC2 (User Data)

# עדכון חבילות והתקנת תלויות
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common git

# התקנת Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# הוספת משתמש ברירת המחדל לקבוצת Docker כדי שלא נצטרך sudo לכל פקודה
sudo usermod -aG docker ubuntu

# יצירת התיקייה ומשיכת הקוד (בהנחה שהמאגר ציבורי. אם פרטי, נדרש מפתח גישה)
cd /home/ubuntu
git clone https://github.com/oranmeir-git/FixAI.git
cd FixAI

# הרצת הפרויקט
sudo docker compose up -d --build
