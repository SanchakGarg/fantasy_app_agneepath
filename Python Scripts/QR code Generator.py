import gspread
import firebase_admin
from firebase_admin import db
from oauth2client.service_account import ServiceAccountCredentials
import qrcode
from PIL import Image, ImageDraw, ImageFont
import PIL


# cred_obj = firebase_admin.credentials.Certificate('/mnt/7B466E99795271A1/Makerspace/agneepath_security_app/Python Scripts/agneepath-2024-firebase-adminsdk-mz69y-01fd8027f5.json')
# default_app = firebase_admin.initialize_app(cred_obj, {
	# 'databaseURL':'https://agneepath-2024-default-rtdb.asia-southeast1.firebasedatabase.app/'
	# })
# Set up credentials



scope = ['https://spreadsheets.google.com/feeds',
         'https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('/mnt/7B466E99795271A1/Makerspace/agneepath_app/Python Scripts/agneepath-2024-fab0c98b676f.json', scope)
client = gspread.authorize(creds)
sheet = client.open('TeamInfo-combined').sheet1
records = sheet.get_all_records()



# ref=db.reference('Guests')
# Print records
x=1
for i in records:

    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(i['ID'])
    qr.make(fit=True)

    qrimg = qr.make_image(fill_color="black", back_color="white")
    width,height = qrimg.size
    img = PIL.Image.new('RGB',(width-20,height + 160),'white')
    Image.Image.paste(img,qrimg ,(-10,170))

    myFont = ImageFont.truetype('c0648bt_.pfb', 16)
    I1 = ImageDraw.Draw(img)
    
    # Add Text to an image
    I1.text((10, 36),    "Name: %s\nDesignation: %s\nBatch: %s\nPhone Number: %s\nID: %s"%(i['Name'], i['Designation '], i['Batch'], i['Contact no.'], i['ID']), font=myFont, fill=(0, 0, 0))
    img.save('/mnt/7B466E99795271A1/Makerspace/agneepath_app/Python Scripts/QR/'+i['Name']+'.png')
    print(x)
    x+=1
