# #------------------------------------------------------------------------------------------#
# # © 2020 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.                 #
 
# # This AWS Content is provided subject to the terms of the AWS Customer Agreement          #
# # available at http://aws.amazon.com/agreement or other written agreement between          #
# # Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.  #
# #------------------------------------------------------------------------------------------#

# from flask import Flask, Blueprint, Response
# import json 
# import requests

# # BASE_URL = 'http://192.168.68.101:5001/'
# # BASE_URL = 'red.santosoc.pvt.local'
# BASE_URL = 'http://red.santosoc.hosted.local:5001'

# app = Flask(__name__)
# blue_bp = Blueprint('blue_bp', __name__)

# @blue_bp.route('/')
# def index():

#     # print ("BASE_URL",BASE_URL)
#     # response = requests.get(f"{BASE_URL}")
#     # return Response(response.json(), mimetype="application/json", status=200)
#     return Response(json.dumps({"page":"blue"}), mimetype="application/json", status=200)

# app.register_blueprint(blue_bp, url_prefix='/')
# print("apps Preps")
# app.run(host='0.0.0.0', port=5000)
# print("apps Starts")




#------------------------------------------------------------------------------------------#
# © 2020 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.                 #
 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement          #
# available at http://aws.amazon.com/agreement or other written agreement between          #
# Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.  #
#------------------------------------------------------------------------------------------#

from flask import Flask, Blueprint, Response
import json 

app = Flask(__name__)
blue_bp = Blueprint('blue_bp', __name__)

@blue_bp.route('/')
def index():
    return Response(json.dumps({"page":"blue"}), mimetype="application/json", status=200)

app.register_blueprint(blue_bp, url_prefix='/')
print("apps Preps")
app.run(host='0.0.0.0', port=5001)
print("apps Starts")