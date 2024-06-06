import gspread
import firebase_admin
from firebase_admin import db
import random
from oauth2client.service_account import ServiceAccountCredentials



cred_obj = firebase_admin.credentials.Certificate('/mnt/7B466E99795271A1/Makerspace/fantasy_app_agneepath/Python Scripts/agneepath-2024-firebase-adminsdk-mz69y-01fd8027f5.json')
default_app = firebase_admin.initialize_app(cred_obj, {
	'databaseURL':'https://fantasy-league-test-default-rtdb.asia-southeast1.firebasedatabase.app/'
	})
# Set up credentials
scope = ['https://spreadsheets.google.com/feeds',
         'https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('/mnt/7B466E99795271A1/Makerspace/fantasy_app_agneepath/Python Scripts/agneepath-2024-fab0c98b676f.json', scope)

# Create a client
client = gspread.authorize(creds)

# Open the Google Sheet
sheet = client.open('fantasy-league-datasheet').sheet1

# Get all records
records = sheet.get_all_records()
x=1
# Print records
for i in records:
    # print(i)

    n1=i['Name']
    # n=n1.split()
    s=i['Sports']
    # d=i['Designation ']
    c=i['Category']
    p=i['price']
    t=i['position']
    ref=db.reference('Athletes/%s'%s)

    # i1=i['ID']
    # if len(str(x))==1:
    #     i='000'+str(x)
    # elif len(str(x))==2:
    #     i='00'+str(x)
    # elif len(str(x))==3:
    #     i='0'+str(x)
    # if len(str(x))==4:
    #     i=str(x)
    
    
    # id=n[0][0]+n[-1][0]+i
    # print(id)
    y= str([c,p,t])
    ref.update({n1:y[1:-1]})
    x+=1