
if [ -f "nginx-service-mesh/nginx-meshctl" ]; then
  chmod +x nginx-service-mesh/nginx-meshctl
  sudo cp nginx-service-mesh/nginx-meshctl /usr/local/bin
else   
   RED='\033[0;31m'
   NC='\033[0m' # No Color
   LR='1;31'
   echo '\e[91mPlease copy the nginx-meshctl binary and images to the target locations before running this script.' \
    '\nPress ctrl-c to exit.'
   read x
   exit;
fi
