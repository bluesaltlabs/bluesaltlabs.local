# Scripts

Scripts associated with this project.


## Scripts: Backup Docker Server

cron script. Run this nightly to back up `docker-server` data to `windows-server` shared.

- On the windows server, install restic by downloading the binary and copying it to `C:\Windows\System32\restic`
-  Then open command prompt and set up a restic repository:
  ```shell
    c:
    cd \restic
    restic --init
  ```
- Ensure `restic` and `cifs-utils` are installed first (`apt-get install cifs-utils restic`).
- setup windows mount directory: (`mkdir -p /mnt/windows-server/restic`)
- Test mounting the windows share:
  ```bash
  # This will prompt for the user password:
  mount -t cifs -o username=<win_share_user> //WIN_SHARE_IP/<share_name> /mnt/win_share

  # To mount with credentials file, use this:
  mount -t cifs -o credentials=/etc/credentials/windows-server //windows-server.local/restic /mnt/windows-server/restic
  ```
- Set up automatic mounting on reboot by appending this to `/etc/fstab`:
  ```bash
  # <file system>         <dir>                       <type> <options>
  //windows-server.local  /mnt/windows-server/restic  cifs   credentials=/etc/credentials/windows-server
  ```
- test the mount with `mount /mnt/windows-server/restic`
  - todo: for some reason this is giving me errors.
- save the `backup-docker-server.sh` file to `/root/scripts/backup.sh`
- Add the following cron to back up the docker server nightly at 2 AM:
  ```bash
  0 2 * * * /root/scripts/backup.sh >> /var/log/restic_backup.log 2>&1
  ```
