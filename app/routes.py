from flask import render_template, request, redirect, url_for, flash
from app import app, db
from app.models import User
import re

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    name = request.form['name']
    email = request.form['email']
    phone = request.form.get('phone', '')
    message = request.form['message']

    # Server-side validation for the phone number
    if phone and not re.match(r'^\d{10}$', phone):
        flash('Phone number must be numeric and exactly 10 digits long.', 'error')
        return redirect(url_for('index'))

    # Create a new User object with the validated fields
    user = User(name=name, email=email, phone=phone, message=message)
    
    # Add the user to the database and commit the transaction
    db.session.add(user)
    db.session.commit()

        # Check if the email already exists in the database
    existing_user = User.query.filter_by(email=email).first()
    if existing_user:
        return "Email already exists in the database.", 400
    
    # If the email doesn't exist, create a new user record
    user = User(name=name, email=email, phone=phone, message=message)
    db.session.add(user)
    db.session.commit()
    
    return redirect(url_for('index'))

    # Redirect to the home page after successful submission
    flash('Form submitted successfully!', 'success')
    return redirect(url_for('index'))
