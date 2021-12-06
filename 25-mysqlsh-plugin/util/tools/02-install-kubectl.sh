curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

if [ $? == 0 ]
then
	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin
fi
