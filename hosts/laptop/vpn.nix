{ config, pkgs, secrets, ... }:

{
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "192.168.27.65/32" ];
      privateKey = secrets.laptop.wg-private;
      mtu = 1360;

      peers = [
        {
          publicKey = "KH0Mzh3vnyGWgZrikz7IXifjhHB71/W0DlbHMJIz1k4=";
          presharedKey = secrets.laptop.wg-preshared;
          endpoint = "88.183.40.229:46523";

          allowedIPs = [
            "192.168.27.64/27"
            "192.168.0.0/24"
          ];
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
