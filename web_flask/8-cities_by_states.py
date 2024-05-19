#!/usr/bin/python3
"""
Starts a Flask web application:
    - Listens on 0.0.0.0, port 5000
    - Uses storage for fetching data from the storage engine
    - Removes the current SQLAlchemy session after each request
    - Routes:
        -/cities_by_states: display a HTML page with a list of all States
                            and their cities.
"""
from models import storage
from flask import Flask
from flask import render_template

app = Flask(__name__)


@app.route("/cities_by_states", strict_slashes=False)
def cities_by_states():
    '''States/cities are sorted by name.'''
    states = storage.all("State")
    return render_template("8-cities_by_states.html", states=states)


@app.teardown_appcontext
def teardown_db(exception):
    """Removes the current SQLAlchemy Session"""
    storage.close()


if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000')
