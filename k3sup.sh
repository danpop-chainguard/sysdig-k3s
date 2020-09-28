#POPS k3sup script... remember to change the IP's/HOSTNAMES/Keys below in the export(s) and script in order to point to your newly created instances and your own keys (the below are examples from GCP)
export sysdig1=
export sysdig2=
export sysdig3=

k3sup install --ip $sysdig1  --context k3s --ssh-key ~/.ssh/google_compute_engine --user $(whoami)
k3sup join --ip $sysdig2 --server-ip $sysdig1  --ssh-key ~/.ssh/google_compute_engine --user $(whoami)
k3sup join --ip $sysdig3 --server-ip $sysdig1  --ssh-key ~/.ssh/google_compute_engine --user $(whoami)


