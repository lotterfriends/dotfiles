# Wireguard

```bash
sudo add-apt-repository ppa:wireguard/wireguard
sudo apt-get update
sudo apt-get install wireguard resolvconf
 
sudo cp <CONFIG-NAME>.conf /etc/wireguard/
wg-quick up <CONFIG-NAME>
systemctl enable wg-quick@<CONFIG-NAME>
```
