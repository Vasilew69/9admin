# Troubleshooting

First and foremost check if you are using the most recent version of nineadmin and that you followed the installation instructions.

## Problems running nineadmin  
When executing nineadmin, it might show you some errors. Example of an [error](https://i.imgur.com/2huiyBf.png), example of a [successful startup](https://i.imgur.com/QLCBZBm.png).

### [nineadmin:AdminVault] Unable to load admins.
If you get `cannot read file`, it means the admin file `txData/admins.json` doesn't exist or nineadmin doesn't have permission to read it.  
Any other error message means you somehow broke the admins file, delete it and restart nineadmin to generate a new one.

### [nineadmin:ConfigVault] Error: Unable to load configuration file `txData/<profile>/config.json`
The selected profile (or `default`) cannot be loaded due to permission issues (eg file owned by the root account), or due to broken JSON.

## Problems starting the server
When you start nineadmin, your server will **not** start automatically (by default). Open the web panel and start nineadmin (actions > START Server). You can change this by enabling autostart in the settings page.  
If you are getting `FXServer is not responding!` it means the `nineadmin:Monitor` could not connect to the FXServer, causes:
- FXServer is not responding to the TCP endpoint, this usually means some resource got stuck;
- FXServer and nineadmin are on the same TCP port. In this case your server will not be able to listen to the configured port and the healthcheck will return a 404 error;
- FXServer is not listening to the local interface.

<hr>

If this guide didn't help you, join our awesome [Discord server](https://discord.gg/AFAAXzq).
