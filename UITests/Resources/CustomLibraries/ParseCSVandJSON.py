import csv
import os
import json
from robot.api import logger


def parse_csv_file(topology):
    """Takes information from the pre-downloaded '.csv' of the authoritative ConfigManager sheet
    [https://mariadbcorp.atlassian.net/wiki/spaces/SKYENG/pages/1919516673/Configuration+Manager+SkySQL+2.0]

    Input parameter is ${topology}, returned are the 'variable:default_value' pairs from the respective columns.
        Examples:
        | &{dict1} = | Parse Csv File | ST |
        | &{dict2} = | Parse Csv File | Xpand |
        | Should Be Equal | ${dict1} | {'autocommit': 'on', 'cracklib_password_check': 'off'} |
        | Should Be Equal | ${dict2} | {'expire_logs_days': '4', 'auto_increment_increment': '1'} |
    """
    variable_value = {}
    dir_path = os.path.dirname(os.path.realpath(__file__))
    with open(f'{dir_path}/../TestData/ConfigurationManagementVariables.csv', 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            if row[topology] == 'Yes' and row['Active'] != 'No':
                variable_value[row['Parameter']] = row[f'Default value({topology})']
    return variable_value


def extract_bearer_token(log_entries):
    """
    Return only the logs which have an Authorization in them and extract the Bearer token from the first occurrence.
    """

    for entry in log_entries:
        if "Bearer" in str(entry["message"]):
            json_message_data = json.loads(str(entry["message"]))
            bearer_token = json_message_data['message']['params']['request']['headers']['Authorization']
            logger.console(f'Extract bearer token: {bearer_token}')
            return bearer_token
    logger.console('Bearer token not found in logs')
