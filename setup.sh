# https://xrpl.org/install-rippled-on-ubuntu.html
sudo apt -y updates

sudo apt -y install apt-transport-https ca-certificates wget gnupg

sudo install -m 0755 -d /etc/apt/keyrings && \
    wget -qO- https://repos.ripple.com/repos/api/gpg/key/public | \
    sudo gpg --dearmor -o /etc/apt/keyrings/ripple.gpg

echo "deb [signed-by=/etc/apt/keyrings/ripple.gpg] https://repos.ripple.com/repos/rippled-deb bionic stable" | \
    sudo tee -a /etc/apt/sources.list.d/ripple.list

sudo apt -y update && sudo apt -y install rippled

rm /opt/ripple/etc/rippled.cfg

cp ./config.cfg /opt/ripple/etc/rippled.cfg

systemctl status rippled.service

sudo systemctl start rippled.service