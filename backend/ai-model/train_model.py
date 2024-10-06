import numpy as np
from model import AnomalyDetectionModel, save_model

# Example dataset (replace with real data)
X_train = np.random.rand(100, 10)  # 100 samples, 10 features

model = AnomalyDetectionModel()
model.train(X_train)
save_model(model, "model.pkl")