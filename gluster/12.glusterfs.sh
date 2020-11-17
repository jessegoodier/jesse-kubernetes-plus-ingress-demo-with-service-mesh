# https://www.digitalocean.com/community/tutorials/how-to-create-a-redundant-storage-pool-using-glusterfs-on-ubuntu-18-04
sudo add-apt-repository -y ppa:gluster/glusterfs-7
sudo apt update
sudo apt install -y glusterfs-server
sudo systemctl status glusterd.service
sudo mkdir -p /var/local/glusterfs/brick-nsm
sudo gluster volume create nginx-service-mesh k8s.nginx.rocks:/var/local/glusterfs/brick-nsm force
sudo gluster volume start nginx-service-mesh
