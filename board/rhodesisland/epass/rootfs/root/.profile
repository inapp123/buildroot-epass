# if we are not running in /dev/tty0, skip animation
if [ "$(tty)" != "/dev/tty0" ]; then
    echo "Welcome to Rhodes Island Pass Debug Shell!"
    echo "You are in Terminal $(tty)."
    return
fi

# if epass_drm_app is not present
if [ ! -f "./epass_drm_app" ]; then
cat << EOF
  _   _  ____  _____       _______       
 | \ | |/ __ \|  __ \   /\|__   __|/\    
 |  \| | |  | | |  | | /  \  | |  /  \   
 | . \ | |  | | |  | |/ /\ \ | | / /\ \  
 | |\  | |__| | |__| / ____ \| |/ ____ \ 
 |_| \_|\____/|_____/_/    \_\_/_/    \_\
                                         
Please copy 'epass_drm_app' and asset files.
to app directory.




EOF
else

cat << EOF                                        
                      *                      
                     -.:@                    
                    :.-..*                   
                   :.:.:..%                  
                 #..:   ...+                 
                %..:........#                
               *..%@:=@+:%%. =               
              *. -@@##@%%@@= .+              
             -.  =@@@@@@@@@+   :             
            -... -%#+*#@@@%- .:.:            
           -...   .%@@@@@%.   ...:@          
          :.:.    :@@@@@@@-    ...:%         
        @:..     .#@@@@@@@%.     ...#        
       #:...     -@%=%@@@#%-     ....+       
      #....   ..-+-:-*@@@@@#-..    ...+      
     +...    .=@#..@@@@@@@@@@@-.    ...=     
    *.... .::-------------------::.. .:.=    
   -...=..-=--+-.=::#:=.+-::-*-=*.-..=...:   
  *.......................................- 

EOF
cat << EOF
---------------------------------------------
     RHODES ISLAND AUTHORIZATION PASS
   VERSION 1.0 (c) Ada.Closure.Church 1097
---------------------------------------------
EOF
echo -n -e "\e[31m"
cat << EOF
   This pass certifies that the bearer is an
 authorized operator of Rhodes Island Co'Ltd.
  Unauthorized use of Rhodes Island property
            is strictly prohibited.
EOF
echo -n -e "\e[0m"
cat << EOF
---------------------------------------------
EOF
sleep 1
echo -n -e "\e[32m"
echo "Welcome to Rhodes Island!"
echo "You are in Terminal $(tty)."
echo "Access Level: Operator"
echo -n -e "\e[0m"
echo ""
chmod +x ./epass_drm_app
./epass_drm_app version
cat /etc/os-release
echo -n "System initializing"
for i in $(seq 1 3); do
    echo -n "."
    sleep 1
done
echo ""
echo "Starting Application..."
# echo 0 > /sys/class/vtconsole/vtcon1/bind
# ./lvglsim
./epass_drm_app > /dev/null
fi

cat << EOF
 /##   /##  /######  /#######              
| ##  | ## /##__  ##| ##__  ##             
| ##  | ##| ##  \__/| ##  \ ##             
| ##  | ##|  ###### | #######              
| ##  | ## \____  ##| ##__  ##             
| ##  | ## /##  \ ##| ##  \ ##             
|  ######/|  ######/| #######/             
 \______/  \______/ |_______/              

To Download Assets,
Connect Your Electric Pass Device via USB.
Press any key to Reboot...


EOF

umtpctl start
LAST_TIME=$(date +%s)
while [ $? -eq 0 ]; do
    read -n1
    CURRENT_TIME=$(date +%s)
    ELAPSED_TIME=$((CURRENT_TIME - LAST_TIME))
    if [ $ELAPSED_TIME -ge 5 ]; then
        echo "Triggered!"
        break
    fi
done

reboot
