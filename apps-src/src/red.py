#------------------------------------------------------------------------------------------#
# © 2020 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.                 #
 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement          #
# available at http://aws.amazon.com/agreement or other written agreement between          #
# Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.  #
#------------------------------------------------------------------------------------------#

from flask import Flask, Blueprint, Response
import json 

app = Flask(__name__)
red_bp = Blueprint('red_bp', __name__)

@red_bp.route('/')
def index():
    return Response(json.dumps({"page":"red 1.0"}), mimetype="application/json", status=200)

app.register_blueprint(red_bp, url_prefix='/')
print("apps Preps")
app.run(host='0.0.0.0', port=5001)
print("apps Starts")