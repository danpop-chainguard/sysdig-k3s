#POPS k3sup script... remember to change the IP's/HOSTNAMES below!
export sysdig1=
export sysdig2=
export sysdig3=

k3sup install --ip $sysdig1  --context k3s --ssh-key ~/.ssh/google_compute_engine --user $(whoami)
k3sup join --ip $sysdig2 --server-ip $sysdig1  --ssh-key ~/.ssh/google_compute_engine --user $(whoami)
k3sup join --ip $sysdig3 --server-ip $sysdig1  --ssh-key ~/.ssh/google_compute_engine --user $(whoami)


