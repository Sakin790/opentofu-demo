vm_ip    = "192.168.1.100" 
ssh_user = "ubuntu"        

pg_services = {
  "user-service-db" = {
    port     = 5432
    db_name  = "user_db"
    db_user  = "user_admin"
    password = "pgsecretpassword1"
  },
  "order-service-db" = {
    port     = 5433
    db_name  = "order_db"
    db_user  = "order_admin"
    password = "pgsecretpassword2"
  },
  "payment-service-db" = {
    port     = 5434
    db_name  = "payment_db"
    db_user  = "pay_admin"
    password = "pgsecretpassword3"
  },
  "analytics-service-db" = {
    port     = 5435
    db_name  = "analytics_db"
    db_user  = "analytics_admin"
    password = "pgsecretpassword4"
  }
}

mysql_services = {
  "inventory-service-db" = {
    port          = 3306
    db_name       = "inventory_db"
    db_user       = "inv_admin"
    password      = "mysqlsecretpass1"
    root_password = "rootsecretpass1"
  },
  "notification-service-db" = {
    port          = 3307
    db_name       = "notif_db"
    db_user       = "notif_admin"
    password      = "mysqlsecretpass2"
    root_password = "rootsecretpass2"
  },
  "auth-service-db" = {
    port          = 3308
    db_name       = "auth_db"
    db_user       = "auth_admin"
    password      = "mysqlsecretpass3"
    root_password = "rootsecretpass3"
  },
  "cms-service-db" = {
    port          = 3309
    db_name       = "cms_db"
    db_user       = "cms_admin"
    password      = "mysqlsecretpass4"
    root_password = "rootsecretpass4"
  }
}


minio_services = {
  "media-storage-s3" = {
    api_port     = 9000
    console_port = 9001
    root_user    = "mediaadmin"
    password     = "minioadminpass1"
  },
  "backups-storage-s3" = {
    api_port     = 9002
    console_port = 9003
    root_user    = "backupadmin"
    password     = "minioadminpass2"
  }
}