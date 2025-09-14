{ config, pkgs, secrets, ... }:

{
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "192.168.27.65/32" ];
      privateKey = secrets.wg-private;
      mtu = 1360;

      peers = [
        {
          publicKey = "KH0Mzh3vnyGWgZrikz7IXifjhHB71/W0DlbHMJIz1k4=";
          presharedKey = secrets.wg-preshared;
          endpoint = "91.168.138.207:62364";

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
