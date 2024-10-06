import numpy as np
from sklearn.ensemble import IsolationForest

# Sample AI model for anomaly detection
class AnomalyDetectionModel:
    def __init__(self):
        # Initialize Isolation Forest model
        self.model = IsolationForest(n_estimators=100, contamination=0.1)
    
    def train(self, X_train):
        self.model.fit(X_train)
    
    def predict(self, X):
        return self.model.predict(X)

# Save or load the trained model using joblib
import joblib

def save_model(model, filename="model.pkl"):
    joblib.dump(model, filename)

def load_model(filename="model.pkl"):
    return joblib.load(filename)