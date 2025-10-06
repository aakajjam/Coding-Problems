*** Settings ***

Documentation    Expected strings for verification

*** Variables ***

# PORTAL URLs

&{PORTAL_SKYSQL_URLS}           test=https://app-test.skysql.com/
...                             prod=https://app.skysql.com/

&{API_SKYSQL_URLS}              dev=https://api.dev.mariadb.net/
...                             test=https://api.test.mariadb.net/
...                             stage=https://api.stage.mariadb.com/
...                             prod=https://api.mariadb.com/

# API Endpoints

${ENTITLEMENTS_ENDPOINT}        provisioning/v1/entitlements

# Feature flags

&{FEATURE_FLAGS}                enable-portal-dual-endpoints=OFF
...                             enable-portal-single-zone=OFF
...                             disable-dps-topology-sa=OFF

# PAGE TITLES

${SIGN_UP_OR_SIGN_IN_EXPECTED_TITLE} =                Login - SkySQL
${SIGN_IN_EXPECTED_TITLE} =                           Sign-in - MariaDB ID
${SERVICES_PAGE_EXPECTED_TITLE} =                     Services
${LAUNCH_A_CLOUD_DATABASE_EXPECTED_TITLE} =           Launch a Cloud Database
${LAUNCH_A_MARIADB_SKYSQ_SERVICE_EXPECTED_TITLE} =    Launch a MariaDB SkySQL service
${CONNECT_TO_SERVICE_EXPECTED_TITLE} =                Connect to service
${IP_ALLOW_LIST_FOR_SERVICE_ACCESS_EXPECTED_TITLE} =  IP allowlist for service access
@{SET_UP_MANAGE_PSC_PL_EXPECTED_TITLE} =              Set up your Private Service Connect
...                                                   Set up your Private Link
...                                                   Manage your Private Service Connect
...                                                   Manage your Private Link
${REMOVE_SECONDARY_ENDPOINT_EXPECTED_TITLE} =         Remove secondary endpoint?

${SET_UP_XPAND_GLOBAL_REPLICATION_EXPECTED_TITLE} =   Set up Xpand Global Replication
${EDIT_XPAND_GLOBAL_REPLICATION_EXPECTED_TITLE} =     Edit Xpand Global Replication
${SCALE_STORAGE_EXPECTED_TITLE} =                     SkySQL: Scale storage
${SCALE_NODES_EXPECTED_TITLE} =                       SkySQL: Scale nodes
${STOP_SERVICE_EXPECTED_TITLE} =                      SkySQL: Stop Service
${START_SERVICE_EXPECTED_TITLE} =                     SkySQL: Start Service
${LEAVE_QUERY_EDITOR_EXPECTED_TITLE} =                Are you sure you want to leave?
${LAUNCH_A_NEW_SERVICE_EXPECTED_TITLE} =              Launch a new service
${DELETE_EXPECTED_TITLE} =                            Delete

# SERVICES PAGE - DASHBOARD

${SERVICE_STATE_HEALTHY}                              Healthy
${SERVICE_STATE_FAILED}                               Failed
${SERVICE_STATE_WARNING}                              Warning
${SERVICE_STATE_DELETING}                             Deleting
${SERVICE_STATE_UNHEALTHY}                            Unhealthy
${SERVICE_STATE_STOPPED}                              Stopped
${SERVICE_STATE_MODIFYING}                            Modifying
${SERVICE_STATE_SCALING}                              Scaling
${SINGLE_ZONE_LABEL}                                  (single zone)
${SERVICE_STATE_CREATING}                             Creating

# TOPOLOGY NAMES

${STANDALONE_LONG}                                    Enterprise Server Single Node
${STANDALONE_SHORT}                                   Enterprise Server
${PRIMARY_REPLICA_LONG}                               Enterprise Server Replicated
${PRIMARY_REPLICA_SHORT}                              Enterprise Server
${XPAND_LONG}                                         Xpand Distributed SQL
${XPAND_SHORT}                                        Xpand
${COLUMNSTORE_LONG}                                   ColumnStore Data Warehouse
${COLUMNSTORE_SHORT}                                  ColumnStore
${SERVERLESS_LONG}                                    Serverless Analytics Powered by Apache Spark
${SERVERLESS_SHORT}                                   Serverless Analytics
&{TOPOLOGY_SHORT_NAME_DICT}                           Single=${STANDALONE_SHORT}
...                                                   Replica=${PRIMARY_REPLICA_SHORT}
...                                                   Distributed=${XPAND_SHORT}
...                                                   ColumnStore=${COLUMNSTORE_SHORT}
...                                                   Serverless=${SERVERLESS_SHORT}
&{TOPOLOGY_LONG_NAME_DICT}                            Single=${STANDALONE_LONG}
...                                                   Replica=${PRIMARY_REPLICA_LONG}
...                                                   Distributed=${XPAND_LONG}
...                                                   ColumnStore=${COLUMNSTORE_LONG}
...                                                   Serverless=${SERVERLESS_LONG}

# INPUTS

${DELETE_INPUT_TEXT_VALUE}                            delete

# SETTINGS PAGE

@{SETTINGS_LINKS_LINK}                                Settings
...                                                   User Management
...                                                   Configuration Manager
...                                                   Secure Access
...                                                   Policies
...                                                   notification channel

# CONFIGURATION MANAGER

${CONFIGURATION_MANAGER_TEXT}                         Settings / Configuration Manager
${STANDALONE_DEFAULT_CONFIG}                          SkySQL Default - Enterprise Server Single Node
${PRIMARY_REPLICA_DEFAULT_CONFIG}                     SkySQL Default - Enterprise Server With Replica(s)
${SERVERLESS_DEFAULT_CONFIG}                          SkySQL Default - Serverless Standalone Topology
${COLUMNSTORE_DEFAULT_CONFIG}                         SkySQL Default - ColumnStore Data Warehouse
${XPAND_DEFAULT_CONFIG}                               SkySQL Default - Xpand Distributed SQL

@{DEFAULT_CONFIGS_LIST}                               ${STANDALONE_DEFAULT_CONFIG}
...                                                   ${PRIMARY_REPLICA_DEFAULT_CONFIG}
...                                                   ${SERVERLESS_DEFAULT_CONFIG}

&{TOPOLOGY_DEFAULT_CONFIG_DICT}                       Single=${STANDALONE_DEFAULT_CONFIG}
...                                                   Replica=${PRIMARY_REPLICA_DEFAULT_CONFIG}
...                                                   ColumnStore=${COLUMNSTORE_DEFAULT_CONFIG}
...                                                   Distributed=${XPAND_DEFAULT_CONFIG}

${NEW_DATABASE_CONFIGURATION_PAGE_EXPECTED_TITLE}     Settings / Configuration Manager / New Database Configuration
${DELETE_THIS_CONFIGURATION_PAGE_TITLE}               Delete this configuration

# BACKUPS PAGE
${BACKUPS_SCHEDULES_TAB}                             Schedules
${BACKUPS_RESTORES_TAB}                              Restores