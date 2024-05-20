#!/usr/bin/python3
"""
Starts a Flask web application:
    - Listens on 0.0.0.0, port 5000
    - Uses storage for fetching data from the storage engine
    - Removes the current SQLAlchemy session after each request
    - Routes:
        - /states: HTML page with a list of all states.
        - /states/<id>: HTML page displaying the given state with <id>.
"""
from models import storage
from flask import Flask
from flask import render_template

app = Flask(__name__)


@app.route("/states", strict_slashes=False)
def states():
    '''Display HTML with States sorted by name'''
    states = storage.all("State")
    return render_template("9-states.html", state=states)


@app.route("/states/<id>", strict_slashes=False)
def states_id(id):
    '''Display HTML of a state by id'''
    for state in storage.all("State").values():
        if state.id == id:
            return render_template("9-states.html", state=state)
    return render_template("9-states.html")


@app.teardown_appcontext
def teardown_db(exception):
    """Removes the current SQLAlchemy Session"""
    storage.close()


if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000')
