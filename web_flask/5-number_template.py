#!/usr/bin/python3
"""
Starts a Flask web application
    Listen : on 0.0.0.0 port 5000
    Routes :
        /              : display "Hello HBNB!"
        /hbnb          : display "HBNB"
        /c/<text>      : display "C ", followed by the value of the
                    text variable (replace underscores with spaces)
        /python/<text> : display "Python", followed by the value of
                    the text variable
                    The default value of text is "is cool"
        /number/<n>: display "n is a number" only if n is an integer
        /number_template/<n>: display a HTML page only if n is an integer
"""

from flask import Flask
from flask import render_template
app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello_hbnb():
    '''Prints "Hello HBNB!" '''
    return "Hello HBNB!"


@app.route('/hbnb', strict_slashes=False)
def hbnb():
    '''Prints "HBNB" '''
    return "HBNB"


@app.route("/c/<text>", strict_slashes=False)
def c_text(text):
    '''Prints "C " followed by the value of the text variable
            with underscores replaced by spaces'''
    return 'C ' + text.replace('_', ' ')


@app.route('/python', strict_slashes=False)
@app.route('/python/<text>', strict_slashes=False)
def python_text(text="is cool"):
    '''Prints "Python " followed by the value of the text variable
            with underscores replaced by spaces
        Default text: "is cool"
    '''
    return 'Python ' + text.replace('_', ' ')


@app.route('/number/<int:n>', strict_slashes=False)
def number(n):
    '''Prints "n is a number" only if n is an integer'''
    return "{} is a number".format(n)


@app.route('/number_template/<int:n>', strict_slashes=False)
def number_template(n):
    '''Displays an HTML page only if n is an integer'''
    return render_template('5-number.html', number=n)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
