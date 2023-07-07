#!/usr/local/bin/bash

# push origin
git push

# copy over nginx conf
scp ./zfraenkel.com.conf root@evey.sirodoht.com:/etc/nginx/sites-available/

# remove old and copy over new html files
ssh root@evey.sirodoht.com rm -r /var/www/zfraenkel.com/
ssh root@evey.sirodoht.com mkdir -p /var/www/zfraenkel.com/html
rsync -rsP ./index.html root@evey.sirodoht.com:/var/www/zfraenkel.com/html
rsync -rsP ./style.css root@evey.sirodoht.com:/var/www/zfraenkel.com/html

# restart nginx
ssh root@evey.sirodoht.com 'nginx -t'
ssh root@evey.sirodoht.com 'systemctl reload nginx'
