#POPS k3sup script... remember to change the IP's/HOSTNAMES below!
export sysdig1=35.192.33.199
export sysdig2=104.198.153.82
export sysdig3=34.122.126.98

k3sup install --ip $sysdig1  --context k3s --ssh-key ~/.ssh/google_compute_engine --user $(whoami)
k3sup join --ip $sysdig2 --server-ip $sysdig1  --ssh-key ~/.ssh/google_compute_engine --user $(whoami)
k3sup join --ip $sysdig3 --server-ip $sysdig1  --ssh-key ~/.ssh/google_compute_engine --user $(whoami)


