import firebase_admin
from firebase_admin import credentials

cred = credentials.Certificate("clave.json")
firebase_admin.initialize_app(cred)

token = cred.get_access_token().access_token

print(token)