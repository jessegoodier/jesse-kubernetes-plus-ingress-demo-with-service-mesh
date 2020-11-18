# https://github.com/giltene/wrk2/wiki/Installing-wrk2-on-Linux
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev git zlib1g-dev
git clone https://github.com/giltene/wrk2.git
cd wrk2
make
# move the executable to somewhere in your PATH
sudo cp wrk /usr/local/bin