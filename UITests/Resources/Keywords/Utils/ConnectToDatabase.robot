*** Settings ***

Documentation    Connect to the topology and execute queries keywords based on MariaDBRobot.py library
Library    ../../CustomLibraries/MariaDBRobot.py
Resource   ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ConnectToServiceKeywords.robot

*** Keywords ***

Connect To The Database
    [Documentation]    Make a connection to a database and execute queries

    # ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get FQDN text value' keyword
    # ${PORT_TEXT_VALUE} variable is passed from 'ServicesDashboardKeywords.robot' file -> 'Get port text value' keyword
    # ${USERNAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Username' text value' keyword
    # ${DEFAULT_PASSWORD_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Default password' text value' keyword
    # ${PLATFORM_TEXT_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> Select 'Cloud Provider'

    connect    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}  ${PORT_TEXT_VALUE}  ${USERNAME_TEXT_VALUE}  ${DEFAULT_PASSWORD_TEXT_VALUE}  "mariadb"  ${PLATFORM_TEXT_VALUE}  ""
    log to console          FQFN: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}, Port: ${PORT_TEXT_VALUE}, Username: ${USERNAME_TEXT_VALUE}, Password: ${DEFAULT_PASSWORD_TEXT_VALUE}, Platform: ${PLATFORM_TEXT_VALUE}

    exec                    CREATE DATABASE mytestdatabase;
    log to console          Created a database mytestdatabase
    exec                    USE mytestdatabase;
    log to console          Used database mytestdatabase
    exec                    CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1));
    log to console          Created table pet
    exec                    INSERT INTO pet VALUES ('tommy', 'mariadb', 'cat', 'm');
    log to console          Inserted record into table pet
    ${select1} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select1}
    exec                    UPDATE pet SET name = 'Batman', owner = 'MariaDB', species = 'Bat', sex = 'M';
    log to console          Updated record into table pet
    ${select2} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select2}
    exec                    DROP TABLE pet;
    log to console          Dropped table pet
    exec                    DROP DATABASE mytestdatabase;
    log to console          Dropped database mytestdatabase

    log to console          Connect To The Database

Connect to the database without SSL certificate
    [Documentation]    Make a connection to a database without SSL certificate and execute queries

    # ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get FQDN text value' keyword
    # ${PORT_TEXT_VALUE} variable is passed from 'ServicesDashboardKeywords.robot' -> 'Get port text value' keyword
    # ${USERNAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Username' text value' keyword
    # ${DEFAULT_PASSWORD_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Default password' text value' keyword

    connect_without_ssl   ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}  ${PORT_TEXT_VALUE}  ${USERNAME_TEXT_VALUE}  ${DEFAULT_PASSWORD_TEXT_VALUE}  "mariadb"  ""
    log to console          FQFN: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}, Port: ${PORT_TEXT_VALUE}, Username: ${USERNAME_TEXT_VALUE}, Password: ${DEFAULT_PASSWORD_TEXT_VALUE}

    exec                    CREATE DATABASE mytestdatabase;
    log to console          Created a database mytestdatabase
    exec                    USE mytestdatabase;
    log to console          Used database mytestdatabase
    exec                    CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1));
    log to console          Created table pet
    exec                    INSERT INTO pet VALUES ('tommy', 'mariadb', 'cat', 'm');
    log to console          Inserted record into table pet
    ${select1} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select1}
    exec                    UPDATE pet SET name = 'Batman', owner = 'MariaDB', species = 'Bat', sex = 'M';
    log to console          Updated record into table pet
    ${select2} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select2}
    exec                    DROP TABLE pet;
    log to console          Dropped table pet
    exec                    DROP DATABASE mytestdatabase;
    log to console          Dropped database mytestdatabase

    log to console          Connect to the database without SSL certificate

Connect to Xpand database
    [Documentation]    Make a connection to Xpand database and execute queries

    # ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get FQDN text value' keyword
    # ${PORT_TEXT_VALUE} variable is passed from 'ServicesDashboardKeywords.robot' -> 'Get port text value' keyword
    # ${USERNAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Username' text value' keyword
    # ${DEFAULT_PASSWORD_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Default password' text value' keyword
    # ${PLATFORM_TEXT_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> 'Click on 'Cloud Provider' radio button'
    # ${DEFAULT_CHARACTER_SET_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'default character set' value'

    connect    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}  ${PORT_TEXT_VALUE}  ${USERNAME_TEXT_VALUE}  ${DEFAULT_PASSWORD_TEXT_VALUE}  "mariadb"  ${PLATFORM_TEXT_VALUE}  ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    log to console          FQFN: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}, Port: ${PORT_TEXT_VALUE}, Username: ${USERNAME_TEXT_VALUE}, Password: ${DEFAULT_PASSWORD_TEXT_VALUE}, Platform: ${PLATFORM_TEXT_VALUE}, Charset: ${DEFAULT_CHARACTER_SET_TEXT_VALUE}

    exec                    CREATE DATABASE mytestdatabase;
    log to console          Created a database mytestdatabase
    exec                    USE mytestdatabase;
    log to console          Used database mytestdatabase
    exec                    CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1));
    log to console          Created table pet
    exec                    INSERT INTO pet VALUES ('tommy', 'mariadb', 'cat', 'm');
    log to console          Inserted record into table pet
    ${select1} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select1}
    exec                    UPDATE pet SET name = 'Batman', owner = 'MariaDB', species = 'Bat', sex = 'M';
    log to console          Updated record into table pet
    ${select2} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select2}
    exec                    DROP TABLE pet;
    log to console          Dropped table pet
    exec                    DROP DATABASE mytestdatabase;
    log to console          Dropped database mytestdatabase

    log to console          Connect to Xpand database

Connect to Xpand database 2
    [Documentation]    Make a connection to Xpand database 2 and execute queries

    # ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get FQDN text value' keyword
    # ${PORT_TEXT_VALUE_2} variable is passed from 'ServicesDashboardKeywords.robot' -> 'Get port text value' keyword
    # ${USERNAME_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Username' text value' keyword
    # ${DEFAULT_PASSWORD_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Default password' text value' keyword
    # ${PLATFORM_TEXT_VALUE_2} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> 'Click on 'Cloud Provider' radio button'
    # ${DEFAULT_CHARACTER_SET_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'default character set' value'

    connect    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2}  ${PORT_TEXT_VALUE_2}  ${USERNAME_TEXT_VALUE_2}  ${DEFAULT_PASSWORD_TEXT_VALUE_2}  "mariadb"  ${PLATFORM_TEXT_VALUE_2}  ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    log to console          FQFN: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2}, Port: ${PORT_TEXT_VALUE_2}, Username: ${USERNAME_TEXT_VALUE_2}, Password: ${DEFAULT_PASSWORD_TEXT_VALUE_2}, Platform: ${PLATFORM_TEXT_VALUE_2}, Charset: ${DEFAULT_CHARACTER_SET_TEXT_VALUE}

    exec                    CREATE DATABASE mytestdatabase;
    log to console          Created a database mytestdatabase
    exec                    USE mytestdatabase;
    log to console          Used database mytestdatabase
    exec                    CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1));
    log to console          Created table pet
    exec                    INSERT INTO pet VALUES ('tommy', 'mariadb', 'cat', 'm');
    log to console          Inserted record into table pet
    ${select1} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select1}
    exec                    UPDATE pet SET name = 'Batman', owner = 'MariaDB', species = 'Bat', sex = 'M';
    log to console          Updated record into table pet
    ${select2} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select2}
    exec                    DROP TABLE pet;
    log to console          Dropped table pet
    exec                    DROP DATABASE mytestdatabase;
    log to console          Dropped database mytestdatabase

    log to console          Connect to Xpand database 2

Connect to Xpand database without SSL certificate
    [Documentation]    Make a connection to Xpand database without SSL certificate and execute queries

    # ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get FQDN text value' keyword
    # ${PORT_TEXT_VALUE} variable is passed from 'ServicesDashboardKeywords.robot' -> 'Get port text value' keyword
    # ${USERNAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Username' text value' keyword
    # ${DEFAULT_PASSWORD_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Default password' text value' keyword
    # ${DEFAULT_CHARACTER_SET_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'default character set' value  without SSL'

    connect_without_ssl     ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}  ${PORT_TEXT_VALUE}  ${USERNAME_TEXT_VALUE}  ${DEFAULT_PASSWORD_TEXT_VALUE}  "mariadb"  ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    log to console          FQFN: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}, Port: ${PORT_TEXT_VALUE}, Username: ${USERNAME_TEXT_VALUE}, Password: ${DEFAULT_PASSWORD_TEXT_VALUE}, Charset: ${DEFAULT_CHARACTER_SET_TEXT_VALUE}

    exec                    CREATE DATABASE mytestdatabase;
    log to console          Created a database mytestdatabase
    exec                    USE mytestdatabase;
    log to console          Used database mytestdatabase
    exec                    CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1));
    log to console          Created table pet
    exec                    INSERT INTO pet VALUES ('tommy', 'mariadb', 'cat', 'm');
    log to console          Inserted record into table pet
    ${select1} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select1}
    exec                    UPDATE pet SET name = 'Batman', owner = 'MariaDB', species = 'Bat', sex = 'M';
    log to console          Updated record into table pet
    ${select2} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select2}
    exec                    DROP TABLE pet;
    log to console          Dropped table pet
    exec                    DROP DATABASE mytestdatabase;
    log to console          Dropped database mytestdatabase

    log to console          Connect to Xpand database without SSL certificate

Display the initial database config variable values
    [Documentation]    Execute 'Show variables' command to display the initial database config variable values
    [Arguments]    ${CONFIG_VARIABLE_1}    ${CONFIG_VARIABLE_2}

    # The below command is equal to "SHOW VARIABLES LIKE '${CONFIG_VARIABLE_1}';" + "SHOW VARIABLES LIKE '${CONFIG_VARIABLE_2}';",
    # but it displayes the results in an unified list.
    ${config_variable_value_initial} =    select    SHOW VARIABLES WHERE VARIABLE_NAME IN ('${CONFIG_VARIABLE_1}', '${CONFIG_VARIABLE_2}');

    log to console    Display the initial database config variable values: The current (variable, value) pairs are ${config_variable_value_initial}

    set test variable    ${CONFIG_VARIABLE_VALUE_INITIAL}

Display the altered database config variable values
    [Documentation]    Execute 'Show variables' command to display the altered database config variable values
    [Arguments]    ${CONFIG_VARIABLE_1}    ${CONFIG_VARIABLE_2}

    # The below command is equal to "SHOW VARIABLES LIKE '${CONFIG_VARIABLE_1}';" + "SHOW VARIABLES LIKE '${CONFIG_VARIABLE_2}';",
    # but it displayes the results in an unified list.
    ${config_variable_value_altered} =    select    SHOW VARIABLES WHERE VARIABLE_NAME IN ('${CONFIG_VARIABLE_1}', '${CONFIG_VARIABLE_2}');

    log to console    Display the altered database config variable values: The current (variable, value) pairs are ${config_variable_value_altered}

    set test variable    ${CONFIG_VARIABLE_VALUE_ALTERED}

Verify custom config variables are applied to the service
    [Documentation]    Verify that the custom config variables are successfully applied to the service

    # ${CONFIG_VARIABLE_VALUE_INITIAL} and ${CONFIG_VARIABLE_VALUE_ALTERED} are lists of tuples taken from
    # 'ConnectToDatabase.robot/Display the initial database config variable values' and 'ConnectToDatabase.robot/Display the altered database config variable values'.

    should not be equal as strings    ${CONFIG_VARIABLE_VALUE_INITIAL}[0][1]    ${CONFIG_VARIABLE_VALUE_ALTERED}[0][1]
    log    ${CONFIG_VARIABLE_VALUE_INITIAL}[0][1], ${CONFIG_VARIABLE_VALUE_ALTERED}[0][1]

    should not be equal as strings    ${CONFIG_VARIABLE_VALUE_INITIAL}[1][1]    ${CONFIG_VARIABLE_VALUE_ALTERED}[1][1]
    log    ${CONFIG_VARIABLE_VALUE_INITIAL}[1][1], ${CONFIG_VARIABLE_VALUE_ALTERED}[1][1]

    should be equal as strings    ${CONFIG_VARIABLE_VALUE_INITIAL}[0][0]    ${CONFIG_VARIABLE_VALUE_ALTERED}[0][0]
    log    ${CONFIG_VARIABLE_VALUE_INITIAL}[0][0], ${CONFIG_VARIABLE_VALUE_ALTERED}[0][0]

    should be equal as strings    ${CONFIG_VARIABLE_VALUE_INITIAL}[1][0]    ${CONFIG_VARIABLE_VALUE_ALTERED}[1][0]
    log    ${CONFIG_VARIABLE_VALUE_INITIAL}[1][0], ${CONFIG_VARIABLE_VALUE_ALTERED}[1][0]

    log to console    Verify custom config variables are applied to the service: Initial - ${CONFIG_VARIABLE_VALUE_INITIAL}, ${\n} Altered - ${CONFIG_VARIABLE_VALUE_ALTERED}

Perform operations in Xpand 1
    [Documentation]    Make a connection to Xpand database 1 and execute queries

    # ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get FQDN text value' keyword
    # ${PORT_TEXT_VALUE} variable is passed from 'ServicesDashboardKeywords.robot' -> 'Get port text value' keyword
    # ${USERNAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Username' text value' keyword
    # ${DEFAULT_PASSWORD_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Default password' text value' keyword
    # ${PLATFORM_TEXT_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> 'Click on 'Cloud Provider' radio button'
    # ${DEFAULT_CHARACTER_SET_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'default character set' value'

    connect    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}  ${PORT_TEXT_VALUE}  ${USERNAME_TEXT_VALUE}  ${DEFAULT_PASSWORD_TEXT_VALUE}  "mariadb"  ${PLATFORM_TEXT_VALUE}  ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    log to console          FQFN: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}, Port: ${PORT_TEXT_VALUE}, Username: ${USERNAME_TEXT_VALUE}, Password: ${DEFAULT_PASSWORD_TEXT_VALUE}, Platform: ${PLATFORM_TEXT_VALUE}, Charset: ${DEFAULT_CHARACTER_SET_TEXT_VALUE}

    exec                    CREATE DATABASE first;
    log to console          Created a database first
    exec                    USE first;
    log to console          Used database first
    exec                    CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1));
    log to console          Created table pet
    exec                    INSERT INTO pet VALUES ('tommy', 'mariadb', 'cat', 'm');
    log to console          Inserted record into table pet
    ${select1} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select1}
    exec                    UPDATE pet SET name = 'Batman', owner = 'MariaDB', species = 'Bat', sex = 'M';
    log to console          Updated record into table pet
    ${select2} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select2}


    log to console          Perform operations in Xpand 1

Perform operations in Xpand 2
    [Documentation]    Make a connection to Xpand database 2 and execute queries

    # ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get FQDN text value' keyword
    # ${PORT_TEXT_VALUE_2} variable is passed from 'ServicesDashboardKeywords.robot' -> 'Get port text value' keyword
    # ${USERNAME_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Username' text value' keyword
    # ${DEFAULT_PASSWORD_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Default password' text value' keyword
    # ${PLATFORM_TEXT_VALUE_2} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> 'Click on 'Cloud Provider' radio button'
    # ${DEFAULT_CHARACTER_SET_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'default character set' value'

    connect    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2}  ${PORT_TEXT_VALUE_2}  ${USERNAME_TEXT_VALUE_2}  ${DEFAULT_PASSWORD_TEXT_VALUE_2}  "mariadb"  ${PLATFORM_TEXT_VALUE_2}  ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    log to console          FQFN: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2}, Port: ${PORT_TEXT_VALUE_2}, Username: ${USERNAME_TEXT_VALUE_2}, Password: ${DEFAULT_PASSWORD_TEXT_VALUE_2}, Platform: ${PLATFORM_TEXT_VALUE_2}, Charset: ${DEFAULT_CHARACTER_SET_TEXT_VALUE}

    exec                    CREATE DATABASE second;
    log to console          Created a database second
    exec                    USE second;
    log to console          Used database second
    exec                    CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1));
    log to console          Created table pet
    exec                    INSERT INTO pet VALUES ('tommy', 'mariadb', 'cat', 'm');
    log to console          Inserted record into table pet
    ${select1} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select1}
    exec                    UPDATE pet SET name = 'Batman', owner = 'MariaDB', species = 'Bat', sex = 'M';
    log to console          Updated record into table pet
    ${select2} =  select    SELECT * FROM pet;
    log to console          Selected all from table pet + ${select2}


    log to console          Perform operations in Xpand 2

Validate data in Xpand 1
    [Arguments]    ${REPLICATION_DIRECTION}
    [Documentation]    Validate data in Xpand 1

    # ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get FQDN text value' keyword
    # ${PORT_TEXT_VALUE} variable is passed from 'ServicesDashboardKeywords.robot' -> 'Get port text value' keyword
    # ${USERNAME_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Username' text value' keyword
    # ${DEFAULT_PASSWORD_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Default password' text value' keyword
    # ${PLATFORM_TEXT_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> 'Click on 'Cloud Provider' radio button'
    # ${DEFAULT_CHARACTER_SET_TEXT_VALUE} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'default character set' value'

    connect    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}  ${PORT_TEXT_VALUE}  ${USERNAME_TEXT_VALUE}  ${DEFAULT_PASSWORD_TEXT_VALUE}  "mariadb"  ${PLATFORM_TEXT_VALUE}  ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    log to console          FQFN: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}, Port: ${PORT_TEXT_VALUE}, Username: ${USERNAME_TEXT_VALUE}, Password: ${DEFAULT_PASSWORD_TEXT_VALUE}, Platform: ${PLATFORM_TEXT_VALUE}, Charset: ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    TRY
        IF    '${REPLICATION_DIRECTION}' == 'To'
            sleep    30
            ${select1} =  select    SHOW databases;
            log to console          ${select1}
            ${select_as_string} =    convert to string    ${select1}
            should contain    ${select_as_string}    'first'
            log to console    Validate data in Xpand 1
        END
    EXCEPT
        sleep    30
        ${select1} =  select    SHOW databases;
        log to console          ${select1}
        ${select_as_string} =    convert to string    ${select1}
        should contain    ${select_as_string}    'first'
        should contain    ${select_as_string}    'second'
    END

    log to console    Validate data in Xpand 1

Validate data in Xpand 2
    [Arguments]    ${REPLICATION_DIRECTION}
    [Documentation]    Validate data in Xpand 2

    # ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get FQDN text value' keyword
    # ${PORT_TEXT_VALUE_2} variable is passed from 'ServicesDashboardKeywords.robot' -> 'Get port text value' keyword
    # ${USERNAME_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Username' text value' keyword
    # ${DEFAULT_PASSWORD_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'Default password' text value' keyword
    # ${PLATFORM_TEXT_VALUE_2} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> 'Click on 'Cloud Provider' radio button'
    # ${DEFAULT_CHARACTER_SET_TEXT_VALUE_2} variable is passed from 'ConnectToServiceKeywords.robot' file -> 'Get 'default character set' value'

    connect    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2}  ${PORT_TEXT_VALUE_2}  ${USERNAME_TEXT_VALUE_2}  ${DEFAULT_PASSWORD_TEXT_VALUE_2}  "mariadb"  ${PLATFORM_TEXT_VALUE_2}  ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    log to console          FQFN: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2}, Port: ${PORT_TEXT_VALUE_2}, Username: ${USERNAME_TEXT_VALUE_2}, Password: ${DEFAULT_PASSWORD_TEXT_VALUE_2}, Platform: ${PLATFORM_TEXT_VALUE_2}, Charset: ${DEFAULT_CHARACTER_SET_TEXT_VALUE}

    TRY
        IF    '${REPLICATION_DIRECTION}' == 'From'
            sleep    30
            ${select2} =  select    SHOW databases;
            log to console          ${select2}
            ${select_as_string} =    convert to string    ${select2}
            should contain    ${select_as_string}    'second'
            log to console    Validate data in Xpand 2
        END
    EXCEPT
        sleep    30
        ${select2} =  select    SHOW databases;
        log to console          ${select2}
        ${select_as_string} =    convert to string    ${select2}
        should contain    ${select_as_string}    'first'
        should contain    ${select_as_string}    'second'

        log to console    Validate data in Xpand 2
    END

Connect to the current database
    [Documentation]   Connects to the current database, despite its type being Xpand or other.
    [Arguments]    ${TOPOLOGY}

    IF    '${topology}' == 'Distributed'
        Connect to Xpand database
    ELSE
        Connect To The Database
    END

    log to console    Connect to the current database

Connect to the current database without SSL
    [Documentation]   Connects to the current database, without SSL.
    [Arguments]    ${TOPOLOGY}

    IF    '${topology}' == 'Distributed'
        Connect to Xpand database without SSL certificate
    ELSE
        Connect to the database without SSL certificate
    END

    log to console    Connects to the current database, without SSL.

Expect unsuccessful connection to the DB
    [Documentation]    Expect unsuccessful connection to the DB
    run keyword and expect error    REGEXP: .*Can't connect to MySQL server.*    connect to the current database    ${TOPOLOGY}

    log to console    Expect unsuccessful connection to the DB
