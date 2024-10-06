import unittest
import numpy as np
from model import AnomalyDetectionModel

class TestAnomalyDetectionModel(unittest.TestCase):
    
    def setUp(self):
        self.model = AnomalyDetectionModel()
    
    def test_training(self):
        X_train = np.random.rand(100, 10)
        self.model.train(X_train)
        self.assertIsNotNone(self.model.model)
    
    def test_prediction(self):
        X_test = np.random.rand(1, 10)
        self.model.train(np.random.rand(100, 10))  # Train before predicting
        result = self.model.predict(X_test)
        self.assertIn(result[0], [-1, 1])  # Expect -1 or 1

if __name__ == '__main__':
    unittest.main()
