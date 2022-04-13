### ssh tunnel ex
```shell script
ssh -L 33077:mysql-1.aezai.com:3306 -i phoenix.pem dmytro.miroshnykov@bastion.aezai.com
```
  
### redshift stage tunnel
```shell script
ssh -v -L 54399:redshift-1.stage.aezai.com:5439 -i id_rsa.pub dmytro.miroshnykov@bastion.aezai.com
```

### crontab
#### sudo crontab -e
```shell script
#every 8 hours
0 */8 * * * chmod +x /home/miroshnykov/Sites/mysql8_docker/freeMemoryUbuntu.sh && sh /home/miroshnykov/Sites/mysql8_docker/freeMemoryUbuntu.sh >> /tmp/memory.usage.txt
# every day at 19 00
0 19 * * * rm -rf /tmp/*
# every day at 19 01
1 19 * * * mkdir /tmp/co-recipe /tmp/co-recipe-traffic && chown -R miroshnykov:miroshnykov /tmp/co-recipe /tmp/co-recipe-traffic
```
