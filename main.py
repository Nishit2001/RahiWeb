from flask import Flask, render_template, request, session,redirect
from werkzeug.utils import secure_filename
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import os
from datetime import datetime
import math

local_host = False
mailn = 'yashmahajan1142@gmail.com'

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['uploader'] = "E:\\flask\\static\\img"
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_USE_TLS = 'True',
    MAIL_PORT = '587',
    MAIL_USERNAME = 'yashmahajan1142@gmail.com',
    MAIL_PASSWORD = 'Mahajan2001'
)
mail = Mail(app)
if local_host==True:
    app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:@localhost/team rahi"
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://epiz_27178991:LicYOdXDzI1@sql306.epizy.com/epiz_27178991_epiz_27178991_"

db = SQLAlchemy(app)


class Contents(db.Model):

    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phno = db.Column(db.String(12), nullable=False)
    date = db.Column(db.String(12),nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Blogs(db.Model):
    number = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    tag_line = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(12), nullable=False)
    content = db.Column(db.String(12), nullable=True)
    date = db.Column(db.String(20), nullable=False)
    by =  db.Column(db.String(20), nullable=False)
    img_file = db.Column(db.String(20), nullable=False)

@app.route("/")
def home():
    posts = Blogs.query.filter_by().all()
    last = math.ceil(len(posts)/4)
    page = request.args.get("page")
    if not str(page).isnumeric():
        page = 1

    page = int(page)
    if page==last:
        posts = posts[0:0+last]
    else:
        posts = posts[(len(posts)-4*(page-1))-4:len(posts)-4*(page-1)]
    if page==1:
        befor = "#"
        next = "/?page="+ str(page+1)

    elif page==last:
        befor = "/?page=" + str(page - 1)
        next = "#"

    else:
        befor = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)
    return render_template('index.html', posts=posts , befor=befor , next=next)


@app.route("/upload",methods = ['GET','POST'])
def upload():
    if 'user' in session and session['user'] == 'Nishit':
        if request.method == "POST":
            f = request.files["file"]
            f.save(os.path.join(app.config["uploader"],secure_filename(f.filename)))
            return "uploaded successfully"
    return "create session first"

@app.route("/delet/<string:sno>",methods = ['GET','POST'])
def delet(sno):
    if 'user' in session and session['user'] == 'Nishit':
        post = Blogs.query.filter_by(number=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/")


@app.route("/dashboard",methods=['GET','POST'])
def dashboard():

    if 'user' in session and session['user'] == 'Nishit':
        posts = Blogs.query.all()
        return render_template('dashboard.html',posts = posts)

    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if username == 'Nishit' and userpass == '1142':
            session['user'] = username
            posts = Blogs.query.all()
            return render_template('dashboard.html',posts = posts)


    return render_template('login.html')

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post = Blogs.query.filter_by(slug=post_slug).first()
    return render_template('post.html',post = post)

@app.route("/about")
def about():
    return render_template('about.html')

@app.route("/edit/<string:sno>",methods = ['GET','POST'])
def edit(sno):
    if 'user' in session and session['user'] == 'Nishit':
        if (request.method == 'POST'):
            title = request.form.get('title')
            tline = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            by = request.form.get('by')
            date = datetime.now()

            if sno == '0':
                post = Blogs(title=title,tag_line=tline,slug=slug,content=content,img_file=img_file,by=by)
                db.session.add(post)
                db.session.commit()
            else:
                post = Blogs.query.filter_by(number=sno).first()
                post.title = title
                post.tagline = tline
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.by = by
                db.session.commit()
                return redirect('/dashboard')
        post = Blogs.query.filter_by(number=sno).first()
        return render_template('edit.html',post = post,sno=sno)





@app.route("/contact",methods = ['GET','POST'])
def contact():
    if (request.method == 'POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        phone = request.form.get('phone')
        email = request.form.get('email')
        message = request.form.get('message')


        entry = Contents(name=name, phno=phone, date=datetime.now() ,email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('new message from blog', sender = email, recipients = mailn.split(), body = message +"\n" + phone)
    return render_template('contact.html')


app.run(debug=True)


