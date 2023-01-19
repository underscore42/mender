# mender
mender OTA service scripts

Can't find a device in pending that you swear you've added to your mender service previously?
Well, it might have been in accidently dismissed but not rejected. This toolset will help
you find it.

1. Call inventory_info.sh and you'll get the number of devices and a list of all devices with inventories.
   In an example case there were 64 devices but only 61 displayed. Then we know there is a mismatch.
2. Call get_all_device_status.sh, now you will see every device state. Look for pending.
3. Call get_device_status.sh <device_id>, will show if pending or not, plus if it has a public key.
4. Get rid of a "stuck" pending and have a fresh start. Call decomms.sh <device_id>
5. Check if really gone... call get_device_status.sh <device_id> again and should not be found.

That's it. The next time the device attempts to connect to the mender server it is new, so a fresh public
key is created.

You'll need to point it to an mender server, and provide login details.

See https://docs.mender.io/api/2.6/?shell#decommission-device for further details.
