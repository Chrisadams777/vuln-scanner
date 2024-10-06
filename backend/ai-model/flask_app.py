from flask import Flask, request, jsonify
from model import load_model

app = Flask(__name__)
model = load_model()

@app.route("/predict", methods=["POST"])
def predict():
    data = request.json['data']
    result = model.predict([data])
    return jsonify({'result': result.tolist()})

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5001)
