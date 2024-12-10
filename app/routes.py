from flask import Blueprint, render_template
from flask import render_template
from .repository import get_all_ideoms

bp = Blueprint('main', __name__)

# Home page
@bp.route('/', methods = ['GET']) 
def index():
    data = get_all_ideoms()
    return render_template("index.html", result=data)

# Project page
@bp.route('/project') 
def project():
    return render_template("project.html")

# Help page
@bp.route('/help') 
def help():
    return render_template("help.html")
