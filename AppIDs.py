# This file is for AppID testing

def AppID_testing(ticket_app_id=None, qe_test=None):
    ticket_app_id = input("Enter the App ID shown in the TBM ticket: ")
    qe_test = input("Enter the App ID shown on the phone: ")
    result = ""
    if ticket_app_id == qe_test:
        return True, "These IDs match"
    else:
        for ticket_id, qe_id in zip(ticket_app_id, qe_test):
            if ticket_id == qe_id:
                result = result + qe_id
            else:
                break
        print("The content matches up to the stopping point", result)
        return False, "These IDs do NOT match"


print(AppID_testing())
